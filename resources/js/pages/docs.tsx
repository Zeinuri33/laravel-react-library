import { Head, Link, usePage } from "@inertiajs/react"
import { useEffect, useMemo, useRef, useState } from "react"
import DocsSearch from "@/components/ui/docs-search"
import AppearanceTabs from '@/components/appearance-tabs';
import { useTheme } from '@/context/ThemeContext'; // Import context global tema
import Footer from '@/layouts/footer';
import { motion } from "framer-motion"



import {
    Menu,
    Moon,
    Search,
    Sun,
    X,
    LogOut
} from "lucide-react"

interface Dokumentasi {
    id: number
    judul: string
    slug: string
    konten: string

    kategori: {
        id: number
        kategori: string
    }
}

interface Props {
    dokumentasi?: Dokumentasi[]
    activeDoc?: Dokumentasi | null
}

interface TocItem {
    id: string
    text: string
    level: string
}

export default function DocsPage() {

    const page = usePage()

    const dokumentasi =
        (page.props.dokumentasi as Dokumentasi[]) || []

    const [mobileOpen, setMobileOpen] = useState(false)

    // Mengambil state dan fungsi pengubah dari Context global
    const { themeAccent, setThemeAccent } = useTheme();

    type ThemeAccent = "emerald" | "red" | "indigo"


    const themeStyles: Record<ThemeAccent, any> = {
        emerald: {
            text: 'text-emerald-500',
            footerBg: 'bg-white dark:bg-[#020817]',
            footerBorder: 'border-emerald-500/10',
            textGradient: 'from-emerald-500 to-emerald-300',
            socialBorder: 'border-emerald-500/20',
            bgSoft: 'bg-emerald-500/5',
            socialHover: 'hover:bg-emerald-500/10',
            linkHover: 'hover:text-emerald-500',
            textPrimary: 'text-emerald-500',
        },

        red: {
            text: 'text-red-500',
            footerBg: 'bg-white dark:bg-[#020817]',
            footerBorder: 'border-red-500/10',
            textGradient: 'from-red-500 to-red-300',
            socialBorder: 'border-red-500/20',
            bgSoft: 'bg-red-500/5',
            socialHover: 'hover:bg-red-500/10',
            linkHover: 'hover:text-red-500',
            textPrimary: 'text-red-500',
        },

        indigo: {
            text: 'text-indigo-500',
            footerBg: 'bg-white dark:bg-[#020817]',
            footerBorder: 'border-indigo-500/10',
            textGradient: 'from-indigo-500 to-indigo-300',
            socialBorder: 'border-indigo-500/20',
            bgSoft: 'bg-indigo-500/5',
            socialHover: 'hover:bg-indigo-500/10',
            linkHover: 'hover:text-indigo-500',
            textPrimary: 'text-indigo-500',
        },
    }


    const tc = themeStyles[themeAccent as ThemeAccent]

    const groupedDocs = useMemo(() => {

        const sortedDocs = [...dokumentasi].sort(
            (a, b) => a.id - b.id
        )

        const grouped = sortedDocs.reduce(
            (
                acc: Record<string, Dokumentasi[]>,
                item
            ) => {

                const kategori =
                    item.kategori?.kategori || "Lainnya"

                if (!acc[kategori]) {
                    acc[kategori] = []
                }

                acc[kategori].push(item)

                return acc
            },
            {}
        )

        // SORT KATEGORI BERDASARKAN ID KATEGORI
        const sortedGroupedEntries = Object.entries(grouped).sort(
            ([, docsA], [, docsB]) => {

                const kategoriA =
                    docsA[0]?.kategori?.id || 0

                const kategoriB =
                    docsB[0]?.kategori?.id || 0

                return kategoriA - kategoriB
            }
        )

        return Object.fromEntries(sortedGroupedEntries)

    }, [dokumentasi])

    const activeDoc =
        (page.props.activeDoc as Dokumentasi) || null

    const articleRef = useRef<HTMLElement | null>(null)

    const [toc, setToc] = useState<TocItem[]>([])

    const [activeHeading, setActiveHeading] = useState("")

    // Mengatur table of contents (TOC)
    // + active heading observer
    useEffect(() => {

        if (!articleRef.current || !activeDoc) return

        const headings =
            articleRef.current.querySelectorAll(
                "h1, h2, h3"
            )

        const items: TocItem[] = []

        headings.forEach((heading, index) => {

            const text =
                heading.textContent?.trim() || ""

            const id =
                text
                    .toLowerCase()
                    .replace(/\s+/g, "-")
                    .replace(/[^\w-]/g, "") +
                "-" +
                index

            heading.setAttribute("id", id)

            items.push({
                id,
                text,
                level: heading.tagName.toLowerCase(),
            })
        })

        setToc(items)

        // =========================
        // ACTIVE HEADING OBSERVER
        // =========================

        const observer = new IntersectionObserver(
            (entries) => {

                const visibleHeadings =
                    entries.filter(
                        (entry) => entry.isIntersecting
                    )

                if (visibleHeadings.length === 0) return

                const currentHeading =
                    visibleHeadings.sort(
                        (a, b) =>
                            a.boundingClientRect.top -
                            b.boundingClientRect.top
                    )[0]

                setActiveHeading(
                    currentHeading.target.id
                )
            },
            {
                rootMargin: "-100px 0px -65% 0px",
                threshold: 0,
            }
        )

        headings.forEach((heading) => {
            observer.observe(heading)
        })

        return () => {
            observer.disconnect()
        }

    }, [activeDoc])

    const navLinkHoverClass =
        themeAccent === "emerald"
            ? "hover:text-emerald-500"
            : themeAccent === "indigo"
                ? "hover:text-indigo-500"
                : "hover:text-red-500"

    const navLinkClass =
        themeAccent === "emerald"
            ? "text-emerald-500 hover:text-emerald-400"
            : themeAccent === "indigo"
                ? "text-indigo-500 hover:text-indigo-400"
                : "text-red-500 hover:text-red-400"

    const focusRingClass =
        themeAccent === "emerald"
            ? "[&_input:focus]:ring-emerald-500 [&_input:focus]:border-emerald-500"
            : themeAccent === "indigo"
                ? "[&_input:focus]:ring-indigo-500 [&_input:focus]:border-indigo-500"
                : "[&_input:focus]:ring-red-500 [&_input:focus]:border-red-500"

    const brandClass =
        themeAccent === "emerald"
            ? "text-emerald-500"
            : themeAccent === "indigo"
                ? "text-indigo-500"
                : "text-red-500"

    const brandHoverClass =
        themeAccent === "emerald"
            ? "hover:text-emerald-400"
            : themeAccent === "indigo"
                ? "hover:text-indigo-400"
                : "hover:text-red-400"

    const menuButtonClass =
        themeAccent === "emerald"
            ? "hover:border-emerald-500/40 hover:bg-emerald-500/10"
            : themeAccent === "indigo"
                ? "hover:border-indigo-500/40 hover:bg-indigo-500/10"
                : "hover:border-red-500/40 hover:bg-red-500/10"
                

    return (
        <>
            <Head title="Dokumentasi Digilib" />

            <div className="min-h-screen bg-white text-gray-900 dark:bg-[#020817] dark:text-white">

                {/* BACKGROUND */}
                <div className="pointer-events-none fixed inset-0 overflow-hidden">
                    <div className={`absolute top-0 right-0 h-[500px] w-[500px] rounded-full blur-[150px] ${themeAccent === 'emerald' ? 'bg-emerald-500/10' :
                        themeAccent === 'indigo' ? 'bg-indigo-500/10' :
                            'bg-red-500/10'
                        }`}></div>
                </div>

                {/* HEADER */}
                <header className="sticky top-0 z-50 border-b border-gray-200/70 bg-white/80 backdrop-blur-xl dark:border-white/10 dark:bg-[#020817]/80">
                    <div className="mx-auto flex h-16 items-center justify-between px-4 lg:px-6">
                        <div className="flex items-center gap-3">
                            <button
                                onClick={() => setMobileOpen(true)}
                                className={`
                                    rounded-xl border border-gray-200
                                    bg-white p-2 shadow-sm
                                    transition-all duration-300

                                    dark:border-white/10
                                    dark:bg-white/5

                                    lg:hidden

                                    ${menuButtonClass}
                                `}
                            >
                                <Menu
                                    className={`
                                        h-5 w-5 transition-colors
                                        ${brandClass}
                                    `}
                                />
                            </button>

                            <Link
                                href="/docs"
                                className={`
                                    group flex items-center gap-3
                                    transition-all duration-300
                                `}
                            >
                                <div
                                    className="
                                        relative overflow-hidden rounded-2xl
                                        transition-transform duration-300
                                        group-hover:scale-105
                                    "
                                >
                                    <img
                                        src="/kubah.png"
                                        className="h-10 dark:hidden"
                                    />

                                    <img
                                        src="/kubah-putih.png"
                                        className="hidden h-10 dark:block"
                                    />
                                </div>

                                <div>
                                    <h1
                                        className={`
                                            text-sm font-bold
                                            transition-colors duration-300

                                            ${brandClass}
                                            ${brandHoverClass}
                                        `}
                                    >
                                        Digilib Ibrahimy
                                    </h1>

                                    <p
                                        className="
                                            text-xs text-gray-500
                                            transition-colors duration-300
                                            dark:text-gray-400

                                            group-hover:text-gray-700
                                            dark:group-hover:text-gray-300
                                        "
                                    >
                                        Documentation
                                    </p>
                                </div>
                            </Link>

                        </div>

                        {/* SEARCH */}
                        <div className="hidden w-full max-w-xl px-8 lg:block">
                            <DocsSearch dokumentasi={dokumentasi} />
                        </div>

                        {/* RIGHT MENU */}
                        <div className="flex items-center gap-3">
                            <nav className="hidden md:flex gap-6 text-sm font-medium me-2">
                                <a
                                    href="/#layanan"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    Layanan
                                </a>

                                <a
                                    href="/#FAQ"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    FAQ
                                </a>

                                <a
                                    href="/#kontak"
                                    className="relative inline-block after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:origin-left after:scale-x-0 after:bg-current after:transition-transform after:duration-300 after:ease-out hover:after:scale-x-100"
                                >
                                    Kontak
                                </a>
                            </nav>

                            {/* DIVIDER */}
                            <div className="hidden md:block h-7 w-px bg-gray-300 dark:bg-white/10" />

                            {/* THEME PICKER */}
                            <div className="hidden md:flex items-center gap-2">
                                <button
                                    onClick={() => setThemeAccent('emerald')}
                                    className={`h-4 w-4 rounded-full bg-emerald-500 transition-all ${themeAccent === 'emerald' ? 'ring-2 ring-emerald-500 ring-offset-2 ring-offset-white dark:ring-offset-slate-950' : 'hover:scale-110'
                                        }`}
                                    aria-label="Emerald Theme"
                                />

                                <button
                                    onClick={() => setThemeAccent('red')}
                                    className={`h-4 w-4 rounded-full bg-red-500 transition-all ${themeAccent === 'red' ? 'ring-2 ring-red-500 ring-offset-2 ring-offset-white dark:ring-offset-slate-950' : 'hover:scale-110'
                                        }`}
                                    aria-label="Red Theme"
                                />
                                <button
                                    onClick={() => setThemeAccent('indigo')}
                                    className={`h-4 w-4 rounded-full bg-indigo-500 transition-all ${themeAccent === 'indigo' ? 'ring-2 ring-indigo-500 ring-offset-2 ring-offset-white dark:ring-offset-slate-950' : 'hover:scale-110'
                                        }`}
                                    aria-label="Indigo Theme"
                                />
                            </div>

                            {/* THEME */}
                            <AppearanceTabs />
                            {/* EXIT */}
                            <Link
                                href="/"
                                className="
                                    flex items-center justify-center
                                    transition-opacity
                                    hover:opacity-70
                                "
                            >
                                <LogOut className="h-5 w-5 text-gray-700 dark:text-white" />
                            </Link>
                        </div>

                    </div>
                </header>

                <div className="relative mx-auto flex items-start">

                    {/* OVERLAY */}
                    {mobileOpen && (
                        <div
                            className="fixed inset-0 z-40 bg-black/50 backdrop-blur-sm lg:hidden"
                            onClick={() => {
                                setMobileOpen(false)

                                window.scrollTo({
                                    top: 0,
                                    behavior: "smooth",
                                })
                            }}
                        />
                    )}

                    {/* SIDEBAR */}
                    <aside
                        className={`
                            fixed inset-y-0 left-0 z-50 w-[280px]
                            transform border-r border-gray-200
                            bg-white transition-transform duration-300
                            dark:border-white/10 dark:bg-[#0b1120]

                            lg:sticky lg:top-16
                            lg:h-[calc(100vh-64px)]
                            lg:translate-x-0
                            lg:self-start

                            ${mobileOpen
                                ? "translate-x-0"
                                : "-translate-x-full"
                            }
                        `}
                    >

                        {/* MOBILE HEADER */}
                        <div className="flex h-16 items-center justify-between border-b border-gray-200 px-5 dark:border-white/10 lg:hidden">

                            <h2 className="text-sm font-semibold tracking-wide text-gray-900 dark:text-white">
                                Dokumentasi
                            </h2>

                            <button
                                onClick={() => {
                                    setMobileOpen(false)

                                    window.scrollTo({
                                        top: 0,
                                        behavior: "smooth",
                                    })
                                }}
                                className="
                                    rounded-md p-2 transition
                                    hover:bg-gray-100
                                    dark:hover:bg-white/5
                                "
                            >
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        {/* SIDEBAR CONTENT */}
                        <div
                            className="
                                docs-sidebar
                                h-full overflow-y-auto
                                px-6 py-8
                            "
                        >

                            <nav className="space-y-8">
                                {Object.entries(groupedDocs).map(
                                    ([kategori, docs]: any) => {

                                        return (
                                            <div key={kategori}>

                                                {/* CATEGORY */}
                                                <div
                                                    className={`
                                                        mb-3 text-xs font-semibold
                                                        uppercase tracking-[0.18em]

                                                        ${
                                                            themeAccent === "emerald"
                                                                ? "text-emerald-500"
                                                                : themeAccent === "indigo"
                                                                    ? "text-indigo-500"
                                                                    : "text-red-500"
                                                        }
                                                    `}
                                                >
                                                    {kategori}
                                                </div>

                                                {/* LINKS */}
                                                <div
                                                    className={`
                                                        relative ml-1 space-y-1
                                                        border-l pl-4

                                                        ${
                                                            themeAccent === "emerald"
                                                                ? "border-emerald-500/20"
                                                                : themeAccent === "indigo"
                                                                    ? "border-indigo-500/20"
                                                                    : "border-red-500/20"
                                                        }
                                                    `}
                                                >

                                                    {docs.map((doc: Dokumentasi) => {

                                                        const active =
                                                            activeDoc?.id === doc.id

                                                        return (
                                                            <Link
                                                                key={doc.id}
                                                                href={`/docs/${doc.slug}`}
                                                                onClick={() => {
                                                                    setMobileOpen(false)
                                                                }}
                                                                className={`
                                                                    group relative block
                                                                    py-1.5 text-sm transition-all duration-300

                                                                    ${
                                                                        active
                                                                            ? themeAccent === "emerald"
                                                                                ? "font-medium text-emerald-500"
                                                                                : themeAccent === "indigo"
                                                                                    ? "font-medium text-indigo-500"
                                                                                    : "font-medium text-red-500"
                                                                            : `
                                                                                text-gray-600
                                                                                dark:text-gray-400

                                                                                ${
                                                                                    themeAccent === "emerald"
                                                                                        ? "hover:text-emerald-500"
                                                                                        : themeAccent === "indigo"
                                                                                            ? "hover:text-indigo-500"
                                                                                            : "hover:text-red-500"
                                                                                }
                                                                            `
                                                                    }
                                                                `}
                                                            >

                                                                {/* ACTIVE BAR */}
                                                                {active && (
                                                                    <motion.span
                                                                        layoutId="active-doc-sidebar"
                                                                        transition={{
                                                                            type: "spring",
                                                                            stiffness: 380,
                                                                            damping: 30,
                                                                        }}
                                                                        className={`
                                                                            absolute -left-[17px]
                                                                            inset-y-0
                                                                            w-[3px]
                                                                            rounded-full

                                                                            ${
                                                                                themeAccent === "emerald"
                                                                                    ? "bg-emerald-500"
                                                                                    : themeAccent === "indigo"
                                                                                        ? "bg-indigo-500"
                                                                                        : "bg-red-500"
                                                                            }
                                                                        `}
                                                                    />
                                                                )}

                                                                <span className="line-clamp-2">
                                                                    {doc.judul}
                                                                </span>
                                                            </Link>
                                                        )
                                                    })}
                                                </div>
                                            </div>
                                        )
                                    }
                                )}
                            </nav>
                        </div>
                    </aside>

                    {/* CONTENT */}
                    <div className="min-w-0 flex-1">

                        <div className="flex min-h-[calc(100vh-64px)] flex-col">
                            <main className="flex-1 px-6 py-10 xl:px-12">
                                <div className="mx-auto max-w-4xl">
                                    {activeDoc ? (
                                        <>
                                            {/* TITLE */}
                                            <h1
                                                className={`
                                                    text-3xl font-bold tracking-tight md:text-4xl

                                                    ${
                                                        themeAccent === "emerald"
                                                            ? "text-emerald-500"
                                                            : themeAccent === "indigo"
                                                                ? "text-indigo-500"
                                                                : "text-red-500"
                                                    }
                                                `}
                                            >
                                                {activeDoc.judul}
                                            </h1>

                                            {/* CONTENT */}
                                            <article
                                                ref={articleRef}
                                                className={`
                                                    docs-content
                                                    prose
                                                    dark:prose-invert
                                                    max-w-none
                                                    mt-10

                                                    /* ========================= */
                                                    /* HEADINGS */
                                                    /* ========================= */

                                                    prose-headings:scroll-mt-28
                                                    prose-headings:tracking-tight

                                                    [&_h1]:!text-3xl
                                                    md:[&_h1]:!text-3xl
                                                    [&_h1]:!font-semibold
                                                    [&_h1]:leading-tight

                                                    ${
                                                        themeAccent === "emerald"
                                                            ? `
                                                                [&_h1]:text-emerald-700
                                                                dark:[&_h1]:text-emerald-300
                                                            `
                                                            : themeAccent === "indigo"
                                                                ? `
                                                                    [&_h1]:text-indigo-700
                                                                    dark:[&_h1]:text-indigo-300
                                                                `
                                                                : `
                                                                    [&_h1]:text-red-700
                                                                    dark:[&_h1]:text-red-300
                                                                `
                                                    }

                                                    /* ========================= */
                                                    /* H2 */
                                                    /* ========================= */

                                                    [&_h2]:!text-lg
                                                    md:[&_h2]:!text-xl
                                                    [&_h2]:!font-medium
                                                    [&_h2]:leading-tight
                                                    [&_h2]:!mt-7
                                                    [&_h2]:!mb-0

                                                    ${
                                                        themeAccent === "emerald"
                                                            ? `
                                                                [&_h2]:text-emerald-700
                                                                dark:[&_h2]:text-emerald-300

                                                                [&_h3]:text-emerald-600
                                                                dark:[&_h3]:text-emerald-400

                                                                [&_a]:!text-emerald-600
                                                                dark:[&_a]:!text-emerald-400
                                                                hover:[&_a]:text-emerald-500

                                                                prose-blockquote:border-emerald-400

                                                                prose-code:text-emerald-500
                                                                dark:prose-code:text-emerald-300
                                                            `
                                                            : themeAccent === "indigo"
                                                                ? `
                                                                    [&_h2]:text-indigo-700
                                                                    dark:[&_h2]:text-indigo-300

                                                                    [&_h3]:text-indigo-600
                                                                    dark:[&_h3]:text-indigo-400

                                                                    [&_a]:!text-indigo-600
                                                                    dark:[&_a]:!text-indigo-400
                                                                    hover:[&_a]:text-indigo-500

                                                                    prose-blockquote:border-indigo-400

                                                                    prose-code:text-indigo-500
                                                                    dark:prose-code:text-indigo-300
                                                                `
                                                                : `
                                                                    [&_h2]:text-red-700
                                                                    dark:[&_h2]:text-red-300

                                                                    [&_h3]:text-red-600
                                                                    dark:[&_h3]:text-red-400

                                                                    [&_a]:!text-red-600
                                                                    dark:[&_a]:!text-red-400
                                                                    hover:[&_a]:text-red-500

                                                                    prose-blockquote:border-red-400

                                                                    prose-code:text-red-500
                                                                    dark:prose-code:text-red-300
                                                                `
                                                    }

                                                    [&_h3]:!text-base
                                                    md:[&_h3]:!text-lg
                                                    [&_h3]:!font-medium
                                                    [&_h3]:!mt-2
                                                    [&_h3]:!mb-0

                                                    /* ========================= */
                                                    /* PARAGRAPH */
                                                    /* ========================= */

                                                    prose-p:text-gray-700
                                                    dark:prose-p:text-gray-300
                                                    prose-p:leading-7

                                                    [&_p]:!my-2

                                                    [&_h1+p]:!mt-0
                                                    [&_h2+p]:!mt-[.25em]
                                                    [&_h3+p]:!mt-0

                                                    /* ========================= */
                                                    /* LIST */
                                                    /* ========================= */

                                                    prose-li:text-gray-700
                                                    dark:prose-li:text-gray-300

                                                    [&_ul]:!my-1
                                                    [&_ol]:!my-1

                                                    [&_p+ul]:!mt-1
                                                    [&_p+ol]:!mt-1

                                                    [&_ul+p]:!mt-1
                                                    [&_ol+p]:!mt-1

                                                    [&_li]:!my-0
                                                    [&_li]:leading-6

                                                    [&_li_p]:!my-0
                                                    [&_li_p]:leading-6

                                                    /* ========================= */
                                                    /* STRONG */
                                                    /* ========================= */

                                                    prose-strong:text-gray-900
                                                    dark:prose-strong:text-white
                                                    prose-strong:font-bold

                                                    /* ========================= */
                                                    /* LINK */
                                                    /* ========================= */

                                                    [&_a]:!font-medium
                                                    [&_a]:no-underline
                                                    hover:[&_a]:underline
                                                    [&_a]:transition-colors

                                                    /* ========================= */
                                                    /* CODE */
                                                    /* ========================= */

                                                    prose-code:bg-gray-100
                                                    dark:prose-code:bg-white/10

                                                    prose-code:px-1.5
                                                    prose-code:py-0.5
                                                    prose-code:rounded-md

                                                    /* ========================= */
                                                    /* PRE */
                                                    /* ========================= */

                                                    prose-pre:bg-[#0b1120]
                                                    prose-pre:border
                                                    prose-pre:border-white/10
                                                    prose-pre:rounded-2xl

                                                    /* ========================= */
                                                    /* BLOCKQUOTE */
                                                    /* ========================= */

                                                    prose-blockquote:bg-gray-100
                                                    dark:prose-blockquote:bg-white/5

                                                    prose-blockquote:rounded-r-xl
                                                    prose-blockquote:px-6
                                                    prose-blockquote:py-2

                                                    /* ========================= */
                                                    /* IMAGE */
                                                    /* ========================= */

                                                    prose-img:rounded-2xl
                                                    prose-img:shadow-2xl

                                                    /* ========================= */
                                                    /* TABLE */
                                                    /* ========================= */

                                                    prose-table:border-collapse

                                                    prose-th:border
                                                    prose-td:border

                                                    prose-th:border-gray-300
                                                    prose-td:border-gray-300

                                                    dark:prose-th:border-white/10
                                                    dark:prose-td:border-white/10
                                                `}
                                                dangerouslySetInnerHTML={{
                                                    __html: activeDoc.konten,
                                                }}
                                            />
                                        </>
                                    ) : (
                                        <div
                                            className="
                                                flex min-h-[500px] items-center
                                                justify-center rounded-3xl
                                                border border-dashed border-gray-300
                                                dark:border-white/10
                                            "
                                        >
                                            <div className="text-center">

                                                <h2 className="text-2xl font-bold">
                                                    Dokumentasi kosong
                                                </h2>

                                                <p className="mt-2 text-gray-500 dark:text-gray-400">
                                                    Belum ada dokumentasi tersedia.
                                                </p>
                                            </div>
                                        </div>
                                    )}
                                </div>
                            </main>
                            <Footer tc={tc} />
                        </div>                        
                    </div>

                    {/* RIGHT SIDEBAR */}
                    <aside
                        className="
                            docs-toc
                            sticky top-16 hidden
                            h-[calc(100vh-64px)]
                            w-[260px] shrink-0
                            overflow-y-auto
                            border-l border-gray-200
                            px-6 py-10
                            dark:border-white/10
                            xl:block
                            xl:self-start
                        "
                    >
                        <div className="space-y-5">

                            <div>
                                <h3 className="text-sm font-semibold text-gray-900 dark:text-white">
                                    On this page
                                </h3>
                            </div>

                            <div className="relative space-y-1 border-l border-gray-200 pl-4 dark:border-white/10">

                                {toc.length > 0 ? (
                                    toc.map((item) => {

                                        const active =
                                            activeHeading === item.id

                                        return (
                                            <button
                                                key={item.id}
                                                onClick={() => {
                                                    const element =
                                                        document.getElementById(item.id)

                                                    if (!element) return

                                                    const y =
                                                        element.getBoundingClientRect().top +
                                                        window.scrollY -
                                                        110

                                                    window.scrollTo({
                                                        top: y,
                                                        behavior: "smooth",
                                                    })
                                                }}
                                                className={`
                                                    block w-full text-left
                                                    cursor-pointer
                                                    rounded-md
                                                    py-1
                                                    transition-all duration-300

                                                    ${
                                                        item.level === "h1"
                                                            ? "text-sm"
                                                            : item.level === "h2"
                                                                ? "ml-2 text-sm"
                                                                : "ml-5 text-xs"
                                                    }

                                                    ${
                                                        activeHeading === item.id
                                                            ? themeAccent === "emerald"
                                                                ? "text-emerald-500 font-semibold"
                                                                : themeAccent === "indigo"
                                                                    ? "text-indigo-500 font-semibold"
                                                                    : "text-red-500 font-semibold"
                                                            : "text-gray-500 dark:text-gray-400 font-normal"
                                                    }

                                                    hover:text-gray-900 dark:hover:text-white
                                                `}
                                            >
                                                <span className="block truncate transition-colors duration-200">
                                                    {item.text}
                                                </span>
                                            </button>
                                        )
                                    })
                                ) : (
                                    <p className="text-sm text-gray-500 dark:text-gray-400">
                                        Tidak ada heading
                                    </p>
                                )}
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </>
    )
}