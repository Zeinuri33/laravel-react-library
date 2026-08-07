<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" @class(['dark' => ($appearance ?? 'system') == 'dark'])>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        {{-- PWA meta tags --}}
        <meta name="description" content="Perpustakaan digital Ibrahimy: baca ebook, dokumentasi, resource guide, dan zona baca di mana saja.">
        <meta name="theme-color" content="#22c55e">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <meta name="apple-mobile-web-app-title" content="Digilib">

        <link rel="manifest" href="/manifest.json">

        {{-- Inline script to detect system dark mode preference and apply it immediately --}}
        <script>
            (function() {
                const appearance = '{{ $appearance ?? "system" }}';

                if (appearance === 'system') {
                    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

                    if (prefersDark) {
                        document.documentElement.classList.add('dark');
                    }
                }
            })();
        </script>

        {{-- Inline style to set the HTML background color based on our theme in app.css --}}
        <style>
           html {
  /* mirip bg-white / gray-50 */
  background-color: oklch(0.985 0 0);
}

html.dark {
  /* mirip gray-900 */
  background-color: oklch(0.145 0 0);
}

            body {
                font-family: 'Inter', sans-serif;
            }
        </style>

        <link rel="icon" href="/logo-perpus.png" type="image/png" sizes="any">
        <link rel="apple-touch-icon" href="/apple-touch-icon-180x180.png">

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />

        <script>
    (() => {
        const theme =
            localStorage.getItem("docs-theme")

        if (theme !== "light") {
            document.documentElement.classList.add("dark")
        } else {
            document.documentElement.classList.remove("dark")
        }
    })()
</script>

        @viteReactRefresh
        @vite(['resources/css/app.css', 'resources/js/app.tsx', "resources/js/pages/{$page['component']}.tsx"])
        <x-inertia::head>
            <title>{{ config('app.name', 'Digilib') }}</title>
        </x-inertia::head>
    </head>
    <body class="font-sans antialiased">
        <x-inertia::app />
    </body>
</html>
