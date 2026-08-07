import { createInertiaApp } from '@inertiajs/react';
import { Toaster } from "@/components/ui/sonner";
import { TooltipProvider } from '@/components/ui/tooltip';
import { ThemeProvider } from '@/context/ThemeContext';
import { initializeTheme } from '@/hooks/use-appearance';
import AppLayout from '@/layouts/app-layout';
import AuthLayout from '@/layouts/auth-layout';
import SettingsLayout from '@/layouts/settings/layout';
import "leaflet/dist/leaflet.css";

const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

createInertiaApp({
  title: (title) => (title ? `${title} - ${appName} Perpustakaan Ibrahimy` : appName),
  layout: (name) => {
  switch (true) {
    case name === 'welcome':
      return null;

    case name === 'result':
      return null; 

    case name === 'docs' :
      return null;

    case name === 'resource-guides':
      return null;

    case name === 'zonabaca':
      return null;

    case name.startsWith('zonabaca/'):
      return null;

    case name === 'ebook/baca':
      return null;

    case name.startsWith('auth/'):
      return AuthLayout;

    case name.startsWith('settings/'):
      return [AppLayout, SettingsLayout];

    default:
      return AppLayout;
  }
},
  strictMode: false,
  withApp(app) {
    return (
    <ThemeProvider>
      <TooltipProvider delayDuration={0}>
        {app}

        {/* ✅ Tambahkan ini */}
        <Toaster richColors position="top-center" />
      </TooltipProvider>
    </ThemeProvider>
    )
  },
  progress: {
    color: '#4B5563',
  },
});

// This will set light / dark mode on load...
initializeTheme();

// Register the PWA service worker. Hanya di produksi — sw.js disalin ke root
// (public/sw.js) oleh scripts/postbuild.mjs setelah `vite build`, sehingga
// scope-nya '/' dan mengontrol seluruh aplikasi.
if (import.meta.env.PROD && 'serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        navigator.serviceWorker.register('/sw.js').catch((error) => {
            console.error('Service worker registration failed:', error);
        });
    });
}
