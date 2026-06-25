'use client';

import { Head, Link, router, usePage } from '@inertiajs/react';
import { useEffect, useState, useMemo, useCallback } from 'react';
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
    Filter,
} from 'lucide-react';
import { useTheme } from '@/context/ThemeContext';
import { toast } from 'sonner';
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
    const [selectedKategori, setSelectedKategori] = useState<string[]>([]);
    const [showScrollTop, setShowScrollTop] = useState(false);
    const [showFilterSidebar, setShowFilterSidebar] = useState(false);
    const [bookmarkedIds, setBookmarkedIds] = useState<Set<number>>(new Set());
    const [currentTitik, setCurrentTitik] = useState<{ id: number; nama: string; jarak: number } | null>(null);
    const [locationChecking, setLocationChecking] = useState(false);
    const [locationError, setLocationError] = useState<string | null>(null);
    const [diluarArea, setDiluarArea] = useState(false);

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

    // Detect current location on mount to show which titik baca the user is in
    useEffect(() => {
        if (!navigator.geolocation) {
            setLocationError('Browser tidak mendukung geolokasi');
            return;
        }

        setLocationChecking(true);

        navigator.geolocation.getCurrentPosition(
            async (position) => {
                const { latitude, longitude } = position.coords;

                const csrfToken =
                    document.querySelector('meta[name=csrf-token]')?.getAttribute('content') || '';

                try {
                    const response = await fetch('/titikbaca/verify-location', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken,
                        },
                        body: JSON.stringify({ latitude, longitude }),
                    });

                    const data = await response.json();

                    if (data.allowed && data.titik) {
                        setCurrentTitik(data.titik);
                        setDiluarArea(false);
                    } else if (!data.allowed) {
                        setDiluarArea(true);
                    }
                } catch (e) {
                    console.error('Failed to detect location:', e);
                } finally {
                    setLocationChecking(false);
                }
            },
            (error) => {
                setLocationChecking(false);
                if (error.code === 1) {
                    setLocationError('Izinkan akses lokasi untuk mendeteksi titik baca');
                }
            },
            {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 30000,
            }
        );
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

    const handleReadEbook = useCallback(async (ebookId: number) => {
        if (!navigator.geolocation) {
            toast.error('Browser Anda tidak mendukung geolokasi');
            return;
        }

        const loadingToast = toast.loading('Memeriksa lokasi titik baca...');

        try {
            const position = await new Promise<GeolocationPosition>((resolve, reject) => {
                navigator.geolocation.getCurrentPosition(resolve, reject, {
                    enableHighAccuracy: true,
                    timeout: 10000,
                    maximumAge: 30000,
                });
            });

            const { latitude, longitude } = position.coords;

            const csrfToken =
                document.querySelector('meta[name=csrf-token]')?.getAttribute('content') || '';

            const response = await fetch('/titikbaca/verify-location', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken,
                },
                body: JSON.stringify({ latitude, longitude }),
            });

            const data = await response.json();

            toast.dismiss(loadingToast);

            if (data.allowed) {
                const titikId = data.titik?.id;
                let url = `/titikbaca/${ebookId}/baca?lat=${latitude}&lng=${longitude}`;
                if (titikId) {
                    url += `&titik_id=${titikId}`;
                }
                router.visit(url);
            } else {
                toast.error(data.message, { duration: 6000 });
            }
        } catch (error: any) {
            toast.dismiss(loadingToast);

            if (error.code === 1) {
                toast.error('Izinkan akses lokasi untuk membaca e-book', { duration: 5000 });
            } else if (error.code === 2) {
                toast.error('Tidak dapat menentukan lokasi. Coba lagi.', { duration: 5000 });
            } else if (error.code === 3) {
                toast.error('Waktu permintaan lokasi habis. Coba lagi.', { duration: 5000 });
            } else {
                toast.error('Gagal memeriksa lokasi. Silakan coba lagi.', { duration: 5000 });
            }
        }
    }, []);

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
                selectedKategori.length === 0 ||
                (b.klasifikasi?.kategori ? selectedKategori.includes(b.klasifikasi.kategori) : false);

            return matchSearch && matchKategori;
        });
    }, [ebooks, searchQuery, selectedKategori]);

    // Popular / most read ebooks
    const popularEbooks = useMemo(() => {
        return [...ebooks]
            .filter((b) => (b.baca_histories_count ?? 0) > 0)
            .sort((a, b) => (b.baca_histories_count ?? 0) - (a.baca_histories_count ?? 0))
            .slice(0, 6);
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
                {/* Glow background — same style as /result page */}
                <div
                    aria-hidden="true"
                    className={`pointer-events-none absolute inset-0 z-0 flex items-start justify-center overflow-hidden`}
                >
                    <div
                        className={`-mt-40 h-[600px] w-[800px] rounded-full blur-[150px] ${tc.bgSoft} transition-colors duration-500`}
                    />
                </div>

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

                        {/* Location banner - shows current titik baca */}
                        {locationChecking && (
                            <motion.div
                                initial={{ opacity: 0, y: 10 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.2, duration: 0.5 }}
                                className="mx-auto mt-8 max-w-2xl"
                            >
                                <div className="flex items-center justify-center gap-2 rounded-2xl border border-gray-100 bg-white/60 px-5 py-3 shadow-sm backdrop-blur-sm dark:border-gray-800 dark:bg-slate-900/60">
                                    <div className="h-4 w-4 animate-spin rounded-full border-2 border-gray-300 border-t-gray-600 dark:border-gray-600 dark:border-t-gray-300" />
                                    <span className="text-sm text-gray-400 dark:text-gray-500">
                                        Mendeteksi lokasi titik baca...
                                    </span>
                                </div>
                            </motion.div>
                        )}

                        {currentTitik && (
                            <motion.div
                                initial={{ opacity: 0, y: 10, scale: 0.95 }}
                                animate={{ opacity: 1, y: 0, scale: 1 }}
                                transition={{ delay: 0.2, duration: 0.5, ease: 'easeOut' }}
                                className="mx-auto mt-8 max-w-2xl"
                            >
                                <div
                                    className={`group relative overflow-hidden rounded-2xl border border-emerald-200/60 bg-gradient-to-r from-emerald-50/80 to-white/80 px-5 py-4 shadow-lg shadow-emerald-500/5 backdrop-blur-sm transition-all duration-300 hover:shadow-emerald-500/10 dark:border-emerald-800/40 dark:from-emerald-950/40 dark:to-slate-900/80`}
                                >
                                    {/* Glow effect */}
                                    <div className="pointer-events-none absolute -inset-1 rounded-2xl opacity-0 blur-xl transition-opacity duration-300 group-hover:opacity-40 dark:opacity-20 dark:group-hover:opacity-30"
                                        style={{
                                            background: `linear-gradient(135deg, ${themeAccent === 'red' ? '#ef4444' : themeAccent === 'indigo' ? '#6366f1' : '#10b981'}, transparent)`,
                                        }}
                                    />

                                    <div className="relative flex items-center gap-4">
                                        {/* Icon */}
                                        <div
                                            className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-xl ${
                                                themeAccent === 'red'
                                                    ? 'bg-red-100 text-red-600 dark:bg-red-900/30 dark:text-red-400'
                                                    : themeAccent === 'indigo'
                                                      ? 'bg-indigo-100 text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400'
                                                      : 'bg-emerald-100 text-emerald-600 dark:bg-emerald-900/30 dark:text-emerald-400'
                                            }`}
                                        >
                                            <MapPin className="h-5 w-5" />
                                        </div>

                                        {/* Content */}
                                        <div className="min-w-0 flex-1">
                                            <p className="text-xs font-medium uppercase tracking-wider text-gray-400 dark:text-gray-500">
                                                Lokasi Titik Baca
                                            </p>
                                            <p className="truncate text-sm font-bold text-gray-900 dark:text-white">
                                                {currentTitik.nama}
                                            </p>
                                        </div>

                                        {/* Distance badge */}
                                        <div className="shrink-0">
                                            <div
                                                className={`rounded-lg px-3 py-1.5 text-xs font-semibold ${
                                                    themeAccent === 'red'
                                                        ? 'bg-red-50 text-red-600 dark:bg-red-900/20 dark:text-red-400'
                                                        : themeAccent === 'indigo'
                                                          ? 'bg-indigo-50 text-indigo-600 dark:bg-indigo-900/20 dark:text-indigo-400'
                                                          : 'bg-emerald-50 text-emerald-600 dark:bg-emerald-900/20 dark:text-emerald-400'
                                                }`}
                                            >
                                                {currentTitik.jarak < 1
                                                    ? '< 1 m'
                                                    : `${Math.round(currentTitik.jarak)} m`}
                                            </div>
                                        </div>
                                    </div>

                                    {/* Bottom accent bar */}
                                    <div
                                        className={`absolute bottom-0 left-0 h-0.5 w-full ${
                                            themeAccent === 'red'
                                                ? 'bg-gradient-to-r from-red-400 to-red-500'
                                                : themeAccent === 'indigo'
                                                  ? 'bg-gradient-to-r from-indigo-400 to-indigo-500'
                                                  : 'bg-gradient-to-r from-emerald-400 to-emerald-500'
                                        }`}
                                    />
                                </div>
                            </motion.div>
                        )}

                        {locationError && !currentTitik && (
                            <motion.div
                                initial={{ opacity: 0, y: 10 }}
                                animate={{ opacity: 1, y: 0 }}
                                transition={{ delay: 0.2, duration: 0.5 }}
                                className="mx-auto mt-8 max-w-2xl"
                            >
                                <div className="flex items-center justify-center gap-2 rounded-2xl border border-amber-200/60 bg-amber-50/60 px-5 py-3 shadow-sm backdrop-blur-sm dark:border-amber-800/30 dark:bg-amber-950/30">
                                    <MapPin className="h-4 w-4 text-amber-500" />
                                    <span className="text-sm text-amber-600 dark:text-amber-400">
                                        {locationError}
                                    </span>
                                </div>
                            </motion.div>
                        )}

                        {diluarArea && !currentTitik && !locationChecking && (
                            <motion.div
                                initial={{ opacity: 0, y: 10, scale: 0.95 }}
                                animate={{ opacity: 1, y: 0, scale: 1 }}
                                transition={{ delay: 0.2, duration: 0.5, ease: 'easeOut' }}
                                className="mx-auto mt-8 max-w-2xl"
                            >
                                <div className="group relative overflow-hidden rounded-2xl border border-orange-200/60 bg-gradient-to-r from-orange-50/80 to-amber-50/80 px-5 py-4 shadow-lg shadow-orange-500/5 backdrop-blur-sm transition-all duration-300 hover:shadow-orange-500/10 dark:border-orange-800/40 dark:from-orange-950/40 dark:to-amber-950/40">
                                    {/* Glow effect */}
                                    <div className="pointer-events-none absolute -inset-1 rounded-2xl opacity-0 blur-xl transition-opacity duration-300 group-hover:opacity-40 dark:opacity-20 dark:group-hover:opacity-30"
                                        style={{
                                            background: 'linear-gradient(135deg, #f97316, transparent)',
                                        }}
                                    />

                                    <div className="relative flex items-center gap-4">
                                        {/* Icon */}
                                        <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-orange-100 text-orange-600 dark:bg-orange-900/30 dark:text-orange-400">
                                            <MapPin className="h-5 w-5" />
                                        </div>

                                        {/* Content */}
                                        <div className="min-w-0 flex-1">
                                            <p className="text-xs font-medium uppercase tracking-wider text-orange-400 dark:text-orange-500">
                                                Lokasi Anda
                                            </p>
                                            <p className="text-sm font-bold text-orange-700 dark:text-orange-300">
                                                Anda Berada di Luar Area Titik Baca
                                            </p>
                                        </div>

                                        {/* Hint badge */}
                                        <div className="hidden shrink-0 sm:block">
                                            <div className="rounded-lg bg-orange-100/80 px-3 py-1.5 text-[10px] font-medium text-orange-600 dark:bg-orange-900/20 dark:text-orange-400">
                                                Cari titik baca terdekat
                                            </div>
                                        </div>
                                    </div>

                                    {/* Bottom accent bar */}
                                    <div className="absolute bottom-0 left-0 h-0.5 w-full bg-gradient-to-r from-orange-400 to-amber-500" />
                                </div>
                            </motion.div>
                        )}

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
                {popularEbooks.length > 0 && !searchQuery && selectedKategori.length === 0 && (
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

                            <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6">
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
                                                    <button
                                                        onClick={() => handleReadEbook(ebook.id)}
                                                        className={`translate-y-4 scale-90 rounded-lg px-4 py-2 text-xs font-semibold text-white shadow-lg opacity-0 transition-all duration-300 group-hover:translate-y-0 group-hover:scale-100 group-hover:opacity-100 ${tc.bgGradient} cursor-pointer`}
                                                    >
                                                        Baca
                                                    </button>
                                                )}
                                            </div>
                                            {/* Category badge */}
                                            {ebook.klasifikasi?.kategori && (
                                                <span
                                                    className={`absolute top-2 left-2 max-w-[calc(100%-3rem)] truncate rounded-md px-1.5 py-0.5 text-[8px] font-bold uppercase tracking-wider text-white shadow-sm ${tc.accentBg}`}
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
                    {/* Section Header — full width, same style as Populer */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        transition={{ duration: 0.5 }}
                    >
                        <div className="mb-6 flex items-center justify-between">
                            <div className="flex items-center gap-3">
                                <div className={`rounded-lg p-2 ${tc.bgSoft}`}>
                                    <Library className={`h-4 w-4 ${tc.text}`} />
                                </div>
                                <div>
                                    <h2 className="text-lg font-bold text-gray-900 dark:text-white">
                                        Koleksi E-Book
                                    </h2>
                                    <p className="text-xs text-gray-400 dark:text-gray-500">
                                        Menampilkan {filteredEbooks.length} dari {ebooks.length} e-book
                                    </p>
                                </div>
                            </div>

                            {/* Mobile Filter Toggle & Stats */}
                            <div className="flex items-center gap-3 lg:hidden">
                                <button
                                    onClick={() => setShowFilterSidebar(true)}
                                    className={`flex items-center gap-2 rounded-xl px-4 py-2.5 text-xs font-semibold transition-all duration-200 ${tc.bgSoft} ${tc.text} hover:scale-[1.02]`}
                                >
                                    <Filter className="h-3.5 w-3.5" />
                                    Filter
                                    {(searchQuery || selectedKategori.length > 0) && (
                                        <span className={`ml-1 flex h-5 w-5 items-center justify-center rounded-full text-[10px] font-bold text-white ${tc.bgGradient}`}>
                                            {(searchQuery ? 1 : 0) + selectedKategori.length}
                                        </span>
                                    )}
                                </button>
                            </div>
                        </div>
                    </motion.div>

                    {/* ===================== FILTER SIDEBAR (DESKTOP) & MAIN CONTENT ===================== */}
                    <div className="flex gap-8">
                        {/* ========== LEFT SIDEBAR FILTERS (Desktop) ========== */}
                        <aside className="hidden w-64 shrink-0 lg:block">
                            <div className="sticky top-28 space-y-6">
                                {/* Sidebar Header */}
                                {/* <div className="flex items-center gap-2">
                                    <div className={`rounded-lg p-1.5 ${tc.bgSoft}`}>
                                        <SlidersHorizontal className={`h-4 w-4 ${tc.text}`} />
                                    </div>
                                    <h3 className="text-sm font-bold text-gray-900 dark:text-white">
                                        Filter Ebook
                                    </h3>
                                </div> */}

                                {/* Sidebar Search */}
                                <div>
                                    <div className="group relative">
                                        <Search className={`absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 ${tc.text}`} />
                                        <input
                                            type="text"
                                            placeholder="Judul, penulis, ISBN..."
                                            value={searchQuery}
                                            onChange={(e) => setSearchQuery(e.target.value)}
                                            className={`w-full rounded-xl border border-gray-100 bg-white/80 py-2.5 pl-10 pr-8 text-sm text-gray-900 shadow-sm backdrop-blur-sm transition-all duration-200 placeholder:text-gray-400 focus:border-transparent focus:outline-none focus:ring-2 dark:border-gray-800 dark:bg-slate-900/80 dark:text-white dark:placeholder:text-gray-500 ${tc.ring}`}
                                        />
                                        {searchQuery && (
                                            <button
                                                onClick={() => setSearchQuery('')}
                                                className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                            >
                                                <X className="h-3.5 w-3.5" />
                                            </button>
                                        )}
                                    </div>
                                </div>

                                {/* Kategori Filter */}
                                <div>
                                    <label className="mb-3 block text-xs font-semibold uppercase tracking-wider text-gray-400 dark:text-gray-500">
                                        Kategori
                                    </label>
                                    <div className="space-y-1">
                                        {/* Pilih Semua */}
                                        {kategoris.length > 0 && (
                                            <button
                                                onClick={() => {
                                                    setSelectedKategori((prev) =>
                                                        prev.length === kategoris.length ? [] : [...kategoris],
                                                    );
                                                }}
                                                className={`group flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm font-medium transition-all duration-200 ${
                                                    selectedKategori.length === kategoris.length
                                                        ? `${tc.bgSoft} ${tc.text} shadow-sm`
                                                        : 'text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800/50'
                                                }`}
                                            >
                                                <div
                                                    className={`flex h-5 w-5 shrink-0 items-center justify-center rounded border-2 transition-all ${tc.text} ${
                                                        selectedKategori.length === kategoris.length
                                                            ? `${tc.accentBg} border-transparent text-white`
                                                            : selectedKategori.length > 0 && selectedKategori.length < kategoris.length
                                                              ? `${tc.bgSoft} border-current`
                                                              : 'border-gray-300 dark:border-gray-600 text-transparent'
                                                    }`}
                                                >
                                                    {selectedKategori.length === kategoris.length ? (
                                                        <svg className="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                                            <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                                                        </svg>
                                                    ) : selectedKategori.length > 0 && selectedKategori.length < kategoris.length ? (
                                                        <svg className="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                                            <path strokeLinecap="round" strokeLinejoin="round" d="M5 12h14" />
                                                        </svg>
                                                    ) : null}
                                                </div>
                                                <span className="font-semibold">Pilih Semua</span>
                                                <span className="ml-auto text-xs text-gray-400">{ebooks.length}</span>
                                            </button>
                                        )}

                                        {/* Divider */}
                                        {kategoris.length > 0 && (
                                            <div className="my-1 border-t border-gray-100 dark:border-gray-800" />
                                        )}

                                        {kategoris.map((kat) => {
                                            const count = ebooks.filter((b) => b.klasifikasi?.kategori === kat).length;
                                            const isChecked = selectedKategori.includes(kat);
                                            return (
                                                <button
                                                    key={kat}
                                                    onClick={() => {
                                                        setSelectedKategori((prev) =>
                                                            prev.includes(kat)
                                                                ? prev.filter((k) => k !== kat)
                                                                : [...prev, kat],
                                                        );
                                                    }}
                                                    className={`group flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm font-medium transition-all duration-200 ${
                                                        isChecked
                                                            ? `${tc.bgSoft} ${tc.text} shadow-sm`
                                                            : 'text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800/50'
                                                    }`}
                                                >
                                                    {/* Square checkbox */}
                                                    <div
                                                        className={`flex h-5 w-5 shrink-0 items-center justify-center rounded border-2 transition-all ${
                                                            isChecked
                                                                ? `${tc.accentBg} border-transparent`
                                                                : 'border-gray-300 dark:border-gray-600'
                                                        }`}
                                                    >
                                                        {isChecked && (
                                                            <svg className="h-3 w-3 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                                                <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                                                            </svg>
                                                        )}
                                                    </div>
                                                    <span className="truncate">{kat}</span>
                                                    <span className="ml-auto text-xs text-gray-400">{count}</span>
                                                </button>
                                            );
                                        })}
                                    </div>
                                </div>

                                {/* Active Filters Summary */}
                                {(searchQuery || selectedKategori.length > 0) && (
                                    <div className="rounded-xl border border-gray-100 bg-gray-50/50 p-3 dark:border-gray-800 dark:bg-gray-900/50">
                                        <p className="mb-2 text-[10px] font-semibold uppercase tracking-wider text-gray-400 dark:text-gray-500">
                                            Filter Aktif
                                        </p>
                                        <div className="flex flex-wrap gap-1.5">
                                            {searchQuery && (
                                                <span className="inline-flex items-center gap-1 rounded-lg bg-white px-2 py-1 text-[10px] font-medium text-gray-600 shadow-sm dark:bg-slate-800 dark:text-gray-300">
                                                    Cari: "{searchQuery}"
                                                    <button onClick={() => setSearchQuery('')}>
                                                        <X className="h-3 w-3" />
                                                    </button>
                                                </span>
                                            )}
                                            {selectedKategori.map((kat) => (
                                                <span key={kat} className="inline-flex items-center gap-1 rounded-lg bg-white px-2 py-1 text-[10px] font-medium text-gray-600 shadow-sm dark:bg-slate-800 dark:text-gray-300">
                                                    {kat}
                                                    <button onClick={() => setSelectedKategori((prev) => prev.filter((k) => k !== kat))}>
                                                        <X className="h-3 w-3" />
                                                    </button>
                                                </span>
                                            ))}
                                        </div>
                                    </div>
                                )}

                                {/* Reset All */}
                                {(searchQuery || selectedKategori.length > 0) && (
                                    <button
                                        onClick={() => {
                                            setSearchQuery('');
                                            setSelectedKategori([]);
                                        }}
                                        className={`flex w-full items-center justify-center gap-2 rounded-xl px-4 py-2.5 text-xs font-semibold transition-all duration-200 ${tc.bgSoft} ${tc.text} hover:scale-[1.02]`}
                                    >
                                        <X className="h-3.5 w-3.5" />
                                        Reset Semua Filter
                                    </button>
                                )}
                            </div>
                        </aside>

                        {/* ========== MOBILE FILTER DRAWER (Overlay) ========== */}
                        <AnimatePresence>
                            {showFilterSidebar && (
                                <>
                                    {/* Backdrop */}
                                    <motion.div
                                        initial={{ opacity: 0 }}
                                        animate={{ opacity: 1 }}
                                        exit={{ opacity: 0 }}
                                        transition={{ duration: 0.2 }}
                                        onClick={() => setShowFilterSidebar(false)}
                                        className="fixed inset-0 z-[70] bg-black/40 backdrop-blur-sm lg:hidden"
                                    />
                                    {/* Drawer */}
                                    <motion.aside
                                        initial={{ x: '-100%' }}
                                        animate={{ x: 0 }}
                                        exit={{ x: '-100%' }}
                                        transition={{ type: 'spring', damping: 30, stiffness: 300 }}
                                        className="fixed inset-y-0 left-0 z-[80] w-72 overflow-y-auto border-r border-gray-100 bg-white p-6 shadow-2xl dark:border-gray-800 dark:bg-slate-950 lg:hidden"
                                    >
                                        <div className="mb-6 flex items-center justify-between">
                                            <div className="flex items-center gap-2">
                                                <div className={`rounded-lg p-1.5 ${tc.bgSoft}`}>
                                                    <SlidersHorizontal className={`h-4 w-4 ${tc.text}`} />
                                                </div>
                                                <h3 className="text-sm font-bold text-gray-900 dark:text-white">
                                                    Filter
                                                </h3>
                                            </div>
                                            <button
                                                onClick={() => setShowFilterSidebar(false)}
                                                className="flex h-8 w-8 items-center justify-center rounded-lg text-gray-400 transition-colors hover:bg-gray-100 hover:text-gray-600 dark:hover:bg-gray-800"
                                            >
                                                <X className="h-4 w-4" />
                                            </button>
                                        </div>

                                        {/* Mobile Search */}
                                        <div className="mb-6">
                                            <label className="mb-2 block text-xs font-semibold uppercase tracking-wider text-gray-400 dark:text-gray-500">
                                                Cari
                                            </label>
                                            <div className="group relative">
                                                <Search className={`absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 ${tc.text}`} />
                                                <input
                                                    type="text"
                                                    placeholder="Judul, penulis, ISBN..."
                                                    value={searchQuery}
                                                    onChange={(e) => setSearchQuery(e.target.value)}
                                                    className={`w-full rounded-xl border border-gray-100 bg-white/80 py-2.5 pl-10 pr-8 text-sm text-gray-900 shadow-sm backdrop-blur-sm transition-all duration-200 placeholder:text-gray-400 focus:border-transparent focus:outline-none focus:ring-2 dark:border-gray-800 dark:bg-slate-900/80 dark:text-white dark:placeholder:text-gray-500 ${tc.ring}`}
                                                />
                                                {searchQuery && (
                                                    <button
                                                        onClick={() => setSearchQuery('')}
                                                        className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                                    >
                                                        <X className="h-3.5 w-3.5" />
                                                    </button>
                                                )}
                                            </div>
                                        </div>

                                        {/* Mobile Kategori */}
                                        <div className="mb-6">
                                            <label className="mb-3 block text-xs font-semibold uppercase tracking-wider text-gray-400 dark:text-gray-500">
                                                Kategori
                                            </label>
                                            <div className="space-y-1">
                                                {/* Pilih Semua */}
                                                {kategoris.length > 0 && (
                                                    <button
                                                        onClick={() => {
                                                            setSelectedKategori((prev) =>
                                                                prev.length === kategoris.length ? [] : [...kategoris],
                                                            );
                                                        }}
                                                        className={`group flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm font-medium transition-all duration-200 ${
                                                            selectedKategori.length === kategoris.length
                                                                ? `${tc.bgSoft} ${tc.text} shadow-sm`
                                                                : 'text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800/50'
                                                        }`}
                                                    >
                                                        <div
                                                            className={`flex h-5 w-5 shrink-0 items-center justify-center rounded border-2 transition-all ${tc.text} ${
                                                                selectedKategori.length === kategoris.length
                                                                    ? `${tc.accentBg} border-transparent text-white`
                                                                    : selectedKategori.length > 0 && selectedKategori.length < kategoris.length
                                                                      ? `${tc.bgSoft} border-current`
                                                                      : 'border-gray-300 dark:border-gray-600 text-transparent'
                                                            }`}
                                                        >
                                                            {selectedKategori.length === kategoris.length ? (
                                                                <svg className="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                                                    <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                                                                </svg>
                                                            ) : selectedKategori.length > 0 && selectedKategori.length < kategoris.length ? (
                                                                <svg className="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                                                    <path strokeLinecap="round" strokeLinejoin="round" d="M5 12h14" />
                                                                </svg>
                                                            ) : null}
                                                        </div>
                                                        <span className="font-semibold">Pilih Semua</span>
                                                        <span className="ml-auto text-xs text-gray-400">{ebooks.length}</span>
                                                    </button>
                                                )}

                                                {/* Divider */}
                                                {kategoris.length > 0 && (
                                                    <div className="my-1 border-t border-gray-100 dark:border-gray-800" />
                                                )}

                                                {kategoris.map((kat) => {
                                                    const count = ebooks.filter((b) => b.klasifikasi?.kategori === kat).length;
                                                    const isChecked = selectedKategori.includes(kat);
                                                    return (
                                                        <button
                                                            key={kat}
                                                            onClick={() => {
                                                                setSelectedKategori((prev) =>
                                                                    prev.includes(kat)
                                                                        ? prev.filter((k) => k !== kat)
                                                                        : [...prev, kat],
                                                                );
                                                            }}
                                                            className={`group flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm font-medium transition-all duration-200 ${
                                                                isChecked
                                                                    ? `${tc.bgSoft} ${tc.text} shadow-sm`
                                                                    : 'text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800/50'
                                                            }`}
                                                        >
                                                            {/* Square checkbox */}
                                                            <div
                                                                className={`flex h-5 w-5 shrink-0 items-center justify-center rounded border-2 transition-all ${
                                                                    isChecked
                                                                        ? `${tc.accentBg} border-transparent`
                                                                        : 'border-gray-300 dark:border-gray-600'
                                                                }`}
                                                            >
                                                                {isChecked && (
                                                                    <svg className="h-3 w-3 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                                                        <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                                                                    </svg>
                                                                )}
                                                            </div>
                                                            <span className="truncate">{kat}</span>
                                                            <span className="ml-auto text-xs text-gray-400">{count}</span>
                                                        </button>
                                                    );
                                                })}
                                            </div>
                                        </div>

                                        {(searchQuery || selectedKategori.length > 0) && (
                                            <button
                                                onClick={() => {
                                                    setSearchQuery('');
                                                    setSelectedKategori([]);
                                                    setShowFilterSidebar(false);
                                                }}
                                                className={`flex w-full items-center justify-center gap-2 rounded-xl px-4 py-2.5 text-xs font-semibold transition-all duration-200 ${tc.bgSoft} ${tc.text}`}
                                            >
                                                <X className="h-3.5 w-3.5" />
                                                Reset Semua Filter
                                            </button>
                                        )}
                                    </motion.aside>
                                </>
                            )}
                        </AnimatePresence>

                        {/* ========== MAIN CONTENT ========== */}
                        <div className="min-w-0 flex-1">
                            {/* Ebook Grid */}
                            {filteredEbooks.length > 0 ? (
                                <motion.div
                                    className="grid grid-cols-3 gap-4 sm:grid-cols-3 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5"
                                    variants={containerVariants}
                                    initial="hidden"
                                    animate="show"
                                >
                                    {filteredEbooks.map((ebook) => (
                                        <motion.div
                                            key={ebook.id}
                                            variants={cardVariants}
                                            className={`group relative overflow-hidden rounded-xl border border-gray-100 bg-white shadow-sm transition-all duration-500 hover:-translate-y-2 hover:shadow-xl dark:border-gray-800 dark:bg-slate-900 ${tc.cardBorder}`}
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
                                                        <BookOpen className="h-10 w-10 text-gray-200 dark:text-gray-700" />
                                                    </div>
                                                )}

                                                {/* Hover overlay with CTA */}
                                                <div className="absolute inset-0 flex items-center justify-center bg-gradient-to-t from-black/60 via-black/20 to-transparent opacity-0 transition-all duration-500 group-hover:opacity-100">
                                                    {ebook.file && (
                                                        <button
                                                            onClick={() => handleReadEbook(ebook.id)}
                                                            className={`translate-y-6 scale-90 rounded-xl px-4 py-2 text-xs font-semibold text-white shadow-lg opacity-0 transition-all duration-500 group-hover:translate-y-0 group-hover:scale-100 group-hover:opacity-100 ${tc.bgGradient} ${tc.shadow} cursor-pointer`}
                                                        >
                                                            Baca
                                                        </button>
                                                    )}
                                                </div>

                                                {/* Category badge */}
                                                {ebook.klasifikasi?.kategori && (
                                                    <span
                                                        className={`absolute top-2 left-2 max-w-[calc(100%-3rem)] truncate rounded-md px-1.5 py-0.5 text-[8px] font-bold uppercase tracking-wider text-white shadow-sm ${tc.accentBg}`}
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
                                                    className={`absolute top-2 right-2 flex h-7 w-7 items-center justify-center rounded-full bg-white/70 opacity-0 shadow-sm backdrop-blur-md transition-all duration-300 hover:scale-110 hover:bg-white group-hover:opacity-100 dark:bg-slate-900/70 dark:hover:bg-slate-900 ${
                                                        bookmarkedIds.has(ebook.id) ? 'opacity-100' : ''
                                                    }`}
                                                >
                                                    <Heart
                                                        className={`h-3.5 w-3.5 transition-all duration-300 ${
                                                            bookmarkedIds.has(ebook.id)
                                                                ? 'scale-110 fill-red-500 text-red-500'
                                                                : 'text-gray-600 dark:text-gray-300'
                                                        }`}
                                                    />
                                                </button>

                                                {/* Read count badge on cover */}
                                                {ebook.baca_histories_count != null &&
                                                    ebook.baca_histories_count > 0 && (
                                                        <div className="absolute bottom-2 left-2 flex items-center gap-1 rounded-full bg-black/40 px-2 py-0.5 text-[10px] text-white backdrop-blur-sm">
                                                            <Eye className="h-3 w-3" />
                                                            {ebook.baca_histories_count}x
                                                        </div>
                                                    )}
                                            </div>

                                            {/* Info */}
                                            <div className="p-3">
                                                <h3 className="line-clamp-2 text-xs font-bold leading-snug text-gray-900 transition-colors group-hover:text-gray-900 dark:text-white">
                                                    {ebook.judul}
                                                </h3>

                                                {ebook.penulis && (
                                                    <p className="mt-1 line-clamp-1 text-[10px] text-gray-400 dark:text-gray-500">
                                                        {ebook.penulis}
                                                    </p>
                                                )}

                                                <div className="mt-1.5 flex items-center justify-between text-[10px] text-gray-400 dark:text-gray-500">
                                                    {ebook.penerbit && (
                                                        <span className="line-clamp-1">{ebook.penerbit}</span>
                                                    )}
                                                    {ebook.tahun_terbit && (
                                                        <span className="shrink-0">{ebook.tahun_terbit}</span>
                                                    )}
                                                </div>

                                                {/* Rating / stats row */}
                                                <div className="mt-1.5 flex items-center gap-3 text-[10px] text-gray-400 dark:text-gray-500">
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
                        </div>
                    </div>
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
