import { createInertiaApp } from '@inertiajs/react';
import { TooltipProvider } from '@/components/ui/tooltip';
import { initializeTheme } from '@/hooks/use-appearance';
import AppLayout from '@/layouts/app-layout';
import AuthLayout from '@/layouts/auth-layout';
import SettingsLayout from '@/layouts/settings/layout';
import { Toaster } from "@/components/ui/sonner";
import { ThemeProvider } from '@/context/ThemeContext';
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

    case name === 'titikbaca':
      return null;

    case name.startsWith('titikbaca/'):
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
  strictMode: true,
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
