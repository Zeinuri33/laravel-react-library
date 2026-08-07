import inertia from '@inertiajs/vite';
import { wayfinder } from '@laravel/vite-plugin-wayfinder';
import tailwindcss from '@tailwindcss/vite';
import react from '@vitejs/plugin-react';
import { createHash } from 'node:crypto';
import { readFileSync } from 'node:fs';
import laravel from 'laravel-vite-plugin';
import { defineConfig } from 'vite';
import { VitePWA } from 'vite-plugin-pwa';

// Aset publik (public/) yang ikut di-precache oleh service worker.
// URL-nya ditulis absolut (mulai '/') agar benar setelah sw.js dipindah ke root.
const pwaAssets = [
    'logo-perpus.png',
    'favicon.svg',
    'pwa-64x64.png',
    'pwa-192x192.png',
    'pwa-512x512.png',
    'maskable-icon-512x512.png',
    'apple-touch-icon-180x180.png',
    'favicon.ico',
];

// Revision = hash konten file, sehingga precache ikon ikut diperbarui bila file berubah.
function pwaRevision(file) {
    return createHash('md5')
        .update(readFileSync(`public/${file}`))
        .digest('hex')
        .slice(0, 8);
}

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.tsx'],
            refresh: true,
        }),
        inertia(),
        react({
            babel: {
                plugins: ['babel-plugin-react-compiler'],
            },
        }),
        tailwindcss(),
        wayfinder({
            formVariants: true,
        }),
        // Progressive Web App: manifest + service worker (offline app shell).
        // Service worker di-build dari resources/js/sw.ts (strategi injectManifest),
        // lalu disalin ke public/sw.js oleh scripts/postbuild.mjs setelah `vite build`.
        // Dengan berada di root, scope SW otomatis '/' sehingga mengontrol seluruh aplikasi.
        VitePWA({
            strategies: 'injectManifest',
            srcDir: 'resources/js',
            filename: 'sw.ts',
            registerType: 'autoUpdate',
            // Blade template menangani HTML, jadi registrasi SW dilakukan manual
            // di resources/js/app.tsx.
            injectRegister: false,
            // Manifest dibuat statis di public/manifest.json (dirujuk dari Blade) —
            // generasi manifest oleh plugin dimatikan agar tidak ada entry precache
            // relatif (manifest.webmanifest) yang salah saat sw.js berada di root.
            // Ikon public ditambahkan manual lewat additionalManifestEntries dengan URL
            // absolut — includeAssets/includeManifestIcons menghasilkan URL relatif yang
            // salah karena sw.js berada di root sedangkan aset build di /build/.
            includeManifestIcons: false,
            manifest: false,
            injectManifest: {
                globPatterns: ['**/*.{js,css,woff2,woff,ttf,otf,svg,png,ico,webp,jpg,jpeg}'],
                additionalManifestEntries: [
                    // App shell Laravel ('/') — revision baru setiap build agar selalu segar.
                    { url: '/', revision: String(Date.now()) },
                    ...pwaAssets.map((file) => ({ url: `/${file}`, revision: pwaRevision(file) })),
                ],
                // SW berada di root (/sw.js) tapi aset build di /build/ — semua URL precache
                // relatif harus diubah menjadi absolut terhadap root aplikasi.
                manifestTransforms: [
                    (entries) => ({
                        manifest: entries.map((entry) =>
                            entry.url.startsWith('/') ? entry : { ...entry, url: `/build/${entry.url}` },
                        ),
                        warnings: [],
                    }),
                ],
            },
        }),
    ],

    server: {
        host: '0.0.0.0',
        port: 6001,
        watch: {
            usePolling: true,
            interval: 100,
        },
        hmr: {
            host: 'localhost',
        },
    },
});
