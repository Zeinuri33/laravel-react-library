'use client';

import { Head, Link, usePage } from '@inertiajs/react';
import { useEffect, useState, useMemo } from 'react';
import { motion } from 'framer-motion';
import { Search, BookOpen, MapPin, SlidersHorizontal, X, Eye, Clock } from 'lucide-react';
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
    useEffect(() => {
        const handleScroll = () => setScrolled(window.scrollY > 10);
        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);

    const themeMaps: Record<string, any> = {
        emerald: {
            text: 'text-emerald-600 dark:text-emerald-400',
            bgSoft: 'bg-emerald-500/10 dark:bg-emerald-500/20',
            bgGradient: 'bg-gradient-to-r from-emerald-500 to-emerald-600 dark:from-emerald-600 dark:to-emerald-500',
            textGradient: 'from-emerald-500 to-emerald-300',
            ring: 'focus:ring-emerald-500/50',
            shadow: 'hover:shadow-emerald-500/30 dark:hover:shadow-emerald-500/30',
            glow: 'from-emerald-500/10',
            orb: 'bg-emerald-500/20 blur-[150px]',
            borderHover: 'hover:border-emerald-500/30 dark:hover:border-emerald-500/30',
            textWhite: 'text-white',
            badge: 'bg-emerald-500/10 text-emerald-600 dark:text-emerald-400',
            activeTab: 'text-emerald-600 dark:text-emerald-400 border-emerald-500',
        },
        red: {
            text: 'text-red-600 dark:text-red-400',
            bgSoft: 'bg-red-500/10 dark:bg-red-500/20',
            bgGradient: 'bg-gradient-to-r from-red-500 to-red-600 dark:from-red-600 dark:to-red-500',
            textGradient: 'from-red-500 to-red-300',
            ring: 'focus:ring-red-500/50',
            shadow: 'hover:shadow-red-500/30 dark:hover:shadow-red-500/30',
            glow: 'from-red-500/10',
            orb: 'bg-red-500/20 blur-[150px]',
            borderHover: 'hover:border-red-500/30 dark:hover:border-red-500/30',
            textWhite: 'text-white',
            badge: 'bg-red-500/10 text-red-600 dark:text-red-400',
            activeTab: 'text-red-600 dark:text-red-400 border-red-500',
        },
        indigo: {
            text: 'text-indigo-600 dark:text-indigo-400',
            bgSoft: 'bg-indigo-500/10 dark:bg-indigo-500/20',
            bgGradient: 'bg-gradient-to-r from-indigo-500 to-indigo-600 dark:from-indigo-600 dark:to-indigo-500',
            textGradient: 'from-indigo-500 to-indigo-300',
            ring: 'focus:ring-indigo-500/50',
            shadow: 'hover:shadow-indigo-500/30 dark:hover:shadow-indigo-500/30',
            glow: 'from-indigo-500/10',
            orb: 'bg-indigo-500/20 blur-[150px]',
            borderHover: 'hover:border-indigo-500/30 dark:hover:border-indigo-500/30',
            textWhite: 'text-white',
            badge: 'bg-indigo-500/10 text-indigo-600 dark:text-indigo-400',
            activeTab: 'text-indigo-600 dark:text-indigo-400 border-indigo-500',
        },
    };

    const tc = themeMaps[themeAccent] || themeMaps.emerald;

    // Extract unique kategoris
    const kategoris = useMemo(() => {
        const cats = new Set<string>();
        ebooks.forEach((b) => {
            if (b.klasifikasi?.kategori) cats.add(b.klasifikasi.kategori);
        });
        return Array.from(cats).sort();
    }, [ebooks]);

    // Filter and search
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

    return (
        <>
            <Head title="Baca E-Book" />

            <div className="relative min-h-screen overflow-hidden bg-slate-50 font-sans text-foreground transition-all duration-500 dark:bg-slate-950">
                {/* ORB BACKGROUND */}
                <div className={`pointer-events-none fixed top-1/3 right-0 -z-10 h-[600px] w-[600px] rounded-full ${tc.orb}`}></div>
                <div className={`pointer-events-none fixed -bottom-40 -left-40 -z-10 h-[500px] w-[500px] rounded-full ${tc.orb} opacity-60`}></div>

                {/* HEADER */}
                <header
                    className={`fixed top-0 left-0 z-[60] w-full transition-all duration-300 ${
                        scrolled
                            ? 'border-b border-gray-200/20 bg-white/70 shadow-sm backdrop-blur-xl dark:border-gray-800/30 dark:bg-gray-950/70'
                            : 'bg-transparent'
                    }`}
                >
                    <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-4">
                        <Link href="/" className="flex items-center gap-3">
                            <img src="/kubah.png" className="h-9 dark:hidden" alt="Logo" />
                            <img src="/kubah-putih.png" className="hidden h-9 dark:block" alt="Logo Dark" />
                            <div>
                                <h1 className="text-sm font-bold text-gray-900 dark:text-white">Digital Library</h1>
                                <p className="text-xs text-gray-500 dark:text-gray-400">Perpustakaan Ibrahimy</p>
                            </div>
                        </Link>

                        <div className="hidden items-center gap-4 md:flex">
                            <nav className="flex gap-5 text-sm font-medium text-gray-600 dark:text-gray-400">
                                <Link href="/" className="transition-colors hover:text-gray-900 dark:hover:text-white">Beranda</Link>
                                <Link href="/docs" className="transition-colors hover:text-gray-900 dark:hover:text-white">Panduan</Link>
                            </nav>

                            <div className="flex items-center gap-2 border-l border-gray-300 pl-4 dark:border-gray-700">
                                {COLOR_PRESETS.map((p) => (
                                    <button
                                        key={p.id}
                                        onClick={() => setThemeAccent(p.id)}
                                        className={`h-4 w-4 rounded-full transition-all hover:scale-110 ${
                                            themeAccent === p.id ? 'scale-110 ring-2 ring-offset-2' : 'opacity-70'
                                        }`}
                                        style={{ backgroundColor: p.color }}
                                        title={p.name}
                                    />
                                ))}
                            </div>

                            <AppearanceTabs />

                            {auth.user && (
                                <Link
                                    href="/dashboard"
                                    className={`inline-flex items-center gap-2 rounded-md px-4 py-2 text-sm font-semibold shadow-lg transition-all duration-300 hover:scale-105 ${tc.bgGradient} ${tc.textWhite}`}
                                >
                                    Dashboard
                                </Link>
                            )}
                        </div>

                        {/* MOBILE HAMBURGER */}
                        <button onClick={() => setOpen(!open)} className="relative h-6 w-6 md:hidden">
                            <motion.span
                                className="absolute top-0 left-0 h-[2px] w-6 bg-foreground"
                                animate={{ rotate: open ? 45 : 0, y: open ? 8 : 0 }}
                            />
                            <motion.span
                                className="absolute top-[8px] left-0 h-[2px] w-6 bg-foreground"
                                animate={{ opacity: open ? 0 : 1 }}
                            />
                            <motion.span
                                className="absolute top-[16px] left-0 h-[2px] w-6 bg-foreground"
                                animate={{ rotate: open ? -45 : 0, y: open ? -8 : 0 }}
                            />
                        </button>
                    </div>
                </header>

                {/* HERO SECTION */}
                <section className="relative pt-28 pb-12 md:pt-36 md:pb-16">
                    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                        <motion.div
                            className="text-center"
                            initial={{ opacity: 0, y: 30 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ duration: 0.6 }}
                        >
                            <div className="mx-auto mb-6 flex items-center justify-center gap-2">
                                <div className={`rounded-full p-3 ${tc.bgSoft}`}>
                                    <BookOpen className={`h-8 w-8 ${tc.text}`} />
                                </div>
                            </div>

                            <h1 className="text-4xl font-extrabold tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
                                Baca{' '}
                                <span className={`bg-gradient-to-r bg-clip-text text-transparent ${tc.textGradient}`}>
                                    E-Book
                                </span>
                            </h1>

                            <p className="mx-auto mt-4 max-w-2xl text-base text-gray-500 dark:text-gray-400">
                                Akses dan baca koleksi e-book perpustakaan Ibrahimy secara digital.
                                Tersedia berbagai kategori untuk menunjang belajar dan penelitian.
                            </p>
                        </motion.div>
                    </div>
                </section>

                {/* SEARCH & FILTERS */}
                <section className="relative z-10 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 pb-8">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.2, duration: 0.5 }}
                        className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between"
                    >
                        {/* SEARCH */}
                        <div className="relative w-full md:max-w-md">
                            <Search className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-gray-400" />
                            <input
                                type="text"
                                placeholder="Cari judul, penulis, atau ISBN..."
                                value={searchQuery}
                                onChange={(e) => setSearchQuery(e.target.value)}
                                className="w-full rounded-xl border border-gray-200/50 bg-white/80 py-3 pl-11 pr-10 text-sm text-gray-900 shadow-sm backdrop-blur-sm transition-all duration-200 placeholder:text-gray-400 focus:border-transparent focus:outline-none focus:ring-2 dark:border-gray-700/50 dark:bg-gray-900/80 dark:text-white dark:placeholder:text-gray-500"
                            />
                            {searchQuery && (
                                <button
                                    onClick={() => setSearchQuery('')}
                                    className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                >
                                    <X className="h-4 w-4" />
                                </button>
                            )}
                        </div>

                        {/* KATEGORI FILTER */}
                        <div className="flex flex-wrap items-center gap-2">
                            <SlidersHorizontal className="h-4 w-4 text-gray-400" />
                            <button
                                onClick={() => setSelectedKategori(null)}
                                className={`rounded-lg px-3 py-1.5 text-xs font-medium transition-all ${
                                    !selectedKategori
                                        ? `${tc.bgSoft} ${tc.text}`
                                        : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-400 dark:hover:bg-gray-700'
                                }`}
                            >
                                Semua
                            </button>
                            {kategoris.map((kat) => (
                                <button
                                    key={kat}
                                    onClick={() => setSelectedKategori(kat === selectedKategori ? null : kat)}
                                    className={`rounded-lg px-3 py-1.5 text-xs font-medium transition-all ${
                                        selectedKategori === kat
                                            ? `${tc.bgSoft} ${tc.text}`
                                            : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-400 dark:hover:bg-gray-700'
                                    }`}
                                >
                                    {kat}
                                </button>
                            ))}
                        </div>
                    </motion.div>

                    {/* STATS BAR */}
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.3 }}
                        className="mt-4 flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400"
                    >
                        <span>
                            Menampilkan{' '}
                            <span className={`font-semibold ${tc.text}`}>
                                {filteredEbooks.length}
                            </span>{' '}
                            dari{' '}
                            <span className="font-semibold">{ebooks.length}</span> e-book
                        </span>

                        {titiks.length > 0 && (
                            <span className="flex items-center gap-1">
                                <MapPin className="h-3.5 w-3.5" />
                                {titiks.length} Titik Baca Tersedia
                            </span>
                        )}
                    </motion.div>
                </section>

                {/* EBOOK GRID */}
                <section className="relative z-10 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 pb-20">
                    {filteredEbooks.length > 0 ? (
                        <motion.div
                            className="grid gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5"
                            initial="hidden"
                            animate="show"
                            variants={{
                                hidden: {},
                                show: {
                                    transition: { staggerChildren: 0.05 },
                                },
                            }}
                        >
                            {filteredEbooks.map((ebook, i) => (
                                <motion.div
                                    key={ebook.id}
                                    variants={{
                                        hidden: { opacity: 0, y: 20, scale: 0.95 },
                                        show: { opacity: 1, y: 0, scale: 1 },
                                    }}
                                    transition={{ duration: 0.4, ease: 'easeOut' }}
                                    className={`group relative overflow-hidden rounded-xl border border-gray-200/50 bg-white/80 shadow-sm backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:border-gray-700/50 dark:bg-gray-900/80 ${tc.borderHover} ${tc.shadow}`}
                                >
                                    {/* COVER */}
                                    <div className="relative aspect-[3/4] overflow-hidden bg-gradient-to-b from-gray-100 to-gray-200 dark:from-gray-800 dark:to-gray-900">
                                        {ebook.cover ? (
                                            <img
                                                src={`/storage/${ebook.cover}`}
                                                alt={ebook.judul}
                                                className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
                                                loading="lazy"
                                            />
                                        ) : (
                                            <div className="flex h-full items-center justify-center">
                                                <BookOpen className="h-12 w-12 text-gray-300 dark:text-gray-600" />
                                            </div>
                                        )}

                                        {/* OVERLAY ON HOVER */}
                                        <div className="absolute inset-0 flex items-center justify-center bg-black/0 transition-all duration-300 group-hover:bg-black/40">
                                            {ebook.file && (
                                                <Link
                                                    href={`/titikbaca/${ebook.id}/baca`}
                                                    className={`translate-y-4 scale-95 rounded-lg px-5 py-2.5 text-sm font-semibold text-white opacity-0 shadow-lg transition-all duration-300 group-hover:translate-y-0 group-hover:scale-100 group-hover:opacity-100 ${tc.bgGradient}`}
                                                >
                                                    Baca
                                                </Link>
                                            )}
                                        </div>

                                        {/* KATEGORI BADGE */}
                                        {ebook.klasifikasi?.kategori && (
                                            <span
                                                className={`absolute top-3 left-3 rounded-md px-2 py-1 text-[10px] font-semibold uppercase tracking-wider ${tc.badge}`}
                                            >
                                                {ebook.klasifikasi.kategori}
                                            </span>
                                        )}
                                    </div>

                                    {/* INFO */}
                                    <div className="p-4">
                                        <h3 className="line-clamp-2 text-sm font-semibold leading-snug text-gray-900 transition-colors group-hover:text-gray-900 dark:text-white">
                                            {ebook.judul}
                                        </h3>

                                        {ebook.penulis && (
                                            <p className="mt-1 line-clamp-1 text-xs text-gray-500 dark:text-gray-400">
                                                {ebook.penulis}
                                            </p>
                                        )}

                                        <div className="mt-2 flex items-center justify-between text-[10px] text-gray-400 dark:text-gray-500">
                                            {ebook.penerbit && <span>{ebook.penerbit}</span>}
                                            {ebook.tahun_terbit && <span>{ebook.tahun_terbit}</span>}
                                        </div>

                                        {/* READ STATS */}
                                        <div className="mt-2 flex items-center gap-3 text-[10px] text-gray-400 dark:text-gray-500">
                                            {ebook.baca_histories_count != null && ebook.baca_histories_count > 0 && (
                                                <span className="flex items-center gap-1">
                                                    <Eye className="h-3 w-3" />
                                                    {ebook.baca_histories_count}x
                                                </span>
                                            )}
                                            {ebook.total_menit_baca != null && ebook.total_menit_baca > 0 && (
                                                <span className="flex items-center gap-1">
                                                    <Clock className="h-3 w-3" />
                                                    {ebook.total_menit_baca} menit
                                                </span>
                                            )}
                                        </div>
                                    </div>
                                </motion.div>
                            ))}
                        </motion.div>
                    ) : (
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            className="flex flex-col items-center justify-center py-24 text-center"
                        >
                            <div className="rounded-full bg-gray-100 p-6 dark:bg-gray-800">
                                <Search className="h-10 w-10 text-gray-400" />
                            </div>
                            <h3 className="mt-6 text-xl font-semibold text-gray-900 dark:text-white">
                                {searchQuery ? 'E-book tidak ditemukan' : 'Belum ada e-book'}
                            </h3>
                            <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">
                                {searchQuery
                                    ? 'Coba gunakan kata kunci yang berbeda'
                                    : 'Belum ada koleksi e-book yang tersedia'}
                            </p>
                            {searchQuery && (
                                <button
                                    onClick={() => setSearchQuery('')}
                                    className={`mt-4 rounded-lg px-4 py-2 text-sm font-medium transition-colors ${tc.bgSoft} ${tc.text}`}
                                >
                                    Reset pencarian
                                </button>
                            )}
                        </motion.div>
                    )}
                </section>

                <Footer
                    tc={{
                        footerBg: 'bg-white/50 dark:bg-[#020817]/50',
                        footerBorder: `border-gray-200/30 dark:border-gray-800/30`,
                        textGradient: tc.textGradient,
                        text: tc.text,
                        socialBorder: 'border-gray-200/30 dark:border-gray-700/30',
                        bgSoft: 'bg-gray-100/50 dark:bg-gray-800/50',
                        socialHover: 'hover:bg-gray-200/50 dark:hover:bg-gray-700/50',
                        linkHover: tc.text.replace('text-', 'hover:text-'),
                        textPrimary: tc.text,
                    }}
                />
            </div>
        </>
    );
}
