'use client';

import { Head, Link, usePage } from '@inertiajs/react';
import { Button } from '@/components/ui/button';
import { dashboard, login } from '@/routes';
import { useEffect, useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import AppearanceTabs from '@/components/appearance-tabs';
import { useTheme } from '@/context/ThemeContext';
import ContactForm from "@/components/contact-form"
import {
    BookOpen,
    FolderOpen,
    Search,
    SearchCheck,
    BookAudio,
    Book,
    FileText,
    Brain,
    ChevronDown,
    Mail,
    Phone,
    MapPin,
    Facebook,
    Twitter,
    Instagram,
} from 'lucide-react';
import Footer from '@/layouts/footer';

import { router } from '@inertiajs/react';

const COLOR_PRESETS = [
    {
        id: 'emerald',
        name: 'Emerald Green',
        color: '#10b981',
        light: { primary: '#059669', fg: '#ffffff' },
        dark: { primary: '#10b981', fg: '#022c22' },
    },
    {
        id: 'red',
        name: 'Ruby Red',
        color: '#ef4444',
        light: { primary: '#dc2626', fg: '#ffffff' },
        dark: { primary: '#ef4444', fg: '#fef2f2' },
    },
    {
        id: 'indigo',
        name: 'Deep Indigo',
        color: '#6366f1',
        light: { primary: '#4f46e5', fg: '#ffffff' },
        dark: { primary: '#818cf8', fg: '#312e81' },
    },
];

export default function Welcome() {
    const [inputValue, setInputValue] = useState('');
    const { themeAccent, setThemeAccent } = useTheme();

    const themeMaps = {
        emerald: {
            selection: 'selection:bg-emerald-500/30',
            text: 'text-emerald-600 dark:text-emerald-400',
            textHover:
                'group-hover:text-emerald-600 dark:group-hover:text-emerald-400',
            bgSoft: 'bg-emerald-500/10 dark:bg-emerald-500/20',
            bgGradient:
                'bg-gradient-to-r from-emerald-500 to-emerald-600 dark:from-emerald-600 dark:to-emerald-500',
            textGradient:
                'from-gray-900 via-emerald-600 to-emerald-500 dark:from-white dark:via-emerald-400 dark:to-emerald-500',
            borderHover:
                'hover:border-emerald-500/30 dark:hover:border-emerald-500/30',
            ring: 'focus:ring-emerald-500/50',
            focusWithinRing: 'focus-within:ring-emerald-500/40',
            shadow: 'hover:shadow-emerald-500/30 dark:hover:shadow-emerald-500/30',
            shadowGlow: 'dark:shadow-2xl dark:shadow-emerald-500/10',
            glow: 'from-emerald-500/10',
            line: 'from-emerald-500/60 to-emerald-500',
            orb: 'bg-emerald-500/20 blur-[150px]',
            heroOrb: 'bg-emerald-500/20',
            textWhite: 'text-white',
        },
        red: {
            selection: 'selection:bg-red-500/30',
            text: 'text-red-600 dark:text-red-400',
            textHover: 'group-hover:text-red-600 dark:group-hover:text-red-400',
            bgSoft: 'bg-red-500/10 dark:bg-red-500/20',
            bgGradient:
                'bg-gradient-to-r from-red-500 to-red-600 dark:from-red-600 dark:to-red-500',
            textGradient:
                'from-gray-900 via-red-600 to-red-500 dark:from-white dark:via-red-400 dark:to-red-500',
            borderHover: 'hover:border-red-500/30 dark:hover:border-red-500/30',
            ring: 'focus:ring-red-500/50',
            focusWithinRing: 'focus-within:ring-red-500/40',
            shadow: 'hover:shadow-red-500/30 dark:hover:shadow-red-500/30',
            shadowGlow: 'dark:shadow-2xl dark:shadow-red-500/10',
            glow: 'from-red-500/10',
            line: 'from-red-500/60 to-red-500',
            orb: 'bg-red-500/20 blur-[150px]',
            heroOrb: 'bg-red-500/20',
            textWhite: 'text-white',
        },
        indigo: {
            selection: 'selection:bg-indigo-500/30',
            text: 'text-indigo-600 dark:text-indigo-400',
            textHover:
                'group-hover:text-indigo-600 dark:group-hover:text-indigo-400',
            bgSoft: 'bg-indigo-500/10 dark:bg-indigo-500/20',
            bgGradient:
                'bg-gradient-to-r from-indigo-500 to-indigo-600 dark:from-indigo-600 dark:to-indigo-500',
            textGradient:
                'from-gray-900 via-indigo-600 to-indigo-500 dark:from-white dark:via-indigo-400 dark:to-indigo-500',
            borderHover:
                'hover:border-indigo-500/30 dark:hover:border-indigo-500/30',
            ring: 'focus:ring-indigo-500/50',
            focusWithinRing: 'focus-within:ring-indigo-500/40',
            shadow: 'hover:shadow-indigo-500/30 dark:hover:shadow-indigo-500/30',
            shadowGlow: 'dark:shadow-2xl dark:shadow-indigo-500/10',
            glow: 'from-indigo-500/10',
            line: 'from-indigo-500/60 to-indigo-500',
            orb: 'bg-indigo-500/20 blur-[150px]',
            heroOrb: 'bg-indigo-500/20',
            textWhite: 'text-white',
        },
    };

    const tc =
        themeMaps[themeAccent as keyof typeof themeMaps] || themeMaps.emerald;

    const handleSearch = (e: React.FormEvent) => {
        e.preventDefault();

        console.log('🔥 SUBMIT JALAN:', inputValue);

        if (!inputValue.trim()) return;

        router.get('/result', {
            q: inputValue,
        });
    };

    const { auth } = usePage().props;
    const userName = auth.user?.name || 'Pemustaka';
    const [open, setOpen] = useState(false);
    const [scrolled, setScrolled] = useState(false);

    useEffect(() => {
        const handleScroll = () => {
            setScrolled(window.scrollY > 10);
        };

        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);

    const [openIndex, setOpenIndex] = useState<number | null>(null);

    const faqs = [
        {
            q: 'Apa itu Digilib Ibrahimy?',
            a: 'Digilib adalah layanan perpustakaan digital yang memudahkan pengguna mengakses berbagai koleksi secara online.',
        },
        {
            q: 'Bagaimana cara mencari buku atau jurnal?',
            a: 'Gunakan fitur pencarian di halaman utama atau melalui menu OPAC untuk menemukan koleksi yang diinginkan.',
        },
        {
            q: 'Apakah semua koleksi bisa diakses secara gratis?',
            a: 'Sebagian besar koleksi dapat diakses secara gratis, namun beberapa mungkin memiliki batasan akses tertentu.',
        },
        {
            q: 'Bagaimana cara mengakses e-book?',
            a: 'Masuk ke menu E-Book, pilih koleksi yang diinginkan, lalu klik untuk membaca atau mengunduh.',
        },
        {
            q: 'Apakah saya perlu login untuk menggunakan layanan?',
            a: 'Beberapa fitur memerlukan login untuk pengalaman yang lebih lengkap, seperti menyimpan atau mengunduh koleksi.',
        },
        {
            q: 'Apa fungsi Repository?',
            a: 'Repository berisi karya ilmiah seperti skripsi, tesis, dan publikasi civitas akademika.',
        },
        {
            q: 'Bagaimana cara menggunakan Ibrahimy AI?',
            a: 'Gunakan fitur Ibrahimy AI untuk membantu pencarian informasi atau rekomendasi koleksi secara cerdas.',
        },
        {
            q: 'Siapa yang bisa menggunakan Digilib?',
            a: 'Digilib dapat digunakan oleh mahasiswa, dosen, dan masyarakat umum sesuai dengan kebijakan akses.',
        },
    ];

    //animasi search bar
    const texts = [
        'Cari koleksi...',
        'Cari Buku...',
        'Cari Jurnal...',
        'Cari Skripsi...',
        'Cari Artikel...',
    ];

    const [textIndex, setTextIndex] = useState(0);
    const [displayText, setDisplayText] = useState('');
    const [charIndex, setCharIndex] = useState(0);

    useEffect(() => {
        if (inputValue.length > 0) return;

        const currentText = texts[textIndex];

        const interval = setInterval(() => {
            setDisplayText(currentText.slice(0, charIndex));

            setCharIndex((prev) => {
                const next = prev + 1;

                // kalau sudah selesai ngetik 1 kata
                if (next > currentText.length) {
                    clearInterval(interval);

                    setTimeout(() => {
                        setTextIndex((t) => (t + 1) % texts.length);
                        setCharIndex(0);
                    }, 200);

                    return prev;
                }

                return next;
            });
        }, 120);

        return () => clearInterval(interval);
    }, [charIndex, textIndex, inputValue]);

    const menus = [
        {
            title: 'Pedoman Layanan',
            desc: 'Panduan penggunaan layanan perpustakaan secara lengkap.',
            href: '/docs',
            icon: BookOpen,
        },
        {
            title: 'Repository',
            desc: 'Akses koleksi karya ilmiah dan penelitian digital.',
            href: 'https://repository.ibrahimy.ac.id/',
            icon: FolderOpen,
        },
        {
            title: 'OPAC',
            desc: 'Cari buku dan koleksi perpustakaan dengan cepat.',
            href: 'https://opac.lib.ibrahimy.ac.id/',
            icon: Search,
        },
        {
            title: 'E-Book',
            desc: 'Baca buku digital kapan saja dan di mana saja.',
            href: 'https://ibrahimy.perpustakaan.co.id/',
            icon: Book,
        },
        {
            title: 'Jurnal Perpustakaan',
            desc: 'Kumpulan jurnal akademik dan ilmiah terbaru.',
            href: 'https://imjiss.ibrahimy.ac.id/',
            icon: FileText,
        },
        {
            title: 'Digilib Search',
            desc: 'Pencarian referensi dan koleksi perpustakaan dalam satu halaman.',
            href: 'https://digilib.ibrahimy.ac.id/result',
            icon: SearchCheck,
        },
        {
            title: 'Katalog Skripsi',
            desc: 'Katalog online Skripsi dan Tugas Akhir Mahasiswa',
            href: 'https://layanan.lib.ibrahimy.ac.id/katalog-skripsi',
            icon: BookAudio,
        },
        {
            title: 'Ibrahimy AI',
            desc: 'Asisten pintar untuk membantu pencarian informasi.',
            href: '#',
            icon: Brain,
        },
    ];

    return (
        <>
            <Head title="Home" />

            <div
                className={`relative min-h-screen overflow-hidden bg-slate-50 font-sans text-foreground transition-all duration-500 dark:bg-slate-950 ${tc.selection}`}
            >
                {/* ORB BACKGROUND */}
                <div
                    className={`pointer-events-none fixed top-1/2 left-1/2 -z-10 h-[600px] w-[800px] -translate-x-1/2 -translate-y-1/2 rounded-full ${tc.orb}`}
                ></div>

                <header
                    className={`fixed top-0 left-0 z-[60] w-full transition-all duration-300 ${open ? 'pointer-events-none opacity-0' : 'opacity-100'
                        } ${scrolled
                            ? 'border-b border-gray-200/20 bg-white/70 shadow-sm backdrop-blur-xl dark:border-gray-800/30 dark:bg-gray-950/70'
                            : 'bg-transparent'
                        }`}
                >
                    <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-4">
                        {/* LOGO */}
                        <Link href="/" className="flex items-center gap-3">
                            <img
                                src="/kubah.png"
                                className="h-10 dark:hidden"
                                alt="Logo"
                            />

                            <img
                                src="/kubah-putih.png"
                                className="hidden h-10 dark:block"
                                alt="Logo Dark"
                            />

                            <motion.div
                                animate={{
                                    opacity: open ? 0.5 : 1,
                                    scale: open ? 0.98 : 1,
                                }}
                                transition={{
                                    type: 'spring',
                                    stiffness: 200,
                                    damping: 20,
                                }}
                            >
                                <h1
                                    className={`text-sm font-bold bg-gradient-to-r bg-clip-text text-transparent ${tc.textGradient}`}
                                >
                                    Digital Library
                                </h1>

                                <p className="text-xs text-gray-500 dark:text-gray-400">
                                    Perpustakaan Ibrahimy
                                </p>
                            </motion.div>
                        </Link>

                        {/* DESKTOP */}
                        <div className="hidden items-center gap-6 md:flex">
                            <nav className="flex gap-6 text-sm font-medium">
                                <a
                                    href="#home"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    Home
                                </a>

                                <a
                                    href="#layanan"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    Layanan
                                </a>

                                <a
                                    href="#FAQ"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    FAQ
                                </a>

                                <a
                                    href="#kontak"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    Kontak
                                </a>
                            </nav>
                            <Link
                                href='/docs'
                                className={`inline-flex items-center justify-center gap-2 rounded-md px-7 py-2.5 text-sm font-semibold shadow-lg transition-all duration-300 hover:scale-105 focus:ring-2 focus:ring-offset-2 focus:outline-none active:scale-95 disabled:pointer-events-none disabled:opacity-50 ${tc.bgGradient} ${tc.textWhite} ${tc.shadow} ${tc.ring}`}
                            >
                                Panduan
                            </Link>

                            {/* Color Presets */}
                            <div className="flex items-center gap-2 border-l border-gray-300 pl-6 dark:border-gray-700">
                                {COLOR_PRESETS.map((p) => (
                                    <button
                                        key={p.id}
                                        onClick={() => setThemeAccent(p.id)}
                                        className={`h-5 w-5 rounded-full transition-all hover:scale-110 ${themeAccent === p.id
                                            ? `scale-110 ring-2 ring-offset-2 ${tc.ring}`
                                            : 'opacity-70'
                                            }`}
                                        style={{ backgroundColor: p.color }}
                                        title={p.name}
                                    />
                                ))}
                            </div>

                            <AppearanceTabs />
                        </div>

                        {/* MOBILE BUTTON */}
                        <div className="md:hidden">
                            <button
                                onClick={() => setOpen(!open)}
                                className="relative h-6 w-6"
                            >
                                <motion.span
                                    className="absolute top-0 left-0 h-[2px] w-6 bg-foreground"
                                    animate={{
                                        rotate: open ? 45 : 0,
                                        y: open ? 8 : 0,
                                    }}
                                />
                                <motion.span
                                    className="absolute top-[8px] left-0 h-[2px] w-6 bg-foreground"
                                    animate={{ opacity: open ? 0 : 1 }}
                                />
                                <motion.span
                                    className="absolute top-[16px] left-0 h-[2px] w-6 bg-foreground"
                                    animate={{
                                        rotate: open ? -45 : 0,
                                        y: open ? -8 : 0,
                                    }}
                                />
                            </button>
                        </div>
                    </div>
                </header>
                {/* MOBILE MENU */}
                <AnimatePresence>
                    {open && (
                        <>
                            {/* OVERLAY (NO BLUR) */}
                            <motion.div
                                initial={{ opacity: 0 }}
                                animate={{ opacity: 1 }}
                                exit={{ opacity: 0 }}
                                className="fixed inset-0 z-40 bg-black/30"
                                onClick={() => setOpen(false)}
                            />

                            {/* MENU FULLSCREEN */}
                            <motion.div
                                initial={{ y: -100, opacity: 0 }}
                                animate={{ y: 0, opacity: 1 }}
                                exit={{ y: -100, opacity: 0 }}
                                transition={{
                                    type: 'spring',
                                    stiffness: 260,
                                    damping: 20,
                                }}
                                className="fixed top-0 left-0 z-[70] flex w-full flex-col bg-background p-6"
                            >
                                {/* HEADER DI DALAM MENU */}
                                <div className="mb-8 flex items-center justify-between">
                                    {/* LEFT */}
                                    <h1 className="text-lg font-semibold">
                                        Digital Library
                                    </h1>

                                    {/* RIGHT (GROUP) */}
                                    <div className="flex items-center gap-3">
                                        <div className="mr-2 flex items-center gap-2">
                                            {COLOR_PRESETS.map((p) => (
                                                <button
                                                    key={p.id}
                                                    onClick={() => setThemeAccent(p.id)}
                                                    className={`h-5 w-5 rounded-full transition-all hover:scale-110 ${themeAccent === p.id
                                                        ? `scale-110 ring-2 ring-offset-2 ${tc.ring}`
                                                        : 'opacity-70'
                                                        }`}
                                                    style={{
                                                        backgroundColor: p.color,
                                                    }}
                                                    title={p.name}
                                                />
                                            ))}
                                        </div>

                                        <AppearanceTabs />

                                        <button
                                            onClick={() => setOpen(false)}
                                            className="relative h-6 w-6"
                                        >
                                            <motion.span
                                                className="absolute top-0 left-0 h-[2px] w-6 bg-foreground"
                                                initial={{ rotate: 0 }}
                                                animate={{ rotate: 45, y: 8 }}
                                            />
                                            <motion.span
                                                className="absolute top-[16px] left-0 h-[2px] w-6 bg-foreground"
                                                initial={{ rotate: 0 }}
                                                animate={{ rotate: -45, y: -8 }}
                                            />
                                        </button>
                                    </div>
                                </div>

                                {/* NAV */}
                                <nav className="flex flex-col gap-5 text-base font-medium">
                                    <a
                                        href="#home"
                                        onClick={() => setOpen(false)}
                                    >
                                        Home
                                    </a>
                                    <a
                                        href="#layanan"
                                        onClick={() => setOpen(false)}
                                    >
                                        Layanan
                                    </a>
                                    <a
                                        href="#FAQ"
                                        onClick={() => setOpen(false)}
                                    >
                                        FAQ
                                    </a>
                                    <a
                                        href="#kontak"
                                        onClick={() => setOpen(false)}
                                    >
                                        Kontak
                                    </a>
                                </nav>

                                {/* BUTTON */}
                                <div className="mt-auto pt-6">
                                    {auth.user ? (
                                        <Link href={dashboard()}>
                                            <Button className="w-full rounded-full">
                                                Dashboard
                                            </Button>
                                        </Link>
                                    ) : (
                                        <Link href='/docs'>
                                            <Button
                                                className={`w-full rounded-md px-4 py-6 text-base font-semibold shadow-lg transition-all duration-300 hover:scale-[1.02] focus:ring-2 focus:ring-offset-2 focus:outline-none active:scale-[0.98] disabled:pointer-events-none disabled:opacity-50 ${tc.bgGradient} ${tc.textWhite} ${tc.shadow} ${tc.ring}`}
                                            >
                                                Panduan
                                            </Button>
                                        </Link>
                                    )}
                                </div>
                            </motion.div>
                        </>
                    )}
                </AnimatePresence>

                {/* HERO */}
                <section
                    id="home"
                    className="relative mx-auto max-w-7xl px-6 md:px-12"
                >
                    {/* BACKGROUND BLUR */}
                    <motion.div
                        className="pointer-events-none absolute inset-0 z-0 grid grid-cols-2 -space-x-52 opacity-60 dark:opacity-30"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ duration: 1 }}
                    >
                        <div
                            className={`h-64 rounded-full mix-blend-multiply blur-[130px] dark:mix-blend-lighten ${tc.heroOrb}`}
                        ></div>
                        <div
                            className={`mt-32 h-64 rounded-full mix-blend-multiply blur-[130px] dark:mix-blend-lighten ${tc.heroOrb}`}
                        ></div>
                    </motion.div>

                    {/* HERO CONTENT */}
                    <motion.div
                        className="relative ml-auto pt-36"
                        initial={{ opacity: 0, y: 40 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: 0.8, ease: 'easeOut' }}
                    >
                        <div className="mx-auto text-center lg:w-2/3">
                            {/* LOGO */}
                            <motion.div
                                initial={{ opacity: 0, scale: 0.8 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{ duration: 0.6 }}
                            >
                                <img
                                    src="/kubah.png"
                                    alt="Kubah"
                                    className="mx-auto w-45 md:w-45 dark:hidden"
                                />
                                <img
                                    src="/kubah-putih.png"
                                    alt="Kubah Dark"
                                    className="mx-auto hidden w-45 md:w-45 dark:block"
                                />
                            </motion.div>

                            {/* TITLE */}
                            <motion.h1
                                className="text-center text-4xl leading-[1.05] font-extrabold tracking-normal text-gray-900 md:text-5xl lg:text-6xl xl:text-7xl dark:text-white"
                                initial={{ opacity: 0, y: 30 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.2, duration: 0.6 }}
                            >
                                Ibrahimy <br />
                                <span
                                    className={`bg-gradient-to-r bg-clip-text text-transparent ${tc.textGradient}`}
                                >
                                    Digital Library
                                </span>
                            </motion.h1>

                            {/* SEARCH FORM */}
                            <motion.div
                                className="mt-6 flex justify-center"
                                initial={{ opacity: 0, y: 20 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.35, duration: 0.6 }}
                            >
                                <form
                                    onSubmit={handleSearch}
                                    className="relative w-full max-w-lg"
                                >
                                    <input
                                        type="text"
                                        value={inputValue}
                                        onChange={(e) => setInputValue(e.target.value)}
                                        className="w-full rounded-xl bg-white dark:bg-gray-900 px-5 py-4 pr-28 text-gray-900 dark:text-gray-100 shadow-lg focus:outline-none"
                                    />

                                    {inputValue.length === 0 && (
                                        <div className="absolute left-5 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none">
                                            {displayText}
                                            <span className="animate-pulse">|</span>
                                        </div>
                                    )}

                                    <button
                                        type="submit"
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 cursor-pointer rounded-md px-6 py-2.5 text-sm font-semibold transition-all duration-300 ${tc.bgGradient} ${tc.textWhite} ${tc.shadow} ${tc.ring} shadow-md`}
                                    >
                                        Cari
                                    </button>
                                </form>
                            </motion.div>

                            {/* DESC */}
                            <motion.p
                                className="mt-4 text-gray-400 dark:text-gray-400 text-sm"
                                initial={{ opacity: 0 }}
                                animate={{ opacity: 1 }}
                                transition={{ delay: 0.5 }}
                            >
                                Digilib memudahkan pengguna mengakses dan menelusuri koleksi.
                            </motion.p>
                        </div>

                        {/* IMAGE */}
                        <motion.div
                            className="perspective-1000 mt-32 hidden md:block"
                            initial={{ opacity: 0, scale: 0.95, y: 40 }}
                            animate={{ opacity: 1, scale: 1, y: 0 }}
                            transition={{
                                delay: 0.6,
                                duration: 0.8,
                                ease: 'easeOut',
                            }}
                        >
                            <div className="relative mx-auto w-[1000px] max-w-full transition-transform duration-700 hover:scale-[1.02]">
                                {/* Glow behind image */}
                                <div
                                    className={`absolute -inset-2 bg-gradient-to-r opacity-40 blur-3xl dark:opacity-20 ${tc.glow}`}
                                ></div>

                                <img
                                    src="/digilib.png"
                                    alt="Digilib Light"
                                    className="relative mx-auto w-full rounded-3xl border border-white/40 shadow-[0_20px_60px_-15px_rgba(0,0,0,0.1)] transition-shadow duration-500 hover:shadow-[0_30px_70px_-15px_rgba(0,0,0,0.2)] dark:hidden"
                                />

                                <img
                                    src="/digilib-dark.png"
                                    alt="Digilib Dark"
                                    className="relative mx-auto hidden w-full rounded-3xl border border-gray-800/60 shadow-[0_20px_60px_-15px_rgba(0,0,0,0.3)] transition-shadow duration-500 hover:shadow-[0_30px_70px_-15px_rgba(0,0,0,0.5)] dark:block"
                                />
                            </div>
                        </motion.div>
                    </motion.div>

                    {/* MARQUEE */}
                    <motion.div
                        className="relative my-21 overflow-hidden"
                        initial={{ opacity: 0 }}
                        whileInView={{ opacity: 1 }}
                        viewport={{ once: true }}
                        transition={{ duration: 0.6 }}
                        style={{
                            WebkitMaskImage:
                                'linear-gradient(to right, transparent, black 10%, black 90%, transparent)',
                            maskImage:
                                'linear-gradient(to right, transparent, black 10%, black 90%, transparent)',
                        }}
                    >
                        <div
                            className="flex w-max items-center gap-12"
                            style={{ animation: 'marquee 25s linear infinite' }}
                        >
                            {[...Array(2)]
                                .flatMap(() => [
                                    '/apps-logo/0.png',
                                    '/apps-logo/1.png',
                                    '/apps-logo/2.png',
                                    '/apps-logo/3.png',
                                    '/apps-logo/4.png',
                                    '/apps-logo/5.png',
                                    '/apps-logo/6.png',
                                    '/apps-logo/7.png',
                                    '/apps-logo/8.png',
                                ])
                                .map((src, i) => (
                                    <a
                                        key={i}
                                        className="group flex items-center justify-center"
                                    >
                                        <img
                                            src={src}
                                            className="h-9 w-auto grayscale transition duration-300 group-hover:grayscale-0"
                                            loading="lazy"
                                            alt={`logo-${i}`}
                                        />
                                    </a>
                                ))}
                        </div>
                        <style>
                            {`
                            @keyframes marquee {
                                0% { transform: translateX(0); }
                                100% { transform: translateX(-50%); }
                            }
                            `}
                        </style>
                    </motion.div>
                </section>

                <section id="layanan" className="py-32">
                    <div className="mx-auto max-w-7xl px-6 lg:px-8">
                        {/* HEADER */}
                        <motion.div
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true, amount: 0.4 }}
                            transition={{ duration: 0.6, ease: 'easeOut' }}
                            className="mb-16 text-center"
                        >
                            <span
                                className={`inline-block rounded-md px-4 py-1.5 text-sm font-bold tracking-wide ${tc.bgSoft} ${tc.text}`}
                            >
                                LAYANAN
                            </span>

                            <h2 className="mt-6 text-4xl font-extrabold tracking-tight text-gray-900 md:text-5xl dark:text-white">
                                Akses Cepat
                            </h2>

                            <p className="mx-auto mt-4 max-w-2xl text-gray-600 dark:text-gray-400">
                                berbagai layanan digital perpustakaan dengan
                                mudah, cepat, dan terintegrasi.
                            </p>
                        </motion.div>

                        {/* GRID */}
                        <motion.div
                            className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3"
                            initial="hidden"
                            whileInView="show"
                            viewport={{ once: true, amount: 0.2 }}
                            variants={{
                                hidden: {},
                                show: {
                                    transition: {
                                        staggerChildren: 0.12,
                                    },
                                },
                            }}
                        >
                            {menus.map((item, i) => {
                                const Icon = item.icon;

                                return (
                                    <motion.a
                                        key={i}
                                        href={item.href}
                                        initial={{ opacity: 0, y: 25 }}
                                        whileInView={{ opacity: 1, y: 0 }}
                                        viewport={{ once: true, amount: 0.2 }}
                                        transition={{
                                            duration: 0.5,
                                            ease: 'easeOut',
                                            delay: i * 0.08,
                                        }}
                                        className={`group relative overflow-hidden rounded-xl border border-slate-200/50 bg-white/80 p-10 shadow-lg shadow-slate-200/50 backdrop-blur-md transition-all duration-300 ease-out hover:-translate-y-1 hover:shadow-xl dark:border-slate-800/50 dark:bg-slate-900/80 ${tc.shadowGlow} ${tc.shadow}`}
                                    >
                                        {/* GRID DECORATION */}
                                        <div
                                            className={`pointer-events-none absolute -top-12 -right-6 h-96 w-96 opacity-[0.07] ${tc.text}`}
                                            style={{
                                                backgroundImage: `
                                                    linear-gradient(to right, currentColor 1px, transparent 1px),
                                                    linear-gradient(to bottom, currentColor 1px, transparent 1px)
                                                `,
                                                backgroundSize: '45px 45px',
                                                maskImage:
                                                    'radial-gradient(circle at top right, black 40%, transparent 80%)',
                                                WebkitMaskImage:
                                                    'radial-gradient(circle at top right, black 40%, transparent 80%)',
                                            }}
                                        ></div>
                                        {/* GLOW */}
                                        <div
                                            className={`absolute inset-0 rounded-xl bg-gradient-to-br via-transparent to-transparent opacity-0 transition duration-500 group-hover:opacity-100 ${tc.glow}`}
                                        ></div>

                                        {/* CONTENT */}
                                        <div className="relative z-10 flex h-full flex-col">
                                            {/* ICON */}
                                            <div
                                                className={`mb-8 flex h-16 w-16 items-center justify-center rounded-2xl shadow-inner transition-transform duration-500 group-hover:scale-110 group-hover:-rotate-6 ${tc.bgSoft} ${tc.text}`}
                                            >
                                                <Icon className="h-8 w-8 drop-shadow-sm" />
                                            </div>

                                            {/* TITLE */}
                                            <h3
                                                className={`text-2xl font-bold tracking-tight text-gray-900 transition-colors duration-300 dark:text-white ${tc.textHover}`}
                                            >
                                                {item.title}
                                            </h3>

                                            {/* DESC */}
                                            <p className="mt-3 text-base leading-relaxed font-medium text-gray-600 dark:text-gray-400">
                                                {item.desc}
                                            </p>
                                        </div>

                                        {/* BOTTOM LINE */}
                                        <span
                                            className={`absolute bottom-0 inset-x-6 h-[6px] scale-x-0 origin-center rounded-full bg-gradient-to-r transition-transform duration-700 ease-[cubic-bezier(0.22,1,0.36,1)] group-hover:scale-x-100 ${tc.line}`}
                                        ></span>
                                    </motion.a>
                                );
                            })}
                        </motion.div>
                    </div>
                </section>

                <section id="FAQ" className="py-32">
                    <div className="mx-auto max-w-4xl px-6">
                        {/* HEADER */}
                        <motion.div
                            className="mb-12 text-center"
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true, amount: 0.4 }}
                            transition={{ duration: 0.6, ease: 'easeOut' }}
                        >
                            <span
                                className={`inline-block rounded-md px-4 py-1.5 text-sm font-bold tracking-wide ${tc.bgSoft} ${tc.text}`}
                            >
                                FAQ
                            </span>

                            <h2 className="mt-6 text-4xl font-extrabold tracking-tight text-gray-900 md:text-5xl dark:text-white">
                                Pertanyaan Umum
                            </h2>

                            <p className="mt-4 text-gray-600 dark:text-gray-400">
                                Berikut beberapa pertanyaan yang sering
                                ditanyakan terkait layanan Digilib.
                            </p>
                        </motion.div>

                        {/* FAQ LIST */}
                        <motion.div
                            className="space-y-4"
                            initial="hidden"
                            whileInView="show"
                            viewport={{ once: true, amount: 0.2 }}
                            variants={{
                                hidden: {},
                                show: {
                                    transition: {
                                        staggerChildren: 0.1,
                                    },
                                },
                            }}
                        >
                            {faqs.map((item, i) => (
                                <motion.div
                                    key={i}
                                    variants={{
                                        hidden: {
                                            opacity: 0,
                                            y: 20,
                                            scale: 0.98,
                                        },
                                        show: { opacity: 1, y: 0, scale: 1 },
                                    }}
                                    transition={{
                                        duration: 0.5,
                                        ease: 'easeOut',
                                    }}
                                    className={`group overflow-hidden rounded-xl border border-slate-200/50 bg-white/80 shadow-lg shadow-slate-200/50 backdrop-blur-md transition-all duration-300 ease-out hover:-translate-y-1 hover:shadow-xl dark:border-slate-800/50 dark:bg-slate-900/80 ${tc.shadowGlow} ${tc.borderHover} ${tc.shadow}`}
                                >
                                    {/* QUESTION */}
                                    <button
                                        onClick={() =>
                                            setOpenIndex(
                                                openIndex === i ? null : i,
                                            )
                                        }
                                        className="flex w-full items-center justify-between px-6 py-5 text-left"
                                    >
                                        <span
                                            className={`font-semibold transition-colors duration-300 ${openIndex === i ? tc.text : `text-gray-900 dark:text-white ${tc.textHover}`}`}
                                        >
                                            {item.q}
                                        </span>

                                        <motion.div
                                            animate={{
                                                rotate:
                                                    openIndex === i ? 180 : 0,
                                            }}
                                            transition={{ duration: 0.3 }}
                                            className={`rounded-full p-1 transition-colors ${openIndex === i ? `${tc.bgSoft} ${tc.text}` : `text-gray-400 ${tc.textHover}`}`}
                                        >
                                            <ChevronDown className="h-5 w-5" />
                                        </motion.div>
                                    </button>

                                    {/* ANSWER */}
                                    <AnimatePresence>
                                        {openIndex === i && (
                                            <motion.div
                                                key="content"
                                                initial={{
                                                    height: 0,
                                                    opacity: 0,
                                                }}
                                                animate={{
                                                    height: 'auto',
                                                    opacity: 1,
                                                }}
                                                exit={{ height: 0, opacity: 0 }}
                                                transition={{
                                                    duration: 0.3,
                                                    ease: 'easeInOut',
                                                }}
                                                className="overflow-hidden px-5"
                                            >
                                                <p className="pb-4 text-sm text-gray-600 dark:text-gray-400">
                                                    {item.a}
                                                </p>
                                            </motion.div>
                                        )}
                                    </AnimatePresence>
                                </motion.div>
                            ))}
                        </motion.div>

                        {/* FOOTER */}
                        <motion.div
                            className="mt-12 text-center"
                            initial={{ opacity: 0, y: 20 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ duration: 0.5 }}
                        >
                            <p className="text-gray-500 dark:text-gray-400">
                                Masih punya pertanyaan?
                            </p>

                            <a
                                href="https://wa.me/6285111661997"
                                className={`font-medium hover:underline ${tc.text}`}
                            >
                                Hubungi Pustakawan
                            </a>
                        </motion.div>
                    </div>
                </section>

                <section id="kontak" className="py-32">
                    <div className="mx-auto max-w-7xl px-6 lg:px-8">
                        {/* HEADER */}
                        <motion.div
                            className="mb-16 text-center"
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true, amount: 0.4 }}
                            transition={{ duration: 0.6, ease: 'easeOut' }}
                        >
                            <span
                                className={`inline-block rounded-md px-4 py-1.5 text-sm font-bold tracking-wide ${tc.bgSoft} ${tc.text}`}
                            >
                                KONTAK
                            </span>

                            <h2 className="mt-6 text-4xl font-extrabold tracking-tight text-gray-900 md:text-5xl dark:text-white">
                                Hubungi Kami
                            </h2>

                            <p className="mx-auto mt-4 max-w-2xl text-gray-600 dark:text-gray-400">
                                Punya pertanyaan atau butuh bantuan terkait
                                layanan Digilib? Silakan hubungi kami melalui
                                form berikut.
                            </p>
                        </motion.div>

                        {/* CONTENT GRID */}
                        <div className="grid items-start gap-12 lg:grid-cols-2">
                            {/* LEFT INFO */}
                            <motion.div
                                initial={{ opacity: 0, x: -40 }}
                                whileInView={{ opacity: 1, x: 0 }}
                                viewport={{ once: true, amount: 0.3 }}
                                transition={{ duration: 0.6, ease: 'easeOut' }}
                            >
                                <h3 className="mt-5 text-2xl font-semibold text-gray-900 dark:text-white">
                                    Mari Terhubung
                                </h3>

                                <p className="mt-4 text-gray-600 dark:text-gray-400">
                                    Tim perpustakaan siap membantu Anda dalam
                                    mengakses layanan Digilib dan menjawab
                                    pertanyaan Anda.
                                </p>

                                <div className="mt-8 space-y-6">
                                    {[
                                        {
                                            icon: Mail,
                                            title: 'Email',
                                            desc: 'library@ibrahimy.ac.id',
                                        },
                                        {
                                            icon: Phone,
                                            title: 'Telepon (WhatsApp)',
                                            desc: '+62 851 1166 1997',
                                        },
                                        {
                                            icon: MapPin,
                                            title: 'Alamat',
                                            desc: 'Perpustakaan Ibrahimy\nSitubondo, Jawa Timur',
                                        },
                                    ].map((item, i) => {
                                        const Icon = item.icon;

                                        return (
                                            <motion.div
                                                key={i}
                                                className="flex items-start gap-4"
                                                initial={{ opacity: 0, y: 20 }}
                                                whileInView={{
                                                    opacity: 1,
                                                    y: 0,
                                                }}
                                                viewport={{ once: true }}
                                                transition={{
                                                    duration: 0.5,
                                                    delay: i * 0.1,
                                                }}
                                            >
                                                <Icon
                                                    className={`mt-1 h-5 w-5 ${tc.text}`}
                                                />

                                                <div>
                                                    <p className="font-medium text-gray-900 dark:text-white">
                                                        {item.title}
                                                    </p>
                                                    <p className="whitespace-pre-line text-gray-600 dark:text-gray-400">
                                                        {item.desc}
                                                    </p>
                                                </div>
                                            </motion.div>
                                        );
                                    })}
                                </div>
                            </motion.div>

                            {/* RIGHT FORM */}
                            <ContactForm tc={tc} />
                        </div>
                    </div>
                </section>

                <Footer tc={tc} />
            </div>
        </>
    );
}
