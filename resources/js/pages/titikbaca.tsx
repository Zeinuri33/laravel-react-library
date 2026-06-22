'use client';

import { Head, Link, usePage } from '@inertiajs/react';
import { useEffect, useState, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
    Search,
    BookOpen,
    MapPin,
    SlidersHorizontal,
    X,
    Eye,
    Clock,
    LogOut,
    TrendingUp,
    ChevronRight,
    Menu,
    Library,
    Heart,
    ArrowUp,
} from 'lucide-react';
import { useTheme } from '@/context/ThemeContext';
import AppearanceTabs from '@/components/appearance-tabs';
import Footer from '@/layouts/footer';

type Ebook = {
    id: number;
    cover: string | null;
    file: string | null;
    judul: string;
    isbn: string | null;
    penulis: string | null;
    penerbit: string | null;
    tahun_terbit: number | null;
    deskripsi: string | null;
    klasifikasi: {
        id: number;
        kategori: string;
    } | null;
    baca_histories_count?: number;
    total_menit_baca?: number;
};

type TitikBaca = {
    id: number;
    nama: string;
    latitude: number;
    longitude: number;
    radius: number;
    is_active: boolean;
};

const COLOR_PRESETS = [
    { id: 'emerald', name: 'Emerald Green', color: '#10b981' },
    { id: 'red', name: 'Ruby Red', color: '#ef4444' },
    { id: 'indigo', name: 'Deep Indigo', color: '#6366f1' },
];

const containerVariants = {
    hidden: { opacity: 0 },
    show: {
        opacity: 1,
        transition: { staggerChildren: 0.06 },
    },
};

const cardVariants = {
    hidden: { opacity: 0, y: 30, scale: 0.96 },
    show: {
        opacity: 1,
        y: 0,
        scale: 1,
        transition: { duration: 0.5, ease: [0.25, 0.46, 0.45, 0.94] },
    },
};

const fadeUp = {
    hidden: { opacity: 0, y: 20 },
    show: {
        opacity: 1,
        y: 0,
        transition: { duration: 0.6, ease: 'easeOut' },
    },
};

