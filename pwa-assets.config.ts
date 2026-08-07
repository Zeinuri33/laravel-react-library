import { defineConfig, minimal2023Preset } from '@vite-pwa/assets-generator/config';

// Generates the full PWA icon set (192px, 512px, maskable, apple-touch-icon, favicon)
// from the existing library logo. Run: `npx pwa-assets-generator`
export default defineConfig({
    preset: minimal2023Preset,
    images: ['public/logo-perpus.png'],
});
