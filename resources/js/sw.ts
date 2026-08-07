// Service worker Digilib PWA.
// File ini di-bundle oleh vite-plugin-pwa (strategi injectManifest) menjadi
// public/sw.js (melalui scripts/postbuild.mjs) saat `npm run build`.
// Berjalan di lingkungan Web Worker, bukan DOM — type-check dimatikan karena
// lib webworker bertabrakan dengan lib DOM proyek ini.
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck
import { clientsClaim, skipWaiting } from 'workbox-core';
import { ExpirationPlugin } from 'workbox-expiration';
import { cleanupOutdatedCaches, precacheAndRoute } from 'workbox-precaching';
import { NavigationRoute, registerRoute } from 'workbox-routing';
import { NetworkFirst, StaleWhileRevalidate } from 'workbox-strategies';

declare let self: ServiceWorkerGlobalScope;

// Terapkan service worker versi baru segera (auto-update) dan ambil alih semua tab.
skipWaiting();
clientsClaim();

// Precache semua aset build (JS/CSS/ikon) + app shell Laravel ('/') yang
// diinjeksi vite-plugin-pwa ke __WB_MANIFEST.
precacheAndRoute(self.__WB_MANIFEST);
cleanupOutdatedCaches();

// Navigasi halaman: NetworkFirst — selalu segar saat online, melayani halaman
// yang pernah dikunjungi saat offline, dan fallback ke app shell yang
// di-precache bila jaringan tidak tersedia sama sekali.
const navigationHandler = async ({ request, event }) => {
    try {
        const strategy = new NetworkFirst({
            cacheName: 'digilib-pages',
            networkTimeoutSeconds: 3,
            plugins: [new ExpirationPlugin({ maxEntries: 50, maxAgeSeconds: 7 * 24 * 60 * 60 })],
        });

        const response = await strategy.handle({ request, event });

        if (response) {
            return response;
        }

        throw new Error('empty response');
    } catch {
        // Offline: layani app shell dari precache.
        const shell = await caches.match('/');

        if (shell) {
            return shell;
        }

        return Response.error();
    }
};

registerRoute(
    new NavigationRoute(navigationHandler, {
        // Route dinamis (API, storage, upload) tidak boleh dilayani oleh app shell.
        denylist: [/^\/api\//, /^\/storage\//, /^\/uploads\//, /^\/build\//],
    }),
);

// Font dari fonts.bunny.net — cache-first dengan revalidasi di latar belakang.
registerRoute(
    ({ url }) => url.origin === 'https://fonts.bunny.net',
    new StaleWhileRevalidate({ cacheName: 'digilib-fonts' }),
);

// Gambar same-origin (sampul ebook, dokumentasi) — cache-first dengan revalidasi.
// Path dinamis (/storage, /uploads, /api) tidak dicache agar konten yang
// dilindungi akses tidak tersimpan di cache lokal.
registerRoute(
    ({ request, url }) =>
        request.destination === 'image' &&
        url.origin === self.location.origin &&
        !url.pathname.startsWith('/storage/') &&
        !url.pathname.startsWith('/uploads/') &&
        !url.pathname.startsWith('/api/'),
    new StaleWhileRevalidate({
        cacheName: 'digilib-images',
        plugins: [new ExpirationPlugin({ maxEntries: 80, maxAgeSeconds: 30 * 24 * 60 * 60 })],
    }),
);