export default function TitikBacaPage({
    ebooks,
    titiks,
}: {
    ebooks: Ebook[];
    titiks: TitikBaca[];
}) {
    const { themeAccent, setThemeAccent } = useTheme();
    const { auth } = usePage().props;
    const [open, setOpen] = useState(false);
    const [scrolled, setScrolled] = useState(false);
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedKategori, setSelectedKategori] = useState<string | null>(null);
    const [showScrollTop, setShowScrollTop] = useState(false);
    const [bookmarkedIds, setBookmarkedIds] = useState<Set<number>>(new Set());

    useEffect(() => {
        const handleScroll = () => {
            setScrolled(window.scrollY > 10);
            setShowScrollTop(window.scrollY > 600);
        };
        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);

    // Load bookmarks from localStorage
    useEffect(() => {
        try {
            const saved = localStorage.getItem('titikbaca_bookmarks');
            if (saved) setBookmarkedIds(new Set(JSON.parse(saved)));
        } catch {}
    }, []);

    const toggleBookmark = (id: number) => {
        setBookmarkedIds((prev) => {
            const next = new Set(prev);
            if (next.has(id)) next.delete(id);
            else next.add(id);
            localStorage.setItem('titikbaca_bookmarks', JSON.stringify([...next]));
            return next;
        });
    };

    const scrollToTop = () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    const themeMaps: Record<string, any> = {
        emerald: {
            text: 'text-emerald-600 dark:text-emerald-400',
            textHover: 'hover:text-emerald-600 dark:hover:text-emerald-400',
            bgSoft: 'bg-emerald-500/10 dark:bg-emerald-500/20',
            bgGradient: 'bg-gradient-to-r from-emerald-500 to-emerald-600 dark:from-emerald-600 dark:to-emerald-500',
            textGradient: 'from-emerald-500 via-emerald-400 to-emerald-300',
            ring: 'focus:ring-emerald-500/50',
            shadow: 'hover:shadow-emerald-500/20 dark:hover:shadow-emerald-500/20',
            glow: 'from-emerald-500/10',
            orb: 'bg-emerald-500/20 blur-[150px]',
            borderHover: 'hover:border-emerald-500/30 dark:hover:border-emerald-500/30',
            textWhite: 'text-white',
            badge: 'bg-emerald-500/10 text-emerald-600 dark:text-emerald-400',
            activeTab: 'text-emerald-600 dark:text-emerald-400 border-emerald-500',
            ringBg: 'ring-emerald-500/30',
            cardBorder: 'hover:border-emerald-400/40',
            star: 'text-amber-400',
            bookmark: 'text-emerald-500',
            heroOrb1: 'from-emerald-400/20 via-emerald-500/10 to-transparent',
            heroOrb2: 'from-emerald-300/15 to-transparent',
            sectionAccent: 'bg-emerald-50 dark:bg-emerald-950/30',
            accentBg: 'bg-emerald-500',
        },
        red: {
            text: 'text-red-600 dark:text-red-400',
            textHover: 'hover:text-red-600 dark:hover:text-red-400',
            bgSoft: 'bg-red-500/10 dark:bg-red-500/20',
            bgGradient: 'bg-gradient-to-r from-red-500 to-red-600 dark:from-red-600 dark:to-red-500',
            textGradient: 'from-red-500 via-red-400 to-red-300',
            ring: 'focus:ring-red-500/50',
            shadow: 'hover:shadow-red-500/20 dark:hover:shadow-red-500/20',
            glow: 'from-red-500/10',
            orb: 'bg-red-500/20 blur-[150px]',
            borderHover: 'hover:border-red-500/30 dark:hover:border-red-500/30',
            textWhite: 'text-white',
            badge: 'bg-red-500/10 text-red-600 dark:text-red-400',
            activeTab: 'text-red-600 dark:text-red-400 border-red-500',
            ringBg: 'ring-red-500/30',
            cardBorder: 'hover:border-red-400/40',
            star: 'text-amber-400',
            bookmark: 'text-red-500',
            heroOrb1: 'from-red-400/20 via-red-500/10 to-transparent',
            heroOrb2: 'from-red-300/15 to-transparent',
            sectionAccent: 'bg-red-50 dark:bg-red-950/30',
            accentBg: 'bg-red-500',
        },
        indigo: {
            text: 'text-indigo-600 dark:text-indigo-400',
            textHover: 'hover:text-indigo-600 dark:hover:text-indigo-400',
            bgSoft: 'bg-indigo-500/10 dark:bg-indigo-500/20',
            bgGradient: 'bg-gradient-to-r from-indigo-500 to-indigo-600 dark:from-indigo-600 dark:to-indigo-500',
            textGradient: 'from-indigo-500 via-indigo-400 to-indigo-300',
            ring: 'focus:ring-indigo-500/50',
            shadow: 'hover:shadow-indigo-500/20 dark:hover:shadow-indigo-500/20',
            glow: 'from-indigo-500/10',
            orb: 'bg-indigo-500/20 blur-[150px]',
            borderHover: 'hover:border-indigo-500/30 dark:hover:border-indigo-500/30',
            textWhite: 'text-white',
            badge: 'bg-indigo-500/10 text-indigo-600 dark:text-indigo-400',
            activeTab: 'text-indigo-600 dark:text-indigo-400 border-indigo-500',
            ringBg: 'ring-indigo-500/30',
            cardBorder: 'hover:border-indigo-400/40',
            star: 'text-amber-400',
            bookmark: 'text-indigo-500',
            heroOrb1: 'from-indigo-400/20 via-indigo-500/10 to-transparent',
            heroOrb2: 'from-indigo-300/15 to-transparent',
            sectionAccent: 'bg-indigo-50 dark:bg-indigo-950/30',
            accentBg: 'bg-indigo-500',
        },
    };

    const tc = themeMaps[themeAccent] || themeMaps.emerald;

    const kategoris = useMemo(() => {
        const cats = new Set<string>();
        ebooks.forEach((b) => {
            if (b.klasifikasi?.kategori) cats.add(b.klasifikasi.kategori);
        });
        return Array.from(cats).sort();
    }, [ebooks]);

    const filteredEbooks = useMemo(() => {
        return ebooks.filter((b) => {
            const matchSearch =
                !searchQuery ||
                b.judul.toLowerCase().includes(searchQuery.toLowerCase()) ||
                (b.penulis && b.penulis.toLowerCase().includes(searchQuery.toLowerCase())) ||
                (b.isbn && b.isbn.includes(searchQuery));

            const matchKategori =
                !selectedKategori || b.klasifikasi?.kategori === selectedKategori;

            return matchSearch && matchKategori;
        });
    }, [ebooks, searchQuery, selectedKategori]);

    // Popular / most read ebooks
    const popularEbooks = useMemo(() => {
        return [...ebooks]
            .filter((b) => (b.baca_histories_count ?? 0) > 0)
            .sort((a, b) => (b.baca_histories_count ?? 0) - (a.baca_histories_count ?? 0))
            .slice(0, 5);
    }, [ebooks]);

    return (
        <>
            <Head title="Baca E-Book" />

            <div className="relative min-h-screen overflow-hidden bg-white font-sans text-foreground transition-all duration-500 dark:bg-slate-950">
                {/* ============ ORB BACKGROUNDS ============ */}
                <div
                    className={`pointer-events-none fixed -top-40 -right-40 -z-10 h-[700px] w-[700px] rounded-full ${tc.orb} opacity-60`}
                />
                <div
                    className={`pointer-events-none fixed -bottom-40 left-1/3 -z-10 h-[500px] w-[500px] rounded-full ${tc.orb} opacity-40`}
                />

                {/* ============ HEADER ============ */}
                <header
                    className={`fixed top-0 left-0 z-[60] w-full transition-all duration-500 ${
                        scrolled
                            ? 'border-b border-gray-100/80 bg-white/80 shadow-sm backdrop-blur-2xl dark:border-gray-800/30 dark:bg-slate-950/80'
                            : 'bg-transparent'
                    }`}
                >
                    <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3.5 sm:px-6 lg:px-8">
                        {/* Logo */}
                        <Link href="/" className="group flex items-center gap-3">
                            <div className="relative">
                                <img
                                    src="/kubah.png"
                                    className="h-9 transition-transform duration-300 group-hover:scale-105 dark:hidden"
                                    alt="Logo"
                                />
                                <img
                                    src="/kubah-putih.png"
                                    className="hidden h-9 transition-transform duration-300 group-hover:scale-105 dark:block"
                                    alt="Logo Dark"
                                />
                                <div
                                    className={`absolute -inset-2 rounded-full opacity-0 blur-xl transition-opacity duration-300 group-hover:opacity-30 ${tc.bgSoft}`}
                                />
                            </div>
                            <div className="hidden sm:block">
                                <h1 className="text-sm font-bold tracking-tight text-gray-900 dark:text-white">
                                    Digital Library
                                </h1>
                                <p className="text-[11px] text-gray-400 dark:text-gray-500">
                                    Perpustakaan Ibrahimy
                                </p>
                            </div>
                        </Link>

                        {/* Desktop Nav */}
                        <div className="hidden items-center gap-5 md:flex">
                            {/* Color presets */}
                            <div className="flex items-center gap-2 border-r border-gray-200 pr-5 dark:border-gray-700">
                                {COLOR_PRESETS.map((p) => (
                                    <button
                                        key={p.id}
                                        onClick={() => setThemeAccent(p.id)}
                                        className={`group relative h-4 w-4 rounded-full transition-all duration-300 hover:scale-125 ${
                                            themeAccent === p.id
                                                ? 'scale-110 ring-2 ring-offset-2 ring-offset-white dark:ring-offset-slate-950'
                                                : 'opacity-50 hover:opacity-80'
                                        }`}
                                        style={{ backgroundColor: p.color }}
                                        title={p.name}
                                    >
                                        {themeAccent === p.id && (
                                            <span
                                                className="absolute -inset-1 animate-ping rounded-full opacity-30"
                                                style={{ backgroundColor: p.color }}
                                            />
                                        )}
                                    </button>
                                ))}
                            </div>

                            <AppearanceTabs />

                            {/* Exit / Home */}
                            <Link
                                href="/"
                                className="group flex items-center justify-center rounded-lg p-2 text-gray-400 transition-all duration-300 hover:bg-gray-100 hover:text-gray-700 dark:hover:bg-gray-800 dark:hover:text-white"
                            >
                                <LogOut className="h-4 w-4 transition-transform duration-300 group-hover:scale-110" />
                            </Link>
                        </div>

                        {/* Mobile Hamburger */}
                        <button
                            onClick={() => setOpen(!open)}
                            aria-label={open ? 'Tutup menu' : 'Buka menu'}
                            aria-expanded={open}
                            className="relative flex h-8 w-8 items-center justify-center rounded-lg md:hidden"
                        >
                            <Menu className="h-5 w-5 text-gray-700 dark:text-white" />
                        </button>
                    </div>
                </header>

                {/* Mobile Menu */}
                <AnimatePresence>
                    {open && (
                        <motion.div
                            initial={{ opacity: 0, y: -20 }}
                            animate={{ opacity: 1, y: 0 }}
                            exit={{ opacity: 0, y: -20 }}
                            className="fixed inset-x-0 top-16 z-50 border-b border-gray-100 bg-white/95 p-6 shadow-lg backdrop-blur-2xl dark:border-gray-800 dark:bg-slate-950/95 md:hidden"
                        >
                            <div className="flex flex-col gap-4">
                                <div className="flex items-center gap-3">
                                    {COLOR_PRESETS.map((p) => (
                                        <button
                                            key={p.id}
                                            onClick={() => setThemeAccent(p.id)}
                                            className={`h-5 w-5 rounded-full transition-all ${
                                                themeAccent === p.id
                                                    ? 'scale-110 ring-2 ring-offset-2'
                                                    : 'opacity-60'
                                            }`}
                                            style={{ backgroundColor: p.color }}
                                        />
                                    ))}
                                    <AppearanceTabs />
                                </div>
                                <Link
                                    href="/"
                                    className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400"
                                >
                                    <LogOut className="h-4 w-4" />
                                    Kembali ke Beranda
                                </Link>
                            </div>
                        </motion.div>
                    )}
                </AnimatePresence>

                {/* ============ HERO SECTION ============ */}
                <section className="relative pt-28 pb-16 md:pt-36 md:pb-24">
                    {/* Decorative gradient orbs */}
                    <div
                        className={`pointer-events-none absolute top-0 right-0 -z-10 h-[500px] w-[500px] rounded-full bg-gradient-to-br ${tc.heroOrb1} blur-[120px]`}
                    />
                    <div
                        className={`pointer-events-none absolute top-20 left-0 -z-10 h-[400px] w-[400px] rounded-full bg-gradient-to-br ${tc.heroOrb2} blur-[100px]`}
                    />

                    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                        <motion.div
                            className="text-center"
                            initial="hidden"
                            animate="show"
                            variants={{
                                hidden: {},
                                show: {
                                    transition: { staggerChildren: 0.12 },
                                },
                            }}
                        >
                            {/* Icon */}
                            <motion.div variants={fadeUp} className="mb-6 flex justify-center">
                                <div
                                    className={`group relative rounded-2xl p-3 transition-all duration-500 ${tc.bgSoft}`}
                                >
                                    <div
                                        className={`absolute inset-0 -z-10 scale-75 rounded-2xl opacity-0 blur-xl transition-all duration-500 group-hover:scale-100 group-hover:opacity-60 ${tc.bgSoft}`}
                                    />
                                    <BookOpen className={`relative h-7 w-7 ${tc.text}`} />
                                </div>
                            </motion.div>

                            {/* Title */}
                            <motion.h1
                                variants={fadeUp}
                                className="text-4xl font-extrabold tracking-tight text-gray-900 md:text-6xl lg:text-7xl dark:text-white"
                            >
                                Baca{' '}
                                <span
                                    className={`bg-gradient-to-r bg-clip-text text-transparent ${tc.textGradient}`}
                                >
                                    E-Book
                                </span>
                            </motion.h1>

                            {/* Subtitle */}
                            <motion.p
                                variants={fadeUp}
                                className="mx-auto mt-4 max-w-xl text-base leading-relaxed text-gray-400 dark:text-gray-500"
                            >
                                Akses dan baca koleksi e-book perpustakaan Ibrahimy secara digital.
                                Tersedia berbagai kategori untuk menunjang belajar dan penelitian.
                            </motion.p>

                            {/* Stats row */}
                            <motion.div
                                variants={fadeUp}
                                className="mt-8 flex flex-wrap items-center justify-center gap-6 text-sm"
                            >
                                <div className="flex items-center gap-2 rounded-full border border-gray-100 bg-white/60 px-4 py-2 shadow-sm backdrop-blur-sm dark:border-gray-800 dark:bg-slate-900/60">
                                    <BookOpen className={`h-3.5 w-3.5 ${tc.text}`} />
                                    <span className="text-gray-600 dark:text-gray-400">
                                        <span className={`font-semibold ${tc.text}`}>{ebooks.length}</span>{' '}
                                        E-Book
                                    </span>
                                </div>
                                {titiks.length > 0 && (
                                    <div className="flex items-center gap-2 rounded-full border border-gray-100 bg-white/60 px-4 py-2 shadow-sm backdrop-blur-sm dark:border-gray-800 dark:bg-slate-900/60">
                                        <MapPin className={`h-3.5 w-3.5 ${tc.text}`} />
                                        <span className="text-gray-600 dark:text-gray-400">
                                            <span className={`font-semibold ${tc.text}`}>{titiks.length}</span>{' '}
                                            Titik Baca
                                        </span>
                                    </div>
                                )}
                                {kategoris.length > 0 && (
                                    <div className="flex items-center gap-2 rounded-full border border-gray-100 bg-white/60 px-4 py-2 shadow-sm backdrop-blur-sm dark:border-gray-800 dark:bg-slate-900/60">
                                        <Library className={`h-3.5 w-3.5 ${tc.text}`} />
                                        <span className="text-gray-600 dark:text-gray-400">
                                            <span className={`font-semibold ${tc.text}`}>{kategoris.length}</span>{' '}
                                            Kategori
                                        </span>
                                    </div>
                                )}
                            </motion.div>
                        </motion.div>

                        {/* Search bar - prominent in hero */}
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ delay: 0.4, duration: 0.6 }}
                            className="relative mx-auto mt-10 max-w-2xl"
                        >
                            <div
                                className={`group relative overflow-hidden rounded-2xl border border-gray-100 bg-white shadow-lg shadow-gray-200/40 backdrop-blur-sm transition-all duration-300 focus-within:shadow-xl dark:border-gray-800 dark:bg-slate-900 dark:shadow-black/20 ${tc.cardBorder}`}
                            >
                                <div className="flex items-center px-4">
                                    <Search className={`h-5 w-5 text-gray-300 transition-colors duration-300 group-focus-within:text-gray-500`} />
                                    <input
                                        type="text"
                                        placeholder="Cari judul, penulis, atau ISBN..."
                                        value={searchQuery}
                                        onChange={(e) => setSearchQuery(e.target.value)}
                                        className="w-full border-none bg-transparent px-3 py-4 text-sm text-gray-900 placeholder-gray-400 outline-none focus:outline-none dark:text-white dark:placeholder-gray-500"
                                    />
                                    {searchQuery && (
                                        <button
                                            onClick={() => setSearchQuery('')}
                                            className="flex h-7 w-7 items-center justify-center rounded-full text-gray-400 transition-colors hover:bg-gray-100 hover:text-gray-600 dark:hover:bg-gray-800"
                                        >
                                            <X className="h-4 w-4" />
                                        </button>
                                    )}
                                </div>
                                {/* Search bar glow on focus */}
                                <div
                                    className={`absolute inset-0 -z-10 rounded-2xl opacity-0 transition-opacity duration-500 group-focus-within:opacity-100 ${tc.bgSoft}`}
                                />
                            </div>
                        </motion.div>
                    </div>
                </section>

                {/* ============ POPULAR SECTION ============ */}
                {popularEbooks.length > 0 && !searchQuery && !selectedKategori && (
                    <section className="relative z-10 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 pb-10">
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ duration: 0.5 }}
                        >
                            <div className="mb-6 flex items-center justify-between">
                                <div className="flex items-center gap-3">
                                    <div className={`rounded-lg p-2 ${tc.bgSoft}`}>
                                        <TrendingUp className={`h-4 w-4 ${tc.text}`} />
                                    </div>
                                    <div>
                                        <h2 className="text-lg font-bold text-gray-900 dark:text-white">
                                            Populer
                                        </h2>
                                        <p className="text-xs text-gray-400 dark:text-gray-500">
                                            E-book paling banyak dibaca
                                        </p>
                                    </div>
                                </div>
                                <Link
                                    href="#all-ebooks"
                                    className={`hidden items-center gap-1 text-sm font-medium transition-colors sm:flex ${tc.text} ${tc.textHover}`}
                                >
                                    Lihat Semua
                                    <ChevronRight className="h-4 w-4" />
                                </Link>
                            </div>

                            <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5">
                                {popularEbooks.map((ebook, i) => (
                                    <motion.div
                                        key={ebook.id}
                                        initial={{ opacity: 0, y: 20 }}
                                        whileInView={{ opacity: 1, y: 0 }}
                                        viewport={{ once: true }}
                                        transition={{ delay: i * 0.08, duration: 0.4 }}
                                        className="group relative cursor-pointer overflow-hidden rounded-xl border border-gray-100 bg-white shadow-sm transition-all duration-300 hover:-translate-y-1.5 hover:shadow-xl dark:border-gray-800 dark:bg-slate-900"
                                    >
                                        <div className="relative aspect-[3/4] overflow-hidden bg-gradient-to-b from-gray-50 to-gray-100 dark:from-gray-800 dark:to-gray-900">
                                            {ebook.cover ? (
                                                <img
                                                    src={`/storage/${ebook.cover}`}
                                                    alt={ebook.judul}
                                                    className="h-full w-full object-cover transition-all duration-500 group-hover:scale-105"
                                                    loading="lazy"
                                                />
                                            ) : (
                                                <div className="flex h-full items-center justify-center">
                                                    <BookOpen className="h-10 w-10 text-gray-200 dark:text-gray-700" />
                                                </div>
                                            )}
                                            {/* Overlay */}
                                            <div className="absolute inset-0 flex items-center justify-center bg-gradient-to-t from-black/50 via-black/20 to-transparent opacity-0 transition-all duration-300 group-hover:opacity-100">
                                                {ebook.file && (
                                                    <Link
                                                        href={`/titikbaca/${ebook.id}/baca`}
                                                        className={`translate-y-4 scale-90 rounded-lg px-4 py-2 text-xs font-semibold text-white shadow-lg opacity-0 transition-all duration-300 group-hover:translate-y-0 group-hover:scale-100 group-hover:opacity-100 ${tc.bgGradient}`}
                                                    >
                                                        Baca
                                                    </Link>
                                                )}
                                            </div>
                                            {/* Badge */}
                                            {ebook.klasifikasi?.kategori && (
                                                <span
                                                    className={`absolute top-2 left-2 rounded-md px-2 py-0.5 text-[9px] font-semibold uppercase tracking-wider ${tc.badge}`}
                                                >
                                                    {ebook.klasifikasi.kategori}
                                                </span>
                                            )}
                                            {/* Bookmark button */}
                                            <button
                                                onClick={(e) => {
                                                    e.preventDefault();
                                                    toggleBookmark(ebook.id);
                                                }}
                                                aria-label="Tandai e-book"
                                                className={`absolute top-2 right-2 flex h-7 w-7 items-center justify-center rounded-full bg-white/80 opacity-0 shadow-sm backdrop-blur-sm transition-all duration-300 hover:scale-110 group-hover:opacity-100 dark:bg-slate-900/80 ${
                                                    bookmarkedIds.has(ebook.id) ? 'opacity-100' : ''
                                                }`}
                                            >
                                                <Heart
                                                    className={`h-3.5 w-3.5 transition-colors ${
                                                        bookmarkedIds.has(ebook.id)
                                                            ? 'fill-red-500 text-red-500'
                                                            : 'text-gray-600 dark:text-gray-300'
                                                    }`}
                                                />
                                            </button>
                                        </div>
                                        <div className="p-3">
                                            <h3 className="line-clamp-1 text-xs font-semibold text-gray-900 dark:text-white">
                                                {ebook.judul}
                                            </h3>
                                            {ebook.penulis && (
                                                <p className="mt-0.5 line-clamp-1 text-[10px] text-gray-400 dark:text-gray-500">
                                                    {ebook.penulis}
                                                </p>
                                            )}
                                            {ebook.baca_histories_count != null &&
                                                ebook.baca_histories_count > 0 && (
                                                    <div className="mt-1.5 flex items-center gap-1 text-[10px] text-gray-400 dark:text-gray-500">
                                                        <Eye className="h-3 w-3" />
                                                        {ebook.baca_histories_count}x dibaca
                                                    </div>
                                                )}
                                        </div>
                                    </motion.div>
                                ))}
                            </div>
                        </motion.div>
                    </section>
                )}

                {/* ============ ALL EBOOKS SECTION ============ */}
                <section id="all-ebooks" className="relative z-10 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 pb-20">
                    {/* Section Header + Filters */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        transition={{ duration: 0.5 }}
                        className="mb-8"
                    >
                        <div className="flex flex-col gap-6 md:flex-row md:items-end md:justify-between">
                            <div>
                                <div className="flex items-center gap-3">
                                    <div className={`rounded-lg p-2 ${tc.bgSoft}`}>
                                        <Library className={`h-4 w-4 ${tc.text}`} />
                                    </div>
                                    <div>
                                        <h2 className="text-xl font-bold text-gray-900 dark:text-white">
                                            Koleksi E-Book
                                        </h2>
                                        <p className="text-sm text-gray-400 dark:text-gray-500">
                                            Menampilkan {filteredEbooks.length} dari {ebooks.length} e-book
                                        </p>
                                    </div>
                                </div>
                            </div>

                            {/* Search (mobile only, since hero search is the main) */}
                            <div className="relative w-full md:hidden">
                                <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-gray-400" />
                                <input
                                    type="text"
                                    placeholder="Cari e-book..."
                                    value={searchQuery}
                                    onChange={(e) => setSearchQuery(e.target.value)}
                                    className="w-full rounded-xl border border-gray-100 bg-white/60 py-2.5 pl-10 pr-9 text-sm text-gray-900 shadow-sm backdrop-blur-sm transition-all duration-200 placeholder:text-gray-400 focus:border-transparent focus:outline-none focus:ring-2 dark:border-gray-800 dark:bg-slate-900/60 dark:text-white dark:placeholder:text-gray-500"
                                />
                                {searchQuery && (
                                    <button
                                        onClick={() => setSearchQuery('')}
                                        className="absolute right-2.5 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                    >
                                        <X className="h-4 w-4" />
                                    </button>
                                )}
                            </div>

                            {/* Category Pills */}
                            <div className="flex flex-wrap items-center gap-2">
                                <SlidersHorizontal className="h-4 w-4 text-gray-300" />
                                <button
                                    onClick={() => setSelectedKategori(null)}
                                    className={`rounded-full px-4 py-2 text-xs font-medium transition-all duration-300 ${
                                        !selectedKategori
                                            ? `${tc.bgGradient} ${tc.textWhite} shadow-md`
                                            : 'border border-gray-200 bg-white text-gray-600 hover:border-gray-300 hover:bg-gray-50 dark:border-gray-700 dark:bg-slate-900 dark:text-gray-400 dark:hover:border-gray-600'
                                    }`}
                                >
                                    Semua
                                </button>
                                {kategoris.map((kat) => (
                                    <button
                                        key={kat}
                                        onClick={() =>
                                            setSelectedKategori(
                                                kat === selectedKategori ? null : kat,
                                            )
                                        }
                                        className={`rounded-full px-4 py-2 text-xs font-medium transition-all duration-300 ${
                                            selectedKategori === kat
                                                ? `${tc.bgGradient} ${tc.textWhite} shadow-md`
                                                : 'border border-gray-200 bg-white text-gray-600 hover:border-gray-300 hover:bg-gray-50 dark:border-gray-700 dark:bg-slate-900 dark:text-gray-400 dark:hover:border-gray-600'
                                        }`}
                                    >
                                        {kat}
                                    </button>
                                ))}
                            </div>
                        </div>
                    </motion.div>

                    {/* Ebook Grid */}
                    {filteredEbooks.length > 0 ? (
                        <motion.div
                            className="grid gap-5 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5"
                            variants={containerVariants}
                            initial="hidden"
                            animate="show"
                        >
                            {filteredEbooks.map((ebook) => (
                                <motion.div
                                    key={ebook.id}
                                    variants={cardVariants}
                                    className={`group relative overflow-hidden rounded-2xl border border-gray-100 bg-white shadow-sm transition-all duration-500 hover:-translate-y-2 hover:shadow-xl dark:border-gray-800 dark:bg-slate-900 ${tc.cardBorder}`}
                                >
                                    {/* Cover */}
                                    <div className="relative aspect-[3/4] overflow-hidden bg-gradient-to-b from-gray-50 to-gray-100 dark:from-gray-800 dark:to-gray-900">
                                        {ebook.cover ? (
                                            <img
                                                src={`/storage/${ebook.cover}`}
                                                alt={ebook.judul}
                                                className="h-full w-full object-cover transition-all duration-700 group-hover:scale-105"
                                                loading="lazy"
                                            />
                                        ) : (
                                            <div className="flex h-full items-center justify-center">
                                                <BookOpen className="h-14 w-14 text-gray-200 dark:text-gray-700" />
                                            </div>
                                        )}

                                        {/* Hover overlay with CTA */}
                                        <div className="absolute inset-0 flex items-center justify-center bg-gradient-to-t from-black/60 via-black/20 to-transparent opacity-0 transition-all duration-500 group-hover:opacity-100">
                                            {ebook.file && (
                                                <Link
                                                    href={`/titikbaca/${ebook.id}/baca`}
                                                    className={`translate-y-6 scale-90 rounded-xl px-5 py-2.5 text-sm font-semibold text-white shadow-lg opacity-0 transition-all duration-500 group-hover:translate-y-0 group-hover:scale-100 group-hover:opacity-100 ${tc.bgGradient} ${tc.shadow}`}
                                                >
                                                    Baca Sekarang
                                                </Link>
                                            )}
                                        </div>

                                        {/* Category badge */}
                                        {ebook.klasifikasi?.kategori && (
                                            <span
                                                className={`absolute top-3 left-3 rounded-lg px-2.5 py-1 text-[10px] font-semibold uppercase tracking-wider shadow-sm ${tc.badge}`}
                                            >
                                                {ebook.klasifikasi.kategori}
                                            </span>
                                        )}

                                        {/* Bookmark button */}
                                        <button
                                            onClick={(e) => {
                                                e.preventDefault();
                                                toggleBookmark(ebook.id);
                                            }}
                                            aria-label="Tandai e-book"
                                            className={`absolute top-3 right-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/70 opacity-0 shadow-sm backdrop-blur-md transition-all duration-300 hover:scale-110 hover:bg-white group-hover:opacity-100 dark:bg-slate-900/70 dark:hover:bg-slate-900 ${
                                                bookmarkedIds.has(ebook.id) ? 'opacity-100' : ''
                                            }`}
                                        >
                                            <Heart
                                                className={`h-4 w-4 transition-all duration-300 ${
                                                    bookmarkedIds.has(ebook.id)
                                                        ? 'scale-110 fill-red-500 text-red-500'
                                                        : 'text-gray-600 dark:text-gray-300'
                                                }`}
                                            />
                                        </button>

                                        {/* Read count badge on cover */}
                                        {ebook.baca_histories_count != null &&
                                            ebook.baca_histories_count > 0 && (
                                                <div className="absolute bottom-3 left-3 flex items-center gap-1 rounded-full bg-black/40 px-2 py-0.5 text-[10px] text-white backdrop-blur-sm">
                                                    <Eye className="h-3 w-3" />
                                                    {ebook.baca_histories_count}x
                                                </div>
                                            )}
                                    </div>

                                    {/* Info */}
                                    <div className="p-4">
                                        <h3 className="line-clamp-2 text-sm font-bold leading-snug text-gray-900 transition-colors group-hover:text-gray-900 dark:text-white">
                                            {ebook.judul}
                                        </h3>

                                        {ebook.penulis && (
                                            <p className="mt-1 line-clamp-1 text-xs text-gray-400 dark:text-gray-500">
                                                {ebook.penulis}
                                            </p>
                                        )}

                                        <div className="mt-2 flex items-center justify-between text-[10px] text-gray-400 dark:text-gray-500">
                                            {ebook.penerbit && (
                                                <span className="line-clamp-1">{ebook.penerbit}</span>
                                            )}
                                            {ebook.tahun_terbit && (
                                                <span className="shrink-0">{ebook.tahun_terbit}</span>
                                            )}
                                        </div>

                                        {/* Rating / stats row */}
                                        <div className="mt-2.5 flex items-center gap-3 text-[10px] text-gray-400 dark:text-gray-500">
                                            {ebook.total_menit_baca != null &&
                                                ebook.total_menit_baca > 0 && (
                                                    <span className="flex items-center gap-1">
                                                        <Clock className="h-3 w-3" />
                                                        {ebook.total_menit_baca} menit
                                                    </span>
                                                )}
                                        </div>
                                    </div>

                                    {/* Bottom accent line on hover */}
                                    <div
                                        className={`absolute bottom-0 left-0 h-0.5 w-0 bg-gradient-to-r transition-all duration-500 group-hover:w-full ${tc.bgGradient}`}
                                    />
                                </motion.div>
                            ))}
                        </motion.div>
                    ) : (
                        <motion.div
                            initial={{ opacity: 0, scale: 0.95 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{ duration: 0.4 }}
                            className="flex flex-col items-center justify-center rounded-2xl border border-gray-100 py-24 dark:border-gray-800"
                        >
                            <div
                                className={`rounded-full p-5 ${tc.bgSoft}`}
                            >
                                <Search className={`h-8 w-8 ${tc.text}`} />
                            </div>
                            <h3 className="mt-5 text-xl font-bold text-gray-900 dark:text-white">
                                {searchQuery
                                    ? 'E-book tidak ditemukan'
                                    : 'Belum ada e-book'}
                            </h3>
                            <p className="mt-2 text-sm text-gray-400 dark:text-gray-500">
                                {searchQuery
                                    ? 'Coba gunakan kata kunci yang berbeda'
                                    : 'Belum ada koleksi e-book yang tersedia'}
                            </p>
                            {searchQuery && (
                                <button
                                    onClick={() => setSearchQuery('')}
                                    className={`mt-5 rounded-xl px-5 py-2.5 text-sm font-semibold transition-all duration-300 hover:scale-105 ${tc.bgSoft} ${tc.text}`}
                                >
                                    Reset pencarian
                                </button>
                            )}
                        </motion.div>
                    )}
                </section>

                {/* ============ FOOTER ============ */}
                <Footer
                    tc={{
                        footerBg: 'bg-white/50 dark:bg-[#020817]/50',
                        footerBorder: `border-gray-200/30 dark:border-gray-800/30`,
                        textGradient: tc.textGradient,
                        text: tc.text,
                        textPrimary: tc.text,
                        socialBorder: 'border-gray-200/30 dark:border-gray-700/30',
                        bgSoft: 'bg-gray-100/50 dark:bg-gray-800/50',
                        socialHover: 'hover:bg-gray-200/50 dark:hover:bg-gray-700/50',
                        linkHover: tc.text
                            .replace('text-', 'hover:text-')
                            .replace('dark:text-', 'dark:hover:text-'),
                    }}
                />

                {/* ============ SCROLL TO TOP ============ */}
                <AnimatePresence>
                    {showScrollTop && (
                        <motion.button
                            initial={{ opacity: 0, scale: 0.5, y: 20 }}
                            animate={{ opacity: 1, scale: 1, y: 0 }}
                            exit={{ opacity: 0, scale: 0.5, y: 20 }}
                            transition={{ duration: 0.3 }}
                            onClick={scrollToTop}
                            aria-label="Kembali ke atas"
                            className={`fixed bottom-8 right-8 z-50 flex h-12 w-12 items-center justify-center rounded-2xl text-white shadow-lg transition-all duration-300 hover:scale-110 hover:shadow-xl ${tc.bgGradient}`}
                        >
                            <ArrowUp className="h-5 w-5" />
                        </motion.button>
                    )}
                </AnimatePresence>
            </div>
        </>
    );
}
