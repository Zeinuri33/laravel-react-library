/* global process */
// Memverifikasi bahwa service worker hasil build memiliki URL precache yang benar.
// Jalankan: node scripts/verify-pwa.mjs
import { readFileSync } from 'node:fs';

const sw = readFileSync('public/sw.js', 'utf8');

// Precache entries tersimpan sebagai array JS dalam file minified, contoh:
// {"revision":null,"url":"/build/assets/app-x.js"}.
const marker = '"url":"';

const urls = [];
let idx = 0;

while ((idx = sw.indexOf(marker, idx)) !== -1) {
    const start = idx + marker.length;
    const end = sw.indexOf('"', start);

    if (end === -1) {
        break;
    }

    urls.push(sw.slice(start, end));
    idx = end + 1;
}

const bad = urls.filter((u) => {
    return (
        u.startsWith('assets/') || // relatif -> salah saat sw.js di root
        u.startsWith('manifest.') || // entry manifest relatif plugin
        u.startsWith('/build/build') || // prefix ganda
        u.includes('..') // path traversal
    );
});

console.log('total precache entries:', urls.length);
console.log('shell "/" present:', urls.includes('/'));
console.log('icons precached:', urls.filter((u) => /pwa-|maskable|apple-touch|favicon|logo-perpus/.test(u)).length, 'of 8');
console.log('sample asset urls:', urls.filter((u) => u.includes('app-')).slice(0, 2));
console.log('BROKEN entries:', bad.length > 0 ? bad : 'none');

const pass =
    urls.includes('/') &&
    urls.filter((u) => /pwa-|maskable|apple-touch|favicon|logo-perpus/.test(u)).length === 8 &&
    bad.length === 0;

console.log('RESULT:', pass ? 'PASS - semua URL precache absolut dan benar' : 'FAIL');

if (!pass) {
    process.exit(1);
}
