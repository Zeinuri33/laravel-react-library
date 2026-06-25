'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import { toast } from 'sonner';
import { Head, Link, router } from '@inertiajs/react';
import { Document, Page, pdfjs } from 'react-pdf';
import { motion, AnimatePresence } from 'framer-motion';
import { ChevronLeft, ChevronRight, BookOpen, Clock, Eye, Minus, Plus, Columns2, Maximize2, Minimize2 } from 'lucide-react';

// Set worker
pdfjs.GlobalWorkerOptions.workerSrc = `//unpkg.com/pdfjs-dist@${pdfjs.version}/build/pdf.worker.min.mjs`;

import 'react-pdf/dist/Page/TextLayer.css';
import 'react-pdf/dist/Page/AnnotationLayer.css';

type EbookData = {
    id: number;
    judul: string;
    penulis: string | null;
    penerbit: string | null;
    tahun_terbit: number | null;
    deskripsi: string | null;
    cover: string | null;
    file: string | null;
    klasifikasi: { id: number; kategori: string } | null;
    total_dibaca: number;
    total_menit_baca: number;
};

export default function BacaEbook({ ebook }: { ebook: EbookData }) {
    const [numPages, setNumPages] = useState<number>(0);
    const [pageNumber, setPageNumber] = useState(1);
    const [scale, setScale] = useState(1.0);
    const [loading, setLoading] = useState(true);
    const [direction, setDirection] = useState(1);
    const [viewMode, setViewMode] = useState<'single' | 'double'>('single');
    const [isFullscreen, setIsFullscreen] = useState(false);
    const [showNavbars, setShowNavbars] = useState(true);
    const [locationChecking, setLocationChecking] = useState(false);
    const hideNavbarsTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
    const [sessionId, setSessionId] = useState<string | null>(null);
    const [sessionDuration, setSessionDuration] = useState(0);
    const sessionIdRef = useRef<string | null>(null);
    const pageNumberRef = useRef(pageNumber);
    const numPagesRef = useRef(numPages);
    const heartbeatRef = useRef<ReturnType<typeof setInterval> | null>(null);
    const pageInputRef = useRef<HTMLInputElement>(null);
    const swipeStartRef = useRef<{ x: number; y: number } | null>(null);
    const viewerRef = useRef<HTMLDivElement>(null);
    const pageDimensionsRef = useRef<{ width: number; height: number } | null>(null);
    const containerRef = useRef<HTMLDivElement>(null);

    // Verify location on mount
    useEffect(() => {
        const verifyLocationOnMount = async () => {
            const urlParams = new URLSearchParams(window.location.search);
            const lat = urlParams.get('lat');
            const lng = urlParams.get('lng');

            if (lat && lng) {
                // Location already verified by titikbaca page and backend baca method
                setLocationChecking(false);
                return;
            }

            // No location data — try to get it now
            if (!navigator.geolocation) {
                toast.error('Browser Anda tidak mendukung geolokasi');
                router.visit('/titikbaca');
                return;
            }

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

                if (data.allowed) {
                    setLocationChecking(false);
                } else {
                    toast.error(data.message, { duration: 6000 });
                    router.visit('/titikbaca');
                }
            } catch (error: any) {
                if (error.code === 1) {
                    toast.error('Izinkan akses lokasi untuk membaca e-book', { duration: 5000 });
                } else {
                    toast.error('Gagal memverifikasi lokasi', { duration: 5000 });
                }
                router.visit('/titikbaca');
            } finally {
                setLocationChecking(false);
            }
        };

        verifyLocationOnMount();
    }, []);

    // Keep refs in sync
    useEffect(() => { sessionIdRef.current = sessionId; }, [sessionId]);
    useEffect(() => { pageNumberRef.current = pageNumber; }, [pageNumber]);
    useEffect(() => { numPagesRef.current = numPages; }, [numPages]);

    // Start reading session
    useEffect(() => {
        if (!ebook.file) return;

        const startSession = async () => {
            try {
                const res = await fetch('/titikbaca/start-session', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]')?.getAttribute('content') || '' },
                    body: JSON.stringify({ ebook_id: ebook.id }),
                });
                const data = await res.json();
                sessionIdRef.current = data.session_id;
                setSessionId(data.session_id);
            } catch (e) {
                console.error('Failed to start session:', e);
            }
        };

        startSession();

        return () => {
            const sid = sessionIdRef.current;
            if (sid) {
                navigator.sendBeacon(
                    '/titikbaca/end-session',
                    JSON.stringify({
                        session_id: sid,
                        current_page: pageNumberRef.current,
                        total_pages: numPagesRef.current,
                    })
                );
            }
        };
    }, [ebook.id]);

    // Heartbeat every 15 seconds
    const sendHeartbeat = useCallback(() => {
        if (!sessionId) return;

        fetch('/titikbaca/heartbeat', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]')?.getAttribute('content') || '' },
            body: JSON.stringify({
                session_id: sessionId,
                current_page: pageNumber,
                total_pages: numPages,
            }),
        })
            .then((res) => res.json())
            .then((data) => {
                if (data.session_duration_seconds) {
                    setSessionDuration(data.session_duration_seconds);
                }
            })
            .catch(console.error);
    }, [sessionId, pageNumber, numPages]);

    useEffect(() => {
        if (!sessionId) return;

        heartbeatRef.current = setInterval(sendHeartbeat, 15000);

        return () => {
            if (heartbeatRef.current) {
                clearInterval(heartbeatRef.current);
            }
        };
    }, [sessionId, sendHeartbeat]);

    // Send heartbeat on page change
    useEffect(() => {
        if (sessionId && pageNumber > 0) {
            sendHeartbeat();
        }
    }, [pageNumber, sessionId]);

    // Fullscreen management
    const toggleFullscreen = useCallback(async () => {
        try {
            if (!document.fullscreenElement) {
                await document.documentElement.requestFullscreen();
            } else {
                await document.exitFullscreen();
            }
        } catch (e) {
            console.error('Fullscreen error:', e);
        }
    }, []);

    useEffect(() => {
        const handleFSChange = () => {
            setIsFullscreen(!!document.fullscreenElement);
            setShowNavbars(true);
        };
        document.addEventListener('fullscreenchange', handleFSChange);
        return () => document.removeEventListener('fullscreenchange', handleFSChange);
    }, []);

    // Auto-hide navbars in fullscreen on mouse idle
    const resetHideTimer = useCallback(() => {
        if (isFullscreen) {
            setShowNavbars(true);
            if (hideNavbarsTimerRef.current) clearTimeout(hideNavbarsTimerRef.current);
            hideNavbarsTimerRef.current = setTimeout(() => {
                setShowNavbars(false);
            }, 2500);
        }
    }, [isFullscreen]);

    useEffect(() => {
        if (!isFullscreen) {
            setShowNavbars(true);
            if (hideNavbarsTimerRef.current) clearTimeout(hideNavbarsTimerRef.current);
            return;
        }
        resetHideTimer();
        window.addEventListener('mousemove', resetHideTimer);
        window.addEventListener('touchstart', resetHideTimer);
        window.addEventListener('keydown', resetHideTimer);
        return () => {
            window.removeEventListener('mousemove', resetHideTimer);
            window.removeEventListener('touchstart', resetHideTimer);
            window.removeEventListener('keydown', resetHideTimer);
            if (hideNavbarsTimerRef.current) clearTimeout(hideNavbarsTimerRef.current);
        };
    }, [isFullscreen, resetHideTimer]);

    // Keyboard shortcuts (using ref to avoid re-attaching listener on every render)
    const keyHandlerRef = useRef<(e: KeyboardEvent) => void>(() => {});
    keyHandlerRef.current = (e: KeyboardEvent) => {
        if (e.target instanceof HTMLInputElement || e.target instanceof HTMLTextAreaElement) return;

        switch (e.key) {
            case 'ArrowRight':
                e.preventDefault();
                goToNextPage();
                break;
            case 'ArrowLeft':
                e.preventDefault();
                goToPrevPage();
                break;
            case 'Escape':
                if (isFullscreen) {
                    toggleFullscreen();
                }
                break;
        }
    };

    useEffect(() => {
        const handler = (e: KeyboardEvent) => keyHandlerRef.current(e);
        window.addEventListener('keydown', handler);
        return () => window.removeEventListener('keydown', handler);
    }, []);

    const calculateFitScale = useCallback(() => {
        const dims = pageDimensionsRef.current;
        if (!dims || !containerRef.current) return;

        const containerRect = containerRef.current.getBoundingClientRect();
        const availableWidth = containerRect.width - (isFullscreen ? 0 : 32);
        const availableHeight = containerRect.height - (isFullscreen ? 0 : 48);

        if (availableWidth <= 0 || availableHeight <= 0) return;

        let widthScale: number;
        if (viewMode === 'double') {
            widthScale = availableWidth / (dims.width * 2 + 16);
        } else {
            widthScale = availableWidth / dims.width;
        }
        const heightScale = availableHeight / dims.height;

        const optimalScale = Math.min(widthScale, heightScale, 2.5);
        setScale(Math.max(0.5, Math.round(optimalScale * 10) / 10));
    }, [viewMode, isFullscreen]);

    const onDocumentLoadSuccess = async (pdf: { numPages: number; getPage: (n: number) => Promise<{ getViewport: (opts: { scale: number }) => { width: number; height: number } }> }) => {
        setNumPages(pdf.numPages);
        setLoading(false);

        try {
            const firstPage = await pdf.getPage(1);
            const viewport = firstPage.getViewport({ scale: 1 });
            pageDimensionsRef.current = { width: viewport.width, height: viewport.height };

            // Calculate initial fit scale after a short delay to allow layout to settle
            requestAnimationFrame(() => {
                calculateFitScale();
            });
        } catch (e) {
            console.error('Error getting page dimensions:', e);
        }
    };

    // Recalculate scale when viewMode or fullscreen changes
    useEffect(() => {
        if (pageDimensionsRef.current) {
            calculateFitScale();
        }
    }, [viewMode, isFullscreen, calculateFitScale]);

    const getSpreadPages = (pageNum: number, totalPages: number) => {
        if (pageNum === 1) return { left: null, right: 1 };
        const left = pageNum % 2 === 0 ? pageNum : pageNum - 1;
        const right = Math.min(left + 1, totalPages);
        return { left, right };
    };

    const goToPage = (page: number) => {
        const p = Math.max(1, Math.min(page, numPages));
        if (p !== pageNumber && numPages > 0) {
            setDirection(p > pageNumber ? 1 : -1);
        }
        setPageNumber(p);
    };

    const goToNextPage = () => {
        if (viewMode === 'double') {
            if (pageNumber === 1) goToPage(2);
            else goToPage(Math.min(pageNumber + 2, numPages));
        } else {
            goToPage(pageNumber + 1);
        }
    };

    const goToPrevPage = () => {
        if (viewMode === 'double') {
            goToPage(pageNumber <= 2 ? 1 : pageNumber - 2);
        } else {
            goToPage(pageNumber - 1);
        }
    };

    const canGoNext = () => {
        if (viewMode === 'double') {
            if (pageNumber === 1) return numPages > 1;
            return pageNumber + 1 < numPages;
        }
        return pageNumber < numPages;
    };

    const canGoPrev = () => {
        if (viewMode === 'double') {
            return pageNumber > 1;
        }
        return pageNumber > 1;
    };

    const handlePageInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const val = parseInt(e.target.value, 10);
        if (!isNaN(val) && val >= 1 && val <= numPages) {
            if (viewMode === 'double') {
                const spreadStart = val === 1 ? 1 : (val % 2 === 0 ? val : val - 1);
                goToPage(spreadStart);
            } else {
                goToPage(val);
            }
        }
    };

    const handlePageInput = (e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.key === 'Enter') {
            const val = parseInt(e.currentTarget.value, 10);
            if (!isNaN(val)) goToPage(val);
        }
    };

    const formatDuration = (seconds: number) => {
        if (seconds < 60) return `${seconds} detik`;
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${mins} menit ${secs} detik`;
    };

    const formatTotalMenit = (menit: number) => {
        if (menit < 60) return `${menit} menit`;
        const jam = Math.floor(menit / 60);
        const sisa = menit % 60;
        return sisa > 0 ? `${jam} jam ${sisa} menit` : `${jam} jam`;
    };

    if (!ebook.file) {
        return (
            <div className="flex min-h-screen items-center justify-center bg-slate-50 dark:bg-slate-950">
                <div className="text-center">
                    <BookOpen className="mx-auto h-16 w-16 text-gray-300" />
                    <h2 className="mt-4 text-xl font-semibold text-gray-600 dark:text-gray-400">
                        File e-book tidak tersedia
                    </h2>
                    <Link
                        href="/titikbaca"
                        className="mt-4 inline-block text-sm text-emerald-500 hover:underline"
                    >
                        Kembali ke daftar
                    </Link>
                </div>
            </div>
        );
    }

    return (
        <>
            <Head title={`Baca: ${ebook.judul}`} />

            <div className={`min-h-screen flex flex-col transition-colors duration-300 ${
                    isFullscreen ? 'bg-gray-950 dark:bg-black' : 'bg-gray-100 dark:bg-gray-950'
                }`}>
                {/* TOP NAVBAR */}
                <div
                    className={`fixed left-0 right-0 top-0 z-50 flex items-center justify-between border-b border-gray-200 bg-white/90 px-4 py-2 backdrop-blur-md transition-all duration-300 dark:border-gray-800 dark:bg-gray-900/90 ${
                        isFullscreen
                            ? `${showNavbars ? 'translate-y-0 opacity-100' : '-translate-y-full opacity-0'}`
                            : ''
                    }`}
                >
                    {/* LEFT: Back + Title */}
                    <div className="flex items-center gap-3 min-w-0">
                        <Link
                            href="/titikbaca"
                            className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg text-gray-500 transition-colors hover:bg-gray-100 hover:text-gray-700 dark:hover:bg-gray-800"
                        >
                            <ChevronLeft className="h-5 w-5" />
                        </Link>

                        <div className="min-w-0">
                            <h1 className="truncate text-sm font-semibold text-gray-900 dark:text-white">
                                {ebook.judul}
                            </h1>
                            <p className="truncate text-xs text-gray-500">
                                {ebook.penulis || 'Tanpa penulis'}
                            </p>
                        </div>
                    </div>

                    {/* RIGHT: Stats + Zoom */}
                    <div className="flex items-center gap-3">
                        {/* Reading stats */}
                        <div className="hidden items-center gap-3 text-xs text-gray-500 md:flex">
                            <span className="flex items-center gap-1">
                                <Eye className="h-3.5 w-3.5" />
                                {ebook.total_dibaca}x dibaca
                            </span>
                            <span className="flex items-center gap-1">
                                <Clock className="h-3.5 w-3.5" />
                                {formatTotalMenit(ebook.total_menit_baca)}
                            </span>
                            {sessionDuration > 0 && (
                                <span className="flex items-center gap-1 text-emerald-600 dark:text-emerald-400">
                                    <BookOpen className="h-3.5 w-3.5" />
                                    {formatDuration(sessionDuration)}
                                </span>
                            )}
                        </div>

                        {/* View mode toggle */}
                        <div className="flex items-center gap-1 mr-2 border-r border-gray-200 pr-2 dark:border-gray-700">
                            <button
                                onClick={() => setViewMode('single')}
                                className={`flex h-7 w-7 items-center justify-center rounded-md transition-colors ${
                                    viewMode === 'single'
                                        ? 'bg-emerald-100 text-emerald-600 dark:bg-emerald-900/40 dark:text-emerald-400'
                                        : 'text-gray-500 hover:bg-gray-100 dark:hover:bg-gray-800'
                                }`}
                                title="Tampilan 1 halaman"
                            >
                                <BookOpen className="h-3.5 w-3.5" />
                            </button>
                            <button
                                onClick={() => setViewMode('double')}
                                className={`flex h-7 w-7 items-center justify-center rounded-md transition-colors ${
                                    viewMode === 'double'
                                        ? 'bg-emerald-100 text-emerald-600 dark:bg-emerald-900/40 dark:text-emerald-400'
                                        : 'text-gray-500 hover:bg-gray-100 dark:hover:bg-gray-800'
                                }`}
                                title="Tampilan 2 halaman (bersebalahan)"
                            >
                                <Columns2 className="h-3.5 w-3.5" />
                            </button>
                        </div>

                        {/* Zoom controls */}
                        <div className="flex items-center gap-1">
                            <button
                                onClick={() => setScale((s) => Math.max(0.5, s - 0.1))}
                                className="flex h-7 w-7 items-center justify-center rounded-md text-gray-500 transition-colors hover:bg-gray-100 dark:hover:bg-gray-800"
                            >
                                <Minus className="h-3.5 w-3.5" />
                            </button>
                            <span className="w-10 text-center text-xs font-medium text-gray-600 dark:text-gray-400">
                                {Math.round(scale * 100)}%
                            </span>
                            <button
                                onClick={() => setScale((s) => Math.min(2.0, s + 0.1))}
                                className="flex h-7 w-7 items-center justify-center rounded-md text-gray-500 transition-colors hover:bg-gray-100 dark:hover:bg-gray-800"
                            >
                                <Plus className="h-3.5 w-3.5" />
                            </button>
                        </div>

                        {/* Fullscreen toggle */}
                        <button
                            onClick={toggleFullscreen}
                            className="flex h-7 w-7 items-center justify-center rounded-md text-gray-500 transition-colors hover:bg-gray-100 dark:hover:bg-gray-800"
                            title={isFullscreen ? 'Keluar fullscreen' : 'Fullscreen'}
                        >
                            {isFullscreen ? (
                                <Minimize2 className="h-3.5 w-3.5" />
                            ) : (
                                <Maximize2 className="h-3.5 w-3.5" />
                            )}
                        </button>
                    </div>
                </div>

                {/* Spacer for fixed top navbar */}
                <div className={`${isFullscreen ? 'hidden' : 'h-12'}`} />

                {/* MAIN CONTENT WRAPPER: fills remaining space to push footer down */}
                <div ref={containerRef} className="flex flex-col flex-1">

                {/* BOTTOM NAVBAR: Page Navigation */}
                <div
                    className={`z-50 flex items-center justify-center gap-3 border-b border-gray-200 bg-white/80 px-4 py-2 backdrop-blur-md transition-all duration-300 dark:border-gray-800 dark:bg-gray-900/80 ${
                        isFullscreen
                            ? `fixed left-0 right-0 bottom-0 border-t border-b-0 ${
                                  showNavbars ? 'translate-y-0 opacity-100' : 'translate-y-full opacity-0'
                              }`
                            : 'sticky top-0'
                    }`}
                >
                    <button
                        onClick={goToPrevPage}
                        disabled={!canGoPrev()}
                        className="flex h-8 w-8 items-center justify-center rounded-lg text-gray-500 transition-colors hover:bg-gray-100 disabled:opacity-30 dark:hover:bg-gray-800"
                    >
                        <ChevronLeft className="h-4 w-4" />
                    </button>

                    <div className="flex items-center gap-1 text-sm">
                        <input
                            ref={pageInputRef}
                            type="number"
                            min={1}
                            max={numPages}
                            onKeyDown={handlePageInput}
                            onChange={handlePageInputChange}
                            value={pageNumber}
                            className="h-8 w-12 rounded-md border border-gray-200 bg-white text-center text-sm font-medium text-gray-900 focus:border-emerald-500 focus:outline-none focus:ring-1 focus:ring-emerald-500 dark:border-gray-700 dark:bg-gray-800 dark:text-white"
                        />
                        <span className="text-gray-500">/ {numPages}</span>
                    </div>

                    <button
                        onClick={goToNextPage}
                        disabled={!canGoNext()}
                        className="flex h-8 w-8 items-center justify-center rounded-lg text-gray-500 transition-colors hover:bg-gray-100 disabled:opacity-30 dark:hover:bg-gray-800"
                    >
                        <ChevronRight className="h-4 w-4" />
                    </button>

                    {/* Mobile stats */}
                    <div className="flex items-center gap-2 text-xs text-gray-500 md:hidden">
                        <span className="flex items-center gap-1">
                            <Eye className="h-3 w-3" />
                            {ebook.total_dibaca}
                        </span>
                        {sessionDuration > 0 && (
                            <span className="flex items-center gap-1 text-emerald-600 dark:text-emerald-400">
                                <Clock className="h-3 w-3" />
                                {Math.floor(sessionDuration / 60)}m
                            </span>
                        )}
                    </div>
                </div>

                {/* PDF VIEWER with swipe detection + page transition */}
                <div className={`mx-auto flex justify-center select-none flex-1 w-full ${
                    isFullscreen
                        ? 'min-h-screen items-center py-0 px-0'
                        : 'py-6 px-4'
                }`}>
                    {loading && (
                        <div className="flex items-center justify-center py-32">
                            <div className="h-8 w-8 animate-spin rounded-full border-4 border-emerald-500 border-t-transparent" />
                        </div>
                    )}

                    <div
                        ref={viewerRef}
                        onMouseDown={(e) => {
                            swipeStartRef.current = { x: e.clientX, y: e.clientY };
                        }}
                        onMouseUp={(e) => {
                            if (!swipeStartRef.current) return;
                            const dx = e.clientX - swipeStartRef.current.x;
                            const dy = e.clientY - swipeStartRef.current.y;
                            swipeStartRef.current = null;

                            if (Math.abs(dx) > Math.abs(dy) && Math.abs(dx) > 50) {
                                if (dx > 0) goToPrevPage();
                                else goToNextPage();
                            }
                        }}
                        onTouchStart={(e) => {
                            const touch = e.touches[0];
                            swipeStartRef.current = { x: touch.clientX, y: touch.clientY };
                        }}
                        onTouchEnd={(e) => {
                            if (!swipeStartRef.current) return;
                            const touch = e.changedTouches[0];
                            const dx = touch.clientX - swipeStartRef.current.x;
                            const dy = touch.clientY - swipeStartRef.current.y;
                            swipeStartRef.current = null;

                            if (Math.abs(dx) > Math.abs(dy) && Math.abs(dx) > 50) {
                                if (dx > 0) goToPrevPage();
                                else goToNextPage();
                            }
                        }}
                        className="w-full"
                    >
                        <Document
                            file={ebook.file}
                            onLoadSuccess={onDocumentLoadSuccess}
                            onLoadError={(error) => {
                                console.error('PDF load error:', error);
                                setLoading(false);
                            }}
                            className="flex flex-col items-center"
                            loading={
                                <div className="flex items-center justify-center py-32">
                                    <div className="h-8 w-8 animate-spin rounded-full border-4 border-emerald-500 border-t-transparent" />
                                </div>
                            }
                        >
                            {viewMode === 'double' ? (
                                <div
                                    style={{
                                        perspective: '1200px',
                                    }}
                                >
                                    <AnimatePresence mode="wait" custom={direction}>
                                        <motion.div
                                            key={`spread-${pageNumber}`}
                                            exit={{ opacity: 0 }}
                                            transition={{ duration: 0.4 }}
                                            className="flex items-start justify-center gap-4"
                                        >
                                            {(() => {
                                                const { left, right } = getSpreadPages(pageNumber, numPages);
                                                const commonTransition = {
                                                    duration: 0.4,
                                                    ease: [0.22, 1, 0.36, 1],
                                                };
                                                return (
                                                    <>
                                                        {left ? (
                                                            <motion.div
                                                                key={`page-left-${left}`}
                                                                custom={direction}
                                                                variants={{
                                                                    enter: {
                                                                        rotateY: 0,
                                                                        opacity: 0,
                                                                        scale: 0.97,
                                                                    },
                                                                    center: {
                                                                        rotateY: 0,
                                                                        opacity: 1,
                                                                        scale: 1,
                                                                    },
                                                                    exit: (dir: number) => ({
                                                                        rotateY: dir > 0 ? 0 : 75,
                                                                        opacity: 0,
                                                                        scale: 0.97,
                                                                    }),
                                                                }}
                                                                initial="enter"
                                                                animate="center"
                                                                exit="exit"
                                                                transition={commonTransition}
                                                                style={{
                                                                    transformOrigin: 'right',
                                                                    transformStyle: 'preserve-3d',
                                                                    backfaceVisibility: 'hidden',
                                                                    position: 'relative',
                                                                }}
                                                            >
                                                                <div
                                                                    className="pointer-events-none absolute inset-0 z-10 rounded-lg"
                                                                    style={{
                                                                        background: `linear-gradient(to left, rgba(0,0,0,0.12) 0%, transparent 40%)`,
                                                                    }}
                                                                />
                                                                <Page
                                                                    pageNumber={left}
                                                                    scale={scale}
                                                                    renderTextLayer={true}
                                                                    renderAnnotationLayer={true}
                                                                    className="rounded-lg shadow-xl"
                                                                    loading={
                                                                        <div className="flex h-[500px] w-[350px] items-center justify-center">
                                                                            <div className="h-8 w-8 animate-spin rounded-full border-4 border-emerald-500 border-t-transparent" />
                                                                        </div>
                                                                    }
                                                                />
                                                            </motion.div>
                                                        ) : (
                                                            <div className="hidden w-[350px] md:block" />
                                                        )}
                                                        <motion.div
                                                            key={`page-right-${right}`}
                                                            custom={direction}
                                                            variants={{
                                                                enter: {
                                                                    rotateY: 0,
                                                                    opacity: 0,
                                                                    scale: 0.97,
                                                                },
                                                                center: {
                                                                    rotateY: 0,
                                                                    opacity: 1,
                                                                    scale: 1,
                                                                },
                                                                exit: (dir: number) => ({
                                                                    rotateY: dir > 0 ? -75 : 0,
                                                                    opacity: 0,
                                                                    scale: 0.97,
                                                                }),
                                                            }}
                                                            initial="enter"
                                                            animate="center"
                                                            exit="exit"
                                                            transition={commonTransition}
                                                            style={{
                                                                transformOrigin: 'left',
                                                                transformStyle: 'preserve-3d',
                                                                backfaceVisibility: 'hidden',
                                                                position: 'relative',
                                                            }}
                                                        >
                                                            <div
                                                                className="pointer-events-none absolute inset-0 z-10 rounded-lg"
                                                                style={{
                                                                    background: `linear-gradient(to right, rgba(0,0,0,0.12) 0%, transparent 40%)`,
                                                                }}
                                                            />
                                                            <Page
                                                                pageNumber={right}
                                                                scale={scale}
                                                                renderTextLayer={true}
                                                                renderAnnotationLayer={true}
                                                                className="rounded-lg shadow-xl"
                                                                loading={
                                                                    <div className="flex h-[500px] w-[350px] items-center justify-center">
                                                                        <div className="h-8 w-8 animate-spin rounded-full border-4 border-emerald-500 border-t-transparent" />
                                                                    </div>
                                                                }
                                                            />
                                                        </motion.div>
                                                    </>
                                                );
                                            })()}
                                        </motion.div>
                                    </AnimatePresence>
                                </div>
                            ) : (
                                <div
                                    style={{
                                        perspective: '1200px',
                                    }}
                                >
                                    <AnimatePresence mode="wait" custom={direction}>
                                        <motion.div
                                            key={pageNumber}
                                            custom={direction}
                                            variants={{
                                                enter: (dir: number) => ({
                                                    rotateY: dir > 0 ? 75 : -75,
                                                    opacity: 0,
                                                    scale: 0.97,
                                                }),
                                                center: {
                                                    rotateY: 0,
                                                    opacity: 1,
                                                    scale: 1,
                                                },
                                                exit: (dir: number) => ({
                                                    rotateY: dir > 0 ? -75 : 75,
                                                    opacity: 0,
                                                    scale: 0.97,
                                                }),
                                            }}
                                            initial="enter"
                                            animate="center"
                                            exit="exit"
                                            transition={{
                                                duration: 0.4,
                                                ease: [0.22, 1, 0.36, 1],
                                            }}
                                            style={{
                                                transformOrigin: direction > 0 ? 'left' : 'right',
                                                transformStyle: 'preserve-3d',
                                                backfaceVisibility: 'hidden',
                                                position: 'relative',
                                            }}
                                        >
                                            {/* Shadow gradient for depth */}
                                            <div
                                                className="pointer-events-none absolute inset-0 z-10 rounded-lg"
                                                style={{
                                                    background: `linear-gradient(
                                                        to ${direction > 0 ? 'right' : 'left'},
                                                        rgba(0,0,0,0.12) 0%,
                                                        transparent 40%
                                                    )`,
                                                }}
                                            />

                                            <Page
                                                pageNumber={pageNumber}
                                                scale={scale}
                                                renderTextLayer={true}
                                                renderAnnotationLayer={true}
                                                className="rounded-lg shadow-xl"
                                                loading={
                                                    <div className="flex h-[500px] w-full items-center justify-center">
                                                        <div className="h-8 w-8 animate-spin rounded-full border-4 border-emerald-500 border-t-transparent" />
                                                    </div>
                                                }
                                            />
                                        </motion.div>
                                    </AnimatePresence>
                                </div>
                            )}
                        </Document>
                    </div>
                </div>

                </div>{/* END MAIN CONTENT WRAPPER */}

                {/* FOOTER */}
                <div className={`border-t border-gray-200 bg-white/50 py-4 text-center text-xs text-gray-400 transition-opacity duration-300 dark:border-gray-800 dark:bg-gray-900/50 ${
                    isFullscreen ? 'hidden' : ''
                }`}>
                    <p>E-book hanya bisa dibaca secara online. Mohon tidak menyebarkan konten tanpa izin.</p>
                </div>
            </div>

            {/* LOCATION CHECK OVERLAY — shown on top while verifying */}
            {locationChecking && (
                <div className="fixed inset-0 z-[100] flex items-center justify-center bg-white/80 backdrop-blur-sm dark:bg-slate-950/80">
                    <div className="text-center">
                        <div className="mx-auto h-10 w-10 animate-spin rounded-full border-4 border-emerald-500 border-t-transparent" />
                        <p className="mt-4 text-sm text-gray-500 dark:text-gray-400">
                            Memeriksa lokasi titik baca...
                        </p>
                    </div>
                </div>
            )}
        </>
    );
}
