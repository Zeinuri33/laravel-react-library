/* global process */
// Menyalin service worker hasil build (public/build/sw.js) ke public/sw.js.
// SW harus berada di root agar scope-nya '/' dan mengontrol seluruh halaman aplikasi
// (PWA offline tidak akan berfungsi bila scope hanya /build/).
import { copyFileSync, existsSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const src = resolve(root, 'public/build/sw.js');
const dest = resolve(root, 'public/sw.js');

if (!existsSync(src)) {
    console.error('[postbuild] ERROR: public/build/sw.js tidak ditemukan. Pastikan vite-plugin-pwa berhasil dijalankan.');

    process.exit(1);
}

copyFileSync(src, dest);

console.log('[postbuild] Service worker disalin ke public/sw.js (scope: /)');
