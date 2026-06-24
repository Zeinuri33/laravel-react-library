'use client';

import { useEffect, useState, useMemo } from 'react';
import { Head, Link, usePage, router } from '@inertiajs/react';
import AppearanceTabs from '@/components/appearance-tabs';
import Footer from '@/layouts/footer';
import Pagination from '@/layouts/Pagination';
import { SearchX } from 'lucide-react';
import { motion } from 'framer-motion';
import { useTheme } from '@/context/ThemeContext';

/* ================= OPAC CONFIG ================= */
const OPAC_API = 'https://opac.ibrahimy.ac.id/api/BukuApiController.php';
const OPAC_TOKEN = 'lib180597';

/* ================= HELPERS ================= */
const highlight = (
    text: string,
    keyword: string,
    themeTextClass: string = 'text-emerald-500',
) => {
    if (!keyword) return text;

    // 1. Daftar kata yang diabaikan (Indonesian Stop Words)
    const stopWords = [
        'dan', 'di', 'ke', 'dari', 'yang', 'pada', 'untuk',
        'dengan', 'dalam', 'ini', 'itu', 'adalah', 'atau'
    ];

    // 2. Pecah keyword dan saring kata yang tidak penting
    const words = keyword.split(' ').filter((w) => {
        // Bersihkan karakter aneh
        const cleanWord = w.toLowerCase().replace(/[^a-z0-9]/g, '');
        // Abaikan jika panjang kata kurang dari 3 huruf atau termasuk stop words
        return cleanWord.length > 2 && !stopWords.includes(cleanWord);
    });

    // Jika setelah disaring tidak ada kata yang tersisa, kembalikan teks asli
    if (words.length === 0) return text;

    let result = text;

    words.forEach((w) => {
        // Escape karakter khusus regex agar tidak error
        const escaped = w.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');

        // 3. Gunakan \b (Word Boundary) agar hanya mewarnai kata utuh
        // Contoh: "dan" tidak akan mewarnai "badan" atau "dandan"
        const regex = new RegExp(`\\b(${escaped})\\b`, 'gi');

        result = result.replace(
            regex,
            `<span class="${themeTextClass} font-semibold">$1</span>`,
        );
    });

    return result;
};

const cleanSnippet = (html: string) => {
    if (!html) return '';
    return html.replace(/<[^>]+>/g, '');
};

type TabType =
    | 'all'
    | 'book'
    | 'wiki'
    | 'journal'
    | 'article'
    | 'ibrahimy'
    | 'dspace';

const COLOR_PRESETS = [
    { id: 'emerald', name: 'Emerald Green', color: '#10b981' },
    { id: 'red', name: 'Ruby Red', color: '#ef4444' },
    { id: 'indigo', name: 'Deep Indigo', color: '#6366f1' },
];

export default function Result() {
    const [open, setOpen] = useState(false);
    const [scrolled, setScrolled] = useState(false);

    const { themeAccent: themeColor, setThemeAccent: changeTheme } = useTheme();

    type ThemeColor = 'emerald' | 'indigo' | 'red';

    const themeStyles: Record<ThemeColor, any> = {
        emerald: {
            text: 'text-emerald-500',
            bg: 'bg-emerald-500',
            bgGlow: 'bg-emerald-500/10',
            ring: 'focus-within:ring-emerald-500',
            border: 'border-emerald-500',
            textGradient: 'from-emerald-500 to-emerald-300',
            badge: 'text-emerald-700 bg-emerald-500/10 dark:text-emerald-300',
            tabActive: 'text-emerald-500 dark:text-emerald-400',
            tabBorder: 'bg-emerald-500 dark:bg-emerald-400',
            btnPrimary:
                'bg-emerald-500 hover:bg-emerald-400 text-white shadow-lg shadow-emerald-500/20',
            highlight: 'text-emerald-600 dark:text-emerald-400',
            paginationActive:
                'border-emerald-500/50 bg-emerald-500/10 text-emerald-600 dark:text-emerald-400',
            cardHover:
                'hover:shadow-emerald-500/10 hover:border-emerald-500/50',
            badgeSecondary:
                'bg-emerald-500/5 text-emerald-600 dark:text-emerald-400 border border-emerald-500/10',
        },

        indigo: {
            text: 'text-indigo-500',
            bg: 'bg-indigo-500',
            bgGlow: 'bg-indigo-500/10',
            ring: 'focus-within:ring-indigo-500',
            border: 'border-indigo-500',
            textGradient: 'from-indigo-500 to-indigo-300',
            badge: 'text-indigo-700 bg-indigo-500/10 dark:text-indigo-300',
            tabActive: 'text-indigo-500 dark:text-indigo-400',
            tabBorder: 'bg-indigo-500 dark:bg-indigo-400',
            btnPrimary:
                'bg-indigo-500 hover:bg-indigo-400 text-white shadow-lg shadow-indigo-500/20',
            highlight: 'text-indigo-600 dark:text-indigo-400',
            paginationActive:
                'border-indigo-500/50 bg-indigo-500/10 text-indigo-600 dark:text-indigo-400',
            cardHover:
                'hover:shadow-indigo-500/10 hover:border-indigo-500/50',
            badgeSecondary:
                'bg-indigo-500/5 text-indigo-600 dark:text-indigo-400 border border-indigo-500/10',
        },

        red: {
            text: 'text-red-500',
            bg: 'bg-red-500',
            bgGlow: 'bg-red-500/10',
            ring: 'focus-within:ring-red-500',
            border: 'border-red-500',
            textGradient: 'from-red-500 to-red-300',
            badge: 'text-red-700 bg-red-500/10 dark:text-red-300',
            tabActive: 'text-red-500 dark:text-red-400',
            tabBorder: 'bg-red-500 dark:bg-red-400',
            btnPrimary:
                'bg-red-500 hover:bg-red-400 text-white shadow-lg shadow-red-500/20',
            highlight: 'text-red-600 dark:text-red-400',
            paginationActive:
                'border-red-500/50 bg-red-500/10 text-red-600 dark:text-red-400',
            cardHover:
                'hover:shadow-red-500/10 hover:border-red-500/50',
            badgeSecondary:
                'bg-red-500/5 text-red-600 dark:text-red-400 border border-red-500/10',
        },
    };
    const currentTheme =
        themeStyles[themeColor as keyof typeof themeStyles] ||
        themeStyles.emerald;

    useEffect(() => {
        const handleScroll = () => {
            setScrolled(window.scrollY > 10);
        };

        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);

    const { url } = usePage();

    const query = new URLSearchParams(url.split('?')[1]).get('q') || '';

    /* ================= STATE ================= */
    const [loading, setLoading] = useState(false);

    const [books, setBooks] = useState<any[]>([]);
    const [totalBooks, setTotalBooks] = useState(0);
    const [wiki, setWiki] = useState<any[]>([]);
    const [journals, setJournals] = useState<any[]>([]);
    const [articles, setArticles] = useState<any[]>([]);
    const [searchTime, setSearchTime] = useState(0);

    const [loadingWiki, setLoadingWiki] = useState(false);
    const [loadingBooks, setLoadingBooks] = useState(false);
    const [loadingJournals, setLoadingJournals] = useState(false);
    const [loadingArticles, setLoadingArticles] = useState(false);

    const [limitBook, setLimitBook] = useState(10);
    const [limitWiki, setLimitWiki] = useState(10);
    const [limitJournal, setLimitJournal] = useState(10);
    const [limitArticle, setLimitArticle] = useState(10);
    const [limitIbrahmy, setLimitIbrahmy] = useState(10);

    const [pageBook, setPageBook] = useState(1);
    const [pageWiki, setPageWiki] = useState(1);
    const [pageJournal, setPageJournal] = useState(1);
    const [pageArticle, setPageArticle] = useState(1);
    const [pageIbrahmy, setPageIbrahmy] = useState(1);

    const perPage = 10;

    // const paginatedBooks = books.slice(
    //     (pageBook - 1) * perPage,
    //     pageBook * perPage,
    // );

    const paginatedWiki = wiki.slice(
        (pageWiki - 1) * perPage,
        pageWiki * perPage,
    );

    const paginatedJournals = journals.slice(
        (pageJournal - 1) * perPage,
        pageJournal * perPage,
    );

    const paginatedArticles = articles.slice(
        (pageArticle - 1) * perPage,
        pageArticle * perPage,
    );

    const ibrahimyResults = useMemo(() => {
        const combined = [...journals, ...articles];

        return combined.filter((item) => {
            try {
                const url = new URL(item.link);
                return url.hostname.includes('journal.ibrahimy.ac.id');
            } catch {
                return false;
            }
        });
    }, [journals, articles]);

    const paginatedIbrahmy = ibrahimyResults.slice(
        (pageIbrahmy - 1) * perPage,
        pageIbrahmy * perPage,
    );

    const [input, setInput] = useState(query);
    const params = new URLSearchParams(url.split('?')[1]);
    const initialTab = (params.get('tab') as TabType) || 'all';

    const [tab, setTab] = useState<TabType>(initialTab);

    const [dspace, setDspace] = useState<any[]>([]);
    const [loadingDspace, setLoadingDspace] = useState(false);
    const [pageDspace, setPageDspace] = useState(1);

    const paginatedDspace = dspace.slice(
        (pageDspace - 1) * perPage,
        pageDspace * perPage,
    );

    /* ================= PENGAMBILAN DATA BUKU DENGAN PAGINATION ================= */
    useEffect(() => {
        if (!query) return;

        const fetchBooks = async () => {
            setLoadingBooks(true);
            try {
                // Tambahkan parameter &page=${pageBook}&limit=${perPage}
                const res = await fetch(
                    `${OPAC_API}?token=${OPAC_TOKEN}&q=${query}&page=${pageBook}&limit=${perPage}`,
                );
                const data = await res.json();

                if (data.status === 'success') {
                    setBooks(data.data || []);
                    setTotalBooks(data.total_data || 0); // Ambil total data dari API
                } else {
                    setBooks([]);
                    setTotalBooks(0);
                }
            } catch (e) {
                console.error('BOOK ERROR:', e);
                setBooks([]);
                setTotalBooks(0);
            } finally {
                setLoadingBooks(false);
            }
        };

        fetchBooks();
    }, [query, pageBook]);

    /* ================= FETCH ================= */
    useEffect(() => {
        if (!query) return;

        setLimitBook(10);
        setLimitWiki(10);
        setLimitJournal(10);
        setLimitArticle(10);
        setLimitIbrahmy(10);

        const fetchData = async () => {
            const start = performance.now();

            /* ================= BOOK ================= */
            // const fetchBooks = async () => {
            //     setLoadingBooks(true);
            //     try {
            //         const res = await fetch(
            //             `${OPAC_API}?token=${OPAC_TOKEN}&q=${query}`,
            //         );
            //         const data = await res.json();
            //         setBooks(data?.data || []);
            //     } catch (e) {
            //         console.error('BOOK ERROR:', e);
            //         setBooks([]);
            //     } finally {
            //         setLoadingBooks(false);
            //     }
            // };

            /* ================= WIKI ================= */
            const fetchWiki = async () => {
                setLoadingWiki(true);
                try {
                    const res = await fetch(
                        `https://id.wikipedia.org/w/api.php?action=query&list=search&format=json&origin=*&srsearch=${query}`,
                    );
                    const data = await res.json();
                    setWiki(data?.query?.search || []);
                } catch (e) {
                    console.error('WIKI ERROR:', e);
                    setWiki([]);
                } finally {
                    setLoadingWiki(false);
                }
            };

            /* ================= DOAJ ================= */
            const fetchJournals = async () => {
                setLoadingJournals(true);
                try {
                    const res = await fetch(
                        `https://doaj.org/api/v2/search/articles/title:${encodeURIComponent(query)}?pageSize=100`,
                    );
                    const data = await res.json();

                    setJournals(
                        data?.results?.map((item: any) => {
                            const bib = item.bibjson;

                            const rawLink =
                                bib?.link?.find(
                                    (l: any) => l.type === 'fulltext',
                                )?.url || bib?.link?.[0]?.url;

                            return {
                                title: bib?.title || 'Tanpa Judul',
                                link: rawLink
                                    ? rawLink.startsWith('http')
                                        ? rawLink
                                        : `https://${rawLink}`
                                    : '#',

                                // ✅ FIX AUTHOR (kadang format beda)
                                author: Array.isArray(bib?.author)
                                    ? bib.author.map((a: any) => ({
                                        name:
                                            a.name ||
                                            `${a.given || ''} ${a.family || ''}`.trim(),
                                    }))
                                    : [],

                                // ✅ FIX ABSTRACT (bersihin HTML)
                                abstract: bib?.abstract
                                    ? bib.abstract.replace(/<[^>]+>/g, '')
                                    : '',
                            };
                        }) || [],
                    );
                } catch (e) {
                    console.error('DOAJ ERROR:', e);
                    setJournals([]);
                } finally {
                    setLoadingJournals(false);
                }
            };

            /* ================= CROSSREF ================= */
            const fetchArticles = async () => {
                setLoadingArticles(true);
                try {
                    const res = await fetch(
                        `https://api.crossref.org/works?query.title=${encodeURIComponent(query)}&rows=100`,
                    );
                    const data = await res.json();

                    setArticles(
                        data?.message?.items?.map((item: any) => ({
                            title: item.title?.[0] || 'Tanpa Judul',
                            link: item.DOI
                                ? `https://doi.org/${item.DOI}`
                                : '#',
                            hasDOI: !!item.DOI,

                            // ✅ AUTHOR
                            author: Array.isArray(item.author)
                                ? item.author.map((a: any) => ({
                                    name:
                                        a.name ||
                                        `${a.given || ''} ${a.family || ''}`.trim() ||
                                        'Unknown',
                                }))
                                : [],

                            // ✅ ABSTRACT (BERSIHKAN HTML)
                            abstract: item.abstract
                                ? item.abstract.replace(/<[^>]+>/g, '')
                                : '',

                            // ✅ PUBLISHER
                            publisher: item.publisher || '',

                            // ✅ YEAR
                            year: item.issued?.['date-parts']?.[0]?.[0] || '',
                        })) || [],
                    );
                } catch (e) {
                    console.error('CROSSREF ERROR:', e);
                    setArticles([]);
                } finally {
                    setLoadingArticles(false);
                }
            };

            /* ================= DSPACE ================= */
            const fetchDspace = async () => {
                setLoadingDspace(true);
                try {
                    // Panggil API Laravel di server Anda
                    const res = await fetch(`/api/repository-search?q=${encodeURIComponent(query)}`);

                    if (!res.ok) throw new Error(`HTTP Error ${res.status}`);

                    const data = await res.json();

                    if (data.status === 'success' && data.results) {
                        const formattedDspace = data.results.map((item: any) => ({
                            name: item.name || 'Tanpa Judul',
                            handle: item.handle,
                            abstract: item.abstract || '',
                            // Pisahkan author menggunakan koma jika ada pemisah ||
                            author: item.author ? item.author.replace(/ \|\| /g, ', ') : 'Unknown Author',
                            year: item.year || '-',
                            collection_name: item.collection_name,
                            url: item.handle ? `https://repository.ibrahimy.ac.id/handle/${item.handle}` : '#',
                        }));

                        setDspace(formattedDspace);
                    } else {
                        setDspace([]);
                    }
                } catch (e) {
                    console.error('DSPACE ERROR:', e);
                    setDspace([]);
                } finally {
                    setLoadingDspace(false);
                }
            };

            /* JALANKAN SEMUA BARENG */
            await Promise.all([
                // fetchBooks(),
                fetchWiki(),
                fetchJournals(),
                fetchArticles(),
                fetchDspace(),
            ]);

            const end = performance.now();
            setSearchTime((end - start) / 1000);
        };

        fetchData();
    }, [query]);

    /* ================= FILTERED DATA ================= */
    const filtered = {
        book: books,
        wiki: wiki,
        journal: journals,
        article: articles,
        dspace: dspace,
    };

    const totalResults =
        books.length +
        wiki.length +
        journals.length +
        articles.length +
        dspace.length;

    /* ================= UI ================= */
    return (
        <>
            <Head title={query ? `Hasil pencarian: ${query}` : 'Home'} />

            <div className="relative min-h-screen overflow-hidden bg-slate-50 pt-24 text-slate-900 transition-colors duration-300 dark:bg-slate-950 dark:text-slate-100">
                {/* HEADER */}
                <header
                    className={`fixed top-0 left-0 z-[60] w-full transition-all duration-300 ${open ? 'pointer-events-none opacity-0' : 'opacity-100'
                        } ${scrolled
                            ? 'border-white/10 bg-background/60 backdrop-blur-md'
                            : ''
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
                                    className={`
        text-md font-bold
        bg-gradient-to-r bg-clip-text text-transparent
        ${currentTheme.textGradient}
    `}
                                >
                                    Digital Library
                                </h1>
                                <p className="text-xs text-slate-500 dark:text-slate-400">
                                    Perpustakaan Ibrahimy
                                    {/* NPP. 35121244H0000001 */}
                                </p>
                            </motion.div>
                        </Link>

                        {/* DESKTOP */}
                        <div className="items-center gap-4 md:flex">
                            {/* Color Presets */}
                            <div className="hidden items-center gap-2 border-r border-slate-300 pr-4 dark:border-white/10 sm:flex">
                                {COLOR_PRESETS.map((p) => (
                                    <button
                                        key={p.id}
                                        onClick={() => changeTheme(p.id as any)}
                                        className={`h-5 w-5 rounded-full transition-all hover:scale-110 ${themeColor === p.id ? `scale-110 ring-2 ring-offset-2 ring-[${p.color}] dark:ring-offset-slate-950` : 'opacity-70'}`}
                                        style={{ backgroundColor: p.color }}
                                        title={p.name}
                                    />
                                ))}
                            </div>

                            <AppearanceTabs />
                        </div>
                    </div>
                </header>

                <div className="relative z-10 mx-auto max-w-5xl px-4 pb-8 sm:px-6 md:px-12">
                    {/* Logo Light */}
                    <img
                        src="/kubah.png"
                        alt="Kubah"
                        className="mx-auto w-45 md:w-45 dark:hidden"
                    />
                    {/* Logo Dark */}
                    <img
                        src="/kubah-putih.png"
                        alt="Kubah Dark"
                        className="mx-auto hidden w-45 md:w-45 dark:block"
                    />
                    <h1
                        className={`
                            text-center text-3xl font-black md:text-5xl pb-2
                            bg-gradient-to-r bg-clip-text text-transparent
                            ${currentTheme.textGradient}
                        `}
                    >
                        Digilib Search
                    </h1>
                    <p className="relative z-10 mx-auto mt-2 max-w-5xl px-4 pb-8 text-center text-xs text-slate-500 sm:px-6 md:px-12 dark:text-slate-400">
                        Penelusuran artikel, jurnal, buku, dan koleksi digital.
                    </p>
                    <form
                        onSubmit={(e) => {
                            e.preventDefault();
                            router.get('/result', {
                                q: input,
                                tab: tab,
                            });
                        }}
                        className="relative mx-auto w-full max-w-3xl"
                    >
                        <div
                            className={`relative flex items-center overflow-hidden rounded-2xl border border-slate-200/50 bg-white/60 p-1.5 shadow-xl ring-0 backdrop-blur-md transition-all duration-300 dark:border-white/10 dark:bg-slate-900/60 dark:focus-within:border-transparent dark:focus-within:ring-offset-[#030712]`}
                        >
                            <div className="flex-1 px-4">
                                <input
                                    autoFocus
                                    value={input}
                                    onChange={(e) => setInput(e.target.value)}
                                    placeholder="Cari buku, jurnal, artikel..."
                                    className="w-full bg-transparent py-3 text-slate-900 placeholder-slate-400 focus:outline-none dark:text-slate-100 dark:placeholder-slate-500"
                                />
                            </div>
                            <button
                                type="submit"
                                className={`rounded-xl px-6 py-3 text-sm font-semibold transition-all duration-300 ${currentTheme.btnPrimary} shadow-md`}
                            >
                                Cari
                            </button>
                        </div>
                    </form>
                </div>

                {/* BACKGROUND BLUR DYNAMIC */}
                <div
                    aria-hidden="true"
                    className="pointer-events-none absolute inset-0 z-0 flex items-start justify-center overflow-hidden"
                >
                    <div
                        className={`-mt-40 h-[600px] w-[800px] rounded-full blur-[150px] ${currentTheme.bgGlow} transition-colors duration-500`}
                    />
                </div>

                <div className="relative z-10 mx-auto max-w-5xl px-4 pb-4 sm:px-6 md:px-12">
                    {/* SEARCH QUERY INFO */}
                    {query && (
                        <p className="mb-4 text-center text-sm text-slate-500">
                            {/* Ditemukan sekitar {totalResults} hasil ({searchTime.toFixed(2)} detik) untuk{" "} */}
                            Hasil pencarian untuk{' '}
                            <span
                                className={`font-semibold ${currentTheme.text}`}
                            >
                                "{query}"
                            </span>
                        </p>
                    )}
                </div>

                <div className="relative z-10 mx-auto max-w-5xl px-4 pb-8 sm:px-6 md:px-12">
                    <div className="scrollbar-hide mx-auto mb-6 flex items-end gap-6 overflow-x-auto overflow-y-hidden border-b border-slate-200/50 pb-px whitespace-nowrap dark:border-slate-800/50">
                        {[
                            { key: 'all', label: 'Semua' },
                            { key: 'book', label: 'Buku' },
                            { key: 'wiki', label: 'Ensiklopedia' },
                            { key: 'journal', label: 'Jurnal' },
                            { key: 'article', label: 'Artikel' },
                            { key: 'ibrahimy', label: 'Jurnal Ibrahimy' },
                            { key: 'dspace', label: 'Ibrahimy Repository' },
                        ].map((t) => (
                            <button
                                key={t.key}
                                onClick={() => setTab(t.key as TabType)}
                                className={`relative shrink-0 px-2 pb-3 text-sm font-medium transition-colors ${tab === t.key
                                    ? currentTheme.tabActive
                                    : 'text-slate-500 hover:text-slate-800 dark:text-slate-400 dark:hover:text-slate-200'
                                    }`}
                            >
                                {t.label}

                                {/* underline */}
                                <span
                                    className={`absolute bottom-0 left-0 h-[2px] w-full origin-left transition-transform duration-300 ${currentTheme.tabBorder} ${tab === t.key
                                        ? 'scale-x-100'
                                        : 'scale-x-0'
                                        }`}
                                />
                            </button>
                        ))}
                    </div>
                </div>

                {/* NO QUERY */}
                {!query && (
                    <p className="text-center text-slate-400">
                        Masukkan kata kunci pencarian
                    </p>
                )}

                {/* LOADING */}
                {loading && (
                    <div className="mx-auto max-w-4xl animate-pulse space-y-6">
                        {[...Array(5)].map((_, i) => (
                            <div
                                key={i}
                                className="rounded-xl bg-white/60 p-4 shadow backdrop-blur-sm dark:border dark:border-white/5 dark:bg-slate-900/60"
                            >
                                {/* label */}
                                <div className="mb-3 h-3 w-20 rounded bg-slate-100 dark:bg-slate-900/60"></div>

                                {/* title */}
                                <div className="mb-2 h-5 w-3/4 rounded bg-slate-200 dark:bg-slate-900/60"></div>

                                {/* snippet */}
                                <div className="mb-1 h-4 w-full rounded bg-slate-100 dark:bg-slate-900/60"></div>
                                <div className="h-4 w-5/6 rounded bg-slate-100 dark:bg-slate-900/60"></div>
                            </div>
                        ))}
                    </div>
                )}

                {/* RESULTS */}
                <div className="relative z-10 mx-auto max-w-5xl space-y-6 px-4 pb-8 sm:px-6 md:px-12">
                    {/* ================= WIKI ================= */}
                    {(tab === 'all' || tab === 'wiki') &&
                        (loadingWiki ? (
                            <div className="animate-pulse space-y-2 rounded-xl bg-white/60 p-4 shadow backdrop-blur-sm dark:border dark:border-white/5 dark:bg-slate-900/60">
                                <div className="h-4 w-32 rounded bg-slate-200"></div>
                                <div className="h-5 w-3/4 rounded bg-slate-200"></div>
                                <div className="h-4 w-full rounded bg-slate-100"></div>
                            </div>
                        ) : (
                            <>
                                {/* ================= EMPTY STATE (ONLY WIKI TAB OR ALL BUT NO DATA) ================= */}
                                {wiki.length === 0 && tab === 'wiki' && (
                                    <div className="flex flex-col items-center justify-center py-20 text-center">
                                        <motion.div
                                            initial={{ scale: 0.6, opacity: 0 }}
                                            animate={{ scale: 1, opacity: 1 }}
                                            transition={{ duration: 0.4 }}
                                            className="text-slate-400 dark:text-slate-500"
                                        >
                                            <SearchX size={56} />
                                        </motion.div>

                                        <motion.p
                                            initial={{ y: 10, opacity: 0 }}
                                            animate={{ y: 0, opacity: 1 }}
                                            transition={{ delay: 0.1 }}
                                            className="mt-4 text-lg font-semibold text-slate-600 dark:text-slate-300"
                                        >
                                            Ensiklopedia tidak ditemukan
                                        </motion.p>

                                        <motion.p
                                            initial={{ y: 10, opacity: 0 }}
                                            animate={{ y: 0, opacity: 1 }}
                                            transition={{ delay: 0.2 }}
                                            className="text-sm text-slate-400 dark:text-slate-500"
                                        >
                                            Coba gunakan kata kunci yang berbeda
                                        </motion.p>

                                        <motion.div
                                            initial={{ opacity: 0 }}
                                            animate={{ opacity: 1 }}
                                            transition={{ delay: 0.3 }}
                                            className="mt-4 text-xs text-slate-400 dark:text-slate-600"
                                        >
                                            Misalnya: "hadits", "fiqih", "AI",
                                            "database"
                                        </motion.div>
                                    </div>
                                )}

                                {/* ================= RESULTS ================= */}
                                {wiki.length > 0 && (
                                    <>
                                        {(tab === 'all'
                                            ? wiki.slice(0, 1)
                                            : paginatedWiki
                                        ).map((item: any, i: number) => {
                                            const link = `https://id.wikipedia.org/wiki/${encodeURIComponent(
                                                item.title.replace(/ /g, '_'),
                                            )}`;

                                            return (
                                                <a
                                                    key={`w-${i}`}
                                                    href={link}
                                                    target="_blank"
                                                    rel="noopener noreferrer"
                                                    className={`group mb-4 block rounded-2xl border border-slate-200/50 bg-white/60 p-6 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                                >
                                                    {tab !== 'all' && (
                                                        <span
                                                            className={`inline-block rounded-md px-2 py-1 text-xs font-semibold tracking-wider uppercase ${currentTheme.badge}`}
                                                        >
                                                            WIKIPEDIA
                                                        </span>
                                                    )}

                                                    <h2
                                                        className="mt-1 text-lg font-semibold text-slate-900 group-hover:underline dark:text-slate-100"
                                                        dangerouslySetInnerHTML={{
                                                            __html: highlight(
                                                                item.title,
                                                                query,
                                                                currentTheme.text,
                                                            ),
                                                        }}
                                                    />

                                                    <p className="mt-1 line-clamp-2 text-sm text-slate-500">
                                                        {cleanSnippet(
                                                            item.snippet,
                                                        )}
                                                    </p>
                                                </a>
                                            );
                                        })}

                                        {/* ================= PAGINATION ================= */}
                                        {tab === 'wiki' && (
                                            <Pagination
                                                currentPage={pageWiki}
                                                totalItems={wiki.length}
                                                perPage={perPage}
                                                onPageChange={setPageWiki}
                                                currentTheme={currentTheme}
                                            />
                                        )}
                                    </>
                                )}
                            </>
                        ))}

                    {/* ================= BOOK ================= */}
                    {(tab === 'all' || tab === 'book') &&
                        (loadingBooks ? (
                            tab === 'all' ? (
                                /* ================= LOADING HORIZONTAL (ALL) ================= */
                                <div className="flex gap-4 overflow-x-auto pb-2">
                                    {[...Array(6)].map((_, i) => (
                                        <div
                                            key={i}
                                            className="max-w-[141px] min-w-[141px] flex-shrink-0 animate-pulse rounded-xl bg-slate-100 p-2 dark:bg-gray-800"
                                        >
                                            {/* COVER */}
                                            <div className="h-45 w-full rounded bg-slate-200 dark:bg-slate-900/60"></div>

                                            {/* TITLE */}
                                            <div className="mt-2 h-3 w-3/4 rounded bg-slate-200 dark:bg-slate-900/60"></div>
                                            <div className="mt-1 h-3 w-1/2 rounded bg-slate-100 dark:bg-slate-900/60"></div>
                                        </div>
                                    ))}
                                </div>
                            ) : (
                                /* ================= LOADING LIST (BOOK TAB) ================= */
                                <div className="animate-pulse space-y-2 rounded-xl bg-white/60 p-5 shadow backdrop-blur-sm dark:border dark:border-white/5 dark:bg-slate-900/60">
                                    {[...Array(5)].map((_, i) => (
                                        <div key={i} className="flex gap-4">
                                            <div className="h-45 w-33 rounded bg-slate-200 dark:bg-slate-900/60"></div>
                                            <div className="flex-1 space-y-2">
                                                <div className="h-4 w-3/4 rounded bg-slate-200 dark:bg-slate-900/60"></div>
                                                <div className="h-3 w-1/2 rounded bg-slate-100 dark:bg-slate-900/60"></div>
                                                <div className="h-3 w-full rounded bg-slate-100 dark:bg-slate-900/60"></div>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            )
                        ) : (
                            <>
                                {tab === 'book' &&
                                    !loadingBooks &&
                                    books.length === 0 && (
                                        <div className="flex flex-col items-center justify-center py-20 text-center">
                                            <motion.div
                                                initial={{
                                                    scale: 0.6,
                                                    opacity: 0,
                                                }}
                                                animate={{
                                                    scale: 1,
                                                    opacity: 1,
                                                }}
                                                transition={{ duration: 0.4 }}
                                                className="text-slate-400 dark:text-slate-500"
                                            >
                                                <SearchX size={56} />
                                            </motion.div>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.1 }}
                                                className="mt-4 text-lg font-semibold text-slate-600 dark:text-slate-300"
                                            >
                                                Buku tidak ditemukan
                                            </motion.p>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.2 }}
                                                className="text-sm text-slate-400 dark:text-slate-500"
                                            >
                                                Coba kata kunci lain atau
                                                gunakan filter berbeda
                                            </motion.p>

                                            <motion.div
                                                initial={{ opacity: 0 }}
                                                animate={{ opacity: 1 }}
                                                transition={{ delay: 0.3 }}
                                                className="mt-4 text-xs text-slate-400 dark:text-slate-600"
                                            >
                                                Contoh: "fiqih", "AI",
                                                "database", "hadits"
                                            </motion.div>
                                        </div>
                                    )}
                                {tab === 'all' ? (
                                    /* ================= HORIZONTAL (ALL) ================= */
                                    <div className="flex gap-4 overflow-x-auto pb-2">
                                        {books.slice(0, 6).map((b, i) => {
                                            const cover =
                                                b.image_url && b.image_url !== '-'
                                                    ? b.image_url
                                                    : 'https://opac.ibrahimy.ac.id/images/default/image.png';

                                            return (
                                                <a
                                                    key={i}
                                                    href={b.opac_url}
                                                    target="_blank"
                                                    rel="noopener noreferrer"
                                                    className={`group max-w-[141px] min-w-[141px] flex-shrink-0 rounded-2xl border border-slate-200/50 bg-white/60 p-4 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                                >
                                                    {/* COVER */}
                                                    <img
                                                        src={cover}
                                                        alt={b.title}
                                                        className="h-45 w-full rounded object-cover"
                                                    />

                                                    {/* TITLE */}
                                                    <p
                                                        className="mt-2 line-clamp-2 text-xs font-medium text-gray-800 group-hover:underline dark:text-gray-200"
                                                        dangerouslySetInnerHTML={{
                                                            __html: highlight(
                                                                b.title ||
                                                                'Tanpa Judul',
                                                                query,
                                                                currentTheme.text,
                                                            ),
                                                        }}
                                                    />
                                                </a>
                                            );
                                        })}
                                    </div>
                                ) : (
                                    /* ================= LIST DETAIL (BOOK TAB) ================= */
                                    <>
                                        <ul className="space-y-4">
                                            {books.map((b, i) => {
                                                const cover = b.image_url ? b.image_url : 'https://opac.ibrahimy.ac.id/images/default/image.png';

                                                return (
                                                    <li
                                                        key={i}
                                                        className={`group mb-4 flex flex-col sm:flex-row gap-6 rounded-2xl border border-slate-200/50 bg-white/60 p-6 backdrop-blur-sm transition-all duration-300 will-change-transform hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                                    >
                                                        {/* KIRI: COVER */}
                                                        <div className="shrink-0">
                                                            <img
                                                                src={cover}
                                                                alt={b.title}
                                                                className="h-48 w-32 rounded object-cover shadow-sm border border-slate-200 dark:border-slate-700"
                                                            />
                                                        </div>

                                                        {/* TENGAH: DETAIL BUKU */}
                                                        <div className="flex-1 flex flex-col justify-start">
                                                            {/* Judul & Label */}
                                                            <div className="mb-2">
                                                                <span className={`inline-block mb-2 rounded-md px-2 py-1 text-[10px] font-bold tracking-wider uppercase ${currentTheme.badge}`}>
                                                                    OPAC IBRAHIMY
                                                                </span>

                                                                {/* TITLE (Sekarang Menjadi Tautan / Link) */}
                                                                <div className="text-xl font-semibold text-slate-900 dark:text-slate-100">
                                                                    <a
                                                                        href={b.opac_url}
                                                                        target="_blank"
                                                                        rel="noopener noreferrer"
                                                                        className="transition hover:text-blue-600 dark:hover:text-blue-400 hover:underline"
                                                                        dangerouslySetInnerHTML={{
                                                                            __html: highlight(b.title || 'Tanpa Judul', query, currentTheme.text),
                                                                        }}
                                                                    />
                                                                </div>
                                                            </div>

                                                            {/* Tombol Author (Pills) */}
                                                            {b.authors && b.authors !== '-' && (
                                                                <div className="mb-4 flex flex-wrap gap-2">
                                                                    {b.authors.split('||').slice(0, 5).map((author, idx) => (
                                                                        <button
                                                                            key={idx}
                                                                            onClick={(e) => {
                                                                                e.preventDefault();
                                                                                e.stopPropagation();
                                                                                setInput(author.trim());
                                                                                router.get('/result', { q: author.trim(), tab: 'book' });
                                                                            }}
                                                                            className="rounded-full border border-slate-200 bg-white px-3 py-1 text-xs text-slate-600 transition hover:bg-slate-50 dark:border-slate-700 dark:bg-slate-800 dark:text-slate-300 dark:hover:bg-slate-700 shadow-sm"
                                                                        >
                                                                            {author.trim()}
                                                                        </button>
                                                                    ))}
                                                                </div>
                                                            )}

                                                            {/* Detail Metadata Text (Tabel Rapi) */}
                                                            <div className="mt-4 grid grid-cols-[140px_1fr] gap-y-2 text-[13px] text-slate-800 dark:text-slate-200">
                                                                <div className="font-bold text-slate-900 dark:text-slate-100">Edisi</div>
                                                                <div>{b.edition && b.edition !== '' ? b.edition : '-'}</div>

                                                                <div className="font-bold text-slate-900 dark:text-slate-100">ISBN/ISSN</div>
                                                                <div>{b.isbn_issn && b.isbn_issn !== '' ? b.isbn_issn : '-'}</div>

                                                                <div className="font-bold text-slate-900 dark:text-slate-100">Deskripsi Fisik</div>
                                                                <div>{b.collation && b.collation !== '' ? b.collation : '-'}</div>

                                                                <div className="font-bold text-slate-900 dark:text-slate-100">Judul Seri</div>
                                                                <div>{b.series_title && b.series_title !== '' ? b.series_title : '-'}</div>

                                                                <div className="font-bold text-slate-900 dark:text-slate-100">No. Panggil</div>
                                                                <div>{b.call_number && b.call_number !== '' ? b.call_number : '-'}</div>
                                                            </div>
                                                        </div>

                                                        {/* KANAN: KOTAK KETERSEDIAAN & TOMBOL AKSI */}
                                                        <div className="shrink-0 w-full sm:w-36 flex flex-col gap-2">
                                                            {/* Kotak Angka Ketersediaan */}
                                                            <div className="border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 rounded-lg p-4 flex flex-col items-center justify-center text-center shadow-sm">
                                                                <span className="text-[11px] font-medium text-slate-500 dark:text-slate-400 uppercase tracking-wider mb-2">Ketersediaan</span>
                                                                <span className="text-4xl font-light text-slate-800 dark:text-slate-100">
                                                                    {b.total_items ? b.total_items : '0'}
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                );
                                            })}
                                        </ul>

                                        {/* ================= PAGINATION ================= */}
                                        <Pagination
                                            currentPage={pageBook}
                                            totalItems={totalBooks}
                                            perPage={perPage}
                                            onPageChange={setPageBook}
                                            currentTheme={currentTheme}
                                        />
                                    </>
                                )}
                            </>
                        ))}

                    {/* ================= JOURNAL ================= */}
                    {(tab === 'all' || tab === 'journal') &&
                        (loadingJournals ? (
                            <div className="animate-pulse space-y-3">
                                {[...Array(3)].map((_, i) => (
                                    <div
                                        key={i}
                                        className="rounded-xl bg-gray-100 p-4 dark:border dark:border-white/5 dark:bg-slate-900/60"
                                    >
                                        <div className="mb-2 h-3 w-24 rounded bg-slate-200"></div>
                                        <div className="mb-2 h-5 w-3/4 rounded bg-slate-200"></div>
                                        <div className="h-4 w-full rounded bg-slate-100"></div>
                                    </div>
                                ))}
                            </div>
                        ) : (
                            <>
                                {tab === 'journal' &&
                                    !loadingJournals &&
                                    journals.length === 0 && (
                                        <div className="flex flex-col items-center justify-center py-20 text-center">
                                            <motion.div
                                                initial={{
                                                    scale: 0.6,
                                                    opacity: 0,
                                                }}
                                                animate={{
                                                    scale: 1,
                                                    opacity: 1,
                                                }}
                                                transition={{ duration: 0.4 }}
                                                className="text-slate-400 dark:text-slate-500"
                                            >
                                                <SearchX size={56} />
                                            </motion.div>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.1 }}
                                                className="mt-4 text-lg font-semibold text-slate-600 dark:text-slate-300"
                                            >
                                                Jurnal tidak ditemukan
                                            </motion.p>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.2 }}
                                                className="text-sm text-slate-400 dark:text-slate-500"
                                            >
                                                Coba kata kunci lain atau
                                                gunakan topik berbeda
                                            </motion.p>

                                            <motion.div
                                                initial={{ opacity: 0 }}
                                                animate={{ opacity: 1 }}
                                                transition={{ delay: 0.3 }}
                                                className="mt-4 text-xs text-slate-400 dark:text-slate-600"
                                            >
                                                Contoh: "hadits", "fiqih", "AI",
                                                "ekonomi Islam"
                                            </motion.div>
                                        </div>
                                    )}
                                {(tab === 'all'
                                    ? journals.slice(0, 3)
                                    : paginatedJournals
                                ).map((item, i) => {
                                    let hostname = '';

                                    try {
                                        hostname = new URL(item.link).hostname;
                                    } catch { }

                                    return (
                                        <a
                                            key={`j-${i}`}
                                            href={item.link}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            className={`group mb-4 block rounded-2xl border border-slate-200/50 bg-white/60 p-6 backdrop-blur-sm transition-all duration-300 will-change-transform hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                        >
                                            {/* LABEL */}
                                            <span
                                                className={`inline-block rounded-md px-2 py-1 text-xs font-semibold tracking-wider uppercase ${currentTheme.badge}`}
                                            >
                                                JURNAL ILMIAH
                                            </span>

                                            {/* TITLE */}
                                            <h2
                                                className="mt-1 text-lg font-semibold text-slate-900 group-hover:underline dark:text-slate-100"
                                                dangerouslySetInnerHTML={{
                                                    __html: highlight(
                                                        item.title,
                                                        query,
                                                        currentTheme.text,
                                                    ),
                                                }}
                                            />

                                            {/* AUTHORS */}
                                            {item.author?.length > 0 && (
                                                <div className="mt-2 flex flex-wrap gap-2">
                                                    {item.author
                                                        .slice(0, 5)
                                                        .map(
                                                            (
                                                                a: any,
                                                                i: number,
                                                            ) => (
                                                                <span
                                                                    key={i}
                                                                    className={`rounded-md px-2 py-1 text-xs ${currentTheme.badgeSecondary}`}
                                                                >
                                                                    {a.name}
                                                                </span>
                                                            ),
                                                        )}
                                                </div>
                                            )}

                                            {/* ABSTRACT */}
                                            <p className="mt-2 line-clamp-2 text-sm text-slate-600 dark:text-slate-300">
                                                {item.abstract
                                                    ? item.abstract.replace(
                                                        /<[^>]+>/g,
                                                        '',
                                                    )
                                                    : 'Tidak ada abstrak'}
                                            </p>

                                            {/* HOSTNAME */}
                                            <p className="mt-2 truncate text-xs text-slate-500">
                                                {hostname || 'Link tidak valid'}
                                            </p>
                                        </a>
                                    );
                                })}

                                {/* ================= PAGINATION ================= */}
                                {tab === 'journal' && (
                                    <Pagination
                                        currentPage={pageJournal}
                                        totalItems={journals.length}
                                        perPage={perPage}
                                        onPageChange={setPageJournal}
                                        currentTheme={currentTheme}
                                    />
                                )}
                            </>
                        ))}

                    {/* ================= ARTICLE ================= */}
                    {(tab === 'all' || tab === 'article') &&
                        (loadingArticles ? (
                            <div className="rounded-xl bg-gray-100 p-4 dark:border dark:border-white/5 dark:bg-slate-900/60">
                                <div className="mb-2 h-3 w-24 rounded bg-slate-200"></div>
                                <div className="mb-2 h-5 w-3/4 rounded bg-slate-200"></div>
                                <div className="h-4 w-full rounded bg-slate-100"></div>
                            </div>
                        ) : (
                            <>
                                {/* ================= EMPTY STATE ================= */}
                                {tab === 'article' &&
                                    !loadingArticles &&
                                    articles.length === 0 && (
                                        <div className="flex flex-col items-center justify-center py-20 text-center">
                                            <motion.div
                                                initial={{
                                                    scale: 0.6,
                                                    opacity: 0,
                                                }}
                                                animate={{
                                                    scale: 1,
                                                    opacity: 1,
                                                }}
                                                transition={{ duration: 0.4 }}
                                                className="text-slate-400 dark:text-slate-500"
                                            >
                                                <SearchX size={56} />
                                            </motion.div>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.1 }}
                                                className="mt-4 text-lg font-semibold text-slate-600 dark:text-slate-300"
                                            >
                                                Artikel tidak ditemukan
                                            </motion.p>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.2 }}
                                                className="text-sm text-slate-400 dark:text-slate-500"
                                            >
                                                Coba kata kunci lain atau
                                                gunakan topik berbeda
                                            </motion.p>

                                            <motion.div
                                                initial={{ opacity: 0 }}
                                                animate={{ opacity: 1 }}
                                                transition={{ delay: 0.3 }}
                                                className="mt-4 text-xs text-slate-400 dark:text-slate-600"
                                            >
                                                Contoh: "AI", "ekonomi",
                                                "Islam", "pendidikan"
                                            </motion.div>
                                        </div>
                                    )}
                                {(tab === 'all'
                                    ? articles.slice(0, 3)
                                    : paginatedArticles
                                ).map((item, i) => {
                                    let hostname = '';

                                    try {
                                        hostname = new URL(item.link).hostname;
                                    } catch {
                                        hostname = item.hasDOI
                                            ? 'doi.org'
                                            : 'crossref.org';
                                    }

                                    return (
                                        <a
                                            key={`a-${i}`}
                                            href={item.link}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            className={`group mb-4 block rounded-2xl border border-slate-200/50 bg-white/60 p-6 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                        >
                                            {/* LABEL */}
                                            <span
                                                className={`inline-block rounded-md px-2 py-1 text-xs font-semibold tracking-wider uppercase ${currentTheme.badge}`}
                                            >
                                                ARTIKEL ILMIAH
                                            </span>

                                            {/* TITLE */}
                                            <h2
                                                className="mt-1 text-lg font-semibold text-slate-900 group-hover:underline dark:text-slate-100"
                                                dangerouslySetInnerHTML={{
                                                    __html: highlight(
                                                        item.title ||
                                                        'Tanpa Judul',
                                                        query,
                                                        currentTheme.text,
                                                    ),
                                                }}
                                            />

                                            {/* AUTHOR */}
                                            {item.author?.length > 0 && (
                                                <div className="mt-2 flex flex-wrap gap-2">
                                                    {item.author
                                                        .slice(0, 5)
                                                        .map(
                                                            (
                                                                a: any,
                                                                i: number,
                                                            ) => (
                                                                <span
                                                                    key={i}
                                                                    className={`rounded-md px-2 py-1 text-xs ${currentTheme.badgeSecondary}`}
                                                                >
                                                                    {a.name}
                                                                </span>
                                                            ),
                                                        )}
                                                </div>
                                            )}

                                            <p className="mt-2 line-clamp-1 text-sm text-slate-600 dark:text-slate-300">
                                                {item.abstract}
                                            </p>

                                            <p className="mt-2 text-xs text-slate-500">
                                                {hostname}
                                                {item.publisher &&
                                                    ` • ${item.publisher}`}
                                                {item.year && ` • ${item.year}`}
                                            </p>
                                        </a>
                                    );
                                })}

                                {/* ================= PAGINATION ================= */}
                                {tab === 'article' && (
                                    <Pagination
                                        currentPage={pageArticle}
                                        totalItems={articles.length}
                                        perPage={perPage}
                                        onPageChange={setPageArticle}
                                        currentTheme={currentTheme}
                                    />
                                )}
                            </>
                        ))}

                    {/* ================= IBRAHIMY ================= */}
                    {(tab === 'all' || tab === 'ibrahimy') &&
                        (loadingJournals || loadingArticles ? (
                            <div className="rounded-xl bg-gray-100 p-4 dark:border dark:border-white/5 dark:bg-slate-900/60">
                                <div className="mb-2 h-3 w-24 rounded bg-slate-200"></div>
                                <div className="mb-2 h-5 w-3/4 rounded bg-slate-200"></div>
                                <div className="h-4 w-full rounded bg-slate-100"></div>
                            </div>
                        ) : (
                            <>
                                {/* ================= EMPTY STATE ================= */}
                                {tab === 'ibrahimy' &&
                                    !loadingJournals &&
                                    ibrahimyResults.length === 0 && (
                                        <div className="flex flex-col items-center justify-center py-20 text-center">
                                            <motion.div
                                                initial={{
                                                    scale: 0.6,
                                                    opacity: 0,
                                                }}
                                                animate={{
                                                    scale: 1,
                                                    opacity: 1,
                                                }}
                                                transition={{ duration: 0.4 }}
                                                className="text-slate-400 dark:text-slate-500"
                                            >
                                                <SearchX size={56} />
                                            </motion.div>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.1 }}
                                                className="mt-4 text-lg font-semibold text-slate-600 dark:text-slate-300"
                                            >
                                                Jurnal Ibrahimy tidak ditemukan
                                            </motion.p>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.2 }}
                                                className="text-sm text-slate-400 dark:text-slate-500"
                                            >
                                                Coba kata kunci lain atau
                                                gunakan topik berbeda
                                            </motion.p>

                                            <motion.div
                                                initial={{ opacity: 0 }}
                                                animate={{ opacity: 1 }}
                                                transition={{ delay: 0.3 }}
                                                className="mt-4 text-xs text-slate-400 dark:text-slate-600"
                                            >
                                                Contoh: "hadits", "fiqih", "AI",
                                                "ekonomi Islam"
                                            </motion.div>
                                        </div>
                                    )}
                                {ibrahimyResults.length > 0
                                    ? (tab === 'all'
                                        ? ibrahimyResults.slice(0, 3)
                                        : paginatedIbrahmy
                                    ).map((item, i) => {
                                        let hostname = '';
                                        try {
                                            hostname = new URL(item.link)
                                                .hostname;
                                        } catch { }

                                        return (
                                            <a
                                                key={`ib-${i}`}
                                                href={item.link}
                                                target="_blank"
                                                rel="noopener noreferrer"
                                                className={`group mb-4 block rounded-2xl border border-slate-200/50 bg-white/60 p-6 backdrop-blur-sm transition-all duration-300 will-change-transform hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                            >
                                                {/* LABEL */}
                                                <span
                                                    className={`inline-block rounded-md px-2 py-1 text-xs font-semibold tracking-wider uppercase ${currentTheme.badge}`}
                                                >
                                                    JURNAL IBRAHIMY
                                                </span>

                                                {/* TITLE + HIGHLIGHT */}
                                                <h2
                                                    className="mt-1 text-lg font-semibold text-slate-900 group-hover:underline dark:text-slate-100"
                                                    dangerouslySetInnerHTML={{
                                                        __html: highlight(
                                                            item.title ||
                                                            'Tanpa Judul',
                                                            query,
                                                            currentTheme.text,
                                                        ),
                                                    }}
                                                />

                                                {/* AUTHOR */}
                                                {item.author?.length > 0 && (
                                                    <div className="mt-2 flex flex-wrap gap-2">
                                                        {item.author
                                                            .slice(0, 5)
                                                            .map(
                                                                (
                                                                    a: any,
                                                                    i: number,
                                                                ) => (
                                                                    <span
                                                                        key={
                                                                            i
                                                                        }
                                                                        className={`rounded-md px-2 py-1 text-xs ${currentTheme.badgeSecondary}`}
                                                                    >
                                                                        {
                                                                            a.name
                                                                        }
                                                                    </span>
                                                                ),
                                                            )}
                                                    </div>
                                                )}

                                                {/* ABSTRACT */}
                                                <p className="mt-2 line-clamp-2 text-sm text-slate-600 dark:text-slate-300">
                                                    {item.abstract
                                                        ? item.abstract.replace(
                                                            /<[^>]+>/g,
                                                            '',
                                                        )
                                                        : 'Tidak ada abstrak'}
                                                </p>

                                                {/* META */}
                                                <p className="mt-2 text-xs text-slate-500">
                                                    {[
                                                        hostname,
                                                        item.publisher,
                                                        item.year,
                                                    ]
                                                        .filter(Boolean)
                                                        .join(' • ')}
                                                </p>
                                            </a>
                                        );
                                    })
                                    : tab === 'ibrahimy' && (
                                        <p className="text-center text-slate-400">
                                            Tidak ada hasil dari
                                            journal.ibrahimy.ac.id
                                        </p>
                                    )}

                                {/* ================= PAGINATION ================= */}
                                {tab === 'ibrahimy' && (
                                    <Pagination
                                        currentPage={pageIbrahmy}
                                        totalItems={ibrahimyResults.length}
                                        perPage={perPage}
                                        onPageChange={setPageIbrahmy}
                                        currentTheme={currentTheme}
                                    />
                                )}
                            </>
                        ))}

                    {/* ================= DSPACE ================= */}
                    {(tab === 'all' || tab === 'dspace') &&
                        (loadingDspace ? (
                            <div className="animate-pulse rounded-xl bg-gray-100 p-4 dark:border dark:border-white/5 dark:bg-slate-900/60">
                                <div className="mb-2 h-3 w-24 rounded bg-slate-200"></div>
                                <div className="mb-2 h-5 w-3/4 rounded bg-slate-200"></div>
                                <div className="h-4 w-full rounded bg-slate-100"></div>
                            </div>
                        ) : (
                            <>
                                {/* EMPTY STATE */}
                                {tab === 'dspace' &&
                                    !loadingDspace &&
                                    dspace.length === 0 && (
                                        <div className="flex flex-col items-center justify-center py-20 text-center">
                                            <motion.div
                                                initial={{
                                                    scale: 0.6,
                                                    opacity: 0,
                                                }}
                                                animate={{
                                                    scale: 1,
                                                    opacity: 1,
                                                }}
                                                transition={{ duration: 0.4 }}
                                                className="text-slate-400 dark:text-slate-500"
                                            >
                                                <SearchX size={56} />
                                            </motion.div>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.1 }}
                                                className="mt-4 text-lg font-semibold text-slate-600 dark:text-slate-300"
                                            >
                                                Repository DSpace tidak
                                                ditemukan
                                            </motion.p>

                                            <motion.p
                                                initial={{ y: 10, opacity: 0 }}
                                                animate={{ y: 0, opacity: 1 }}
                                                transition={{ delay: 0.2 }}
                                                className="text-sm text-slate-400 dark:text-slate-500"
                                            >
                                                Coba kata kunci lain atau
                                                gunakan topik berbeda
                                            </motion.p>
                                        </div>
                                    )}

                                {/* RESULTS */}
                                {(tab === 'all'
                                    ? dspace.slice(0, 3)
                                    : paginatedDspace
                                ).map((item: any, i: number) => {
                                    let hostname = 'repository.ibrahimy.ac.id';

                                    try {
                                        hostname = new URL(
                                            `https://repository.ibrahimy.ac.id/handle/${item.handle}`,
                                        ).hostname;
                                    } catch { }

                                    return (
                                        <a
                                            key={`d-${i}`}
                                            href={`https://repository.ibrahimy.ac.id/handle/${item.handle}`}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            className={`group mb-4 block rounded-2xl border border-slate-200/50 bg-white/60 p-6 backdrop-blur-sm transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:border-white/5 dark:bg-slate-900/60 ${currentTheme.cardHover}`}
                                        >
                                            {/* LABEL */}
                                            <div className="flex items-center justify-between">
                                                <span
                                                    className={`inline-block rounded-md px-2 py-1 text-xs font-semibold tracking-wider uppercase ${currentTheme.badge}`}
                                                >
                                                    IBRAHIMY REPOSITORY
                                                </span>

                                                {item.year && (
                                                    <span className="text-xs text-slate-400">
                                                        {item.year}
                                                    </span>
                                                )}
                                            </div>

                                            {/* TITLE */}
                                            <h2
                                                className="mt-1 text-lg font-semibold text-slate-900 group-hover:underline dark:text-slate-100"
                                                dangerouslySetInnerHTML={{
                                                    __html: highlight(
                                                        item.name ||
                                                        'Tanpa Judul',
                                                        query,
                                                        currentTheme.text,
                                                    ),
                                                }}
                                            />

                                            {/* AUTHOR */}
                                            <div className="mt-3 flex flex-wrap gap-2">
                                                <span className="rounded-md bg-slate-200 px-2 py-1 text-xs text-gray-700 dark:bg-slate-900/60 dark:text-gray-200">
                                                    {item.author ||
                                                        'Unknown Author'}
                                                </span>
                                            </div>

                                            {/* ABSTRACT */}
                                            {item.abstract && (
                                                <p
                                                    className="mt-3 line-clamp-2 text-sm text-slate-600 dark:text-slate-300"
                                                    dangerouslySetInnerHTML={{
                                                        __html: highlight(
                                                            item.abstract,
                                                            query,
                                                            currentTheme.text,
                                                        ),
                                                    }}
                                                />
                                            )}

                                            {/* HOST */}
                                            <p className="mt-3 truncate text-xs text-slate-400">
                                                {hostname}
                                            </p>
                                        </a>
                                    );
                                })}

                                {/* ================= PAGINATION ================= */}
                                {tab === 'dspace' && (
                                    <Pagination
                                        currentPage={pageDspace}
                                        totalItems={dspace.length}
                                        perPage={perPage}
                                        onPageChange={setPageDspace}
                                        currentTheme={currentTheme}
                                    />
                                )}
                            </>
                        ))}

                    {/* ================= GLOBAL EMPTY STATE (ALL TAB ONLY) ================= */}
                    {tab === 'all' &&
                        !loadingWiki &&
                        !loadingBooks &&
                        !loadingJournals &&
                        !loadingArticles &&
                        wiki.length === 0 &&
                        books.length === 0 &&
                        journals.length === 0 &&
                        articles.length === 0 &&
                        ibrahimyResults.length === 0 && (
                            <div className="flex flex-col items-center justify-center py-24 text-center">
                                <motion.div
                                    initial={{ scale: 0.6, opacity: 0 }}
                                    animate={{ scale: 1, opacity: 1 }}
                                    transition={{ duration: 0.4 }}
                                    className="text-slate-400 dark:text-slate-500"
                                >
                                    <SearchX size={64} />
                                </motion.div>

                                <motion.p
                                    initial={{ y: 10, opacity: 0 }}
                                    animate={{ y: 0, opacity: 1 }}
                                    transition={{ delay: 0.1 }}
                                    className="mt-5 text-xl font-semibold text-slate-600 dark:text-slate-300"
                                >
                                    Tidak ada hasil pencarian
                                </motion.p>

                                <motion.p
                                    initial={{ y: 10, opacity: 0 }}
                                    animate={{ y: 0, opacity: 1 }}
                                    transition={{ delay: 0.2 }}
                                    className="text-sm text-slate-400 dark:text-slate-500"
                                >
                                    Coba gunakan kata kunci yang lebih umum atau
                                    berbeda
                                </motion.p>

                                <motion.div
                                    initial={{ opacity: 0 }}
                                    animate={{ opacity: 1 }}
                                    transition={{ delay: 0.3 }}
                                    className="mt-4 text-xs text-slate-400 dark:text-slate-600"
                                >
                                    Contoh: "AI", "hadits", "ekonomi islam",
                                    "database"
                                </motion.div>
                            </div>
                        )}
                </div>
                <Footer tc={currentTheme} />

            </div>
        </>
    );
}
