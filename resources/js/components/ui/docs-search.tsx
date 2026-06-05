import { Link, router } from "@inertiajs/react"
import {
    Search,
    FileText,
    ChevronRight,
} from "lucide-react"

import {
    useEffect,
    useMemo,
    useRef,
    useState,
} from "react"

import { useTheme } from "@/context/ThemeContext"

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
    dokumentasi: Dokumentasi[]
}

export default function DocsSearch({
    dokumentasi,
}: Props) {

    const { themeAccent } = useTheme()

    const themeStyles = {
        emerald: {
            border: "focus:border-emerald-500",
            ring: "focus:ring-emerald-500/20 dark:focus:ring-emerald-500/30",
            activeBg: "bg-emerald-500/10",
            activeText: "text-emerald-500",
            activeIcon: "bg-emerald-500/15 text-emerald-500",
            arrow: "text-emerald-500",
            arrowSoft: "text-emerald-400",
        },

        red: {
            border: "focus:border-red-500",
            ring: "focus:ring-red-500/20 dark:focus:ring-red-500/30",
            activeBg: "bg-red-500/10",
            activeText: "text-red-500",
            activeIcon: "bg-red-500/15 text-red-500",
            arrow: "text-red-500",
            arrowSoft: "text-red-400",
        },

        indigo: {
            border: "focus:border-indigo-500",
            ring: "focus:ring-indigo-500/20 dark:focus:ring-indigo-500/30",
            activeBg: "bg-indigo-500/10",
            activeText: "text-indigo-500",
            activeIcon: "bg-indigo-500/15 text-indigo-500",
            arrow: "text-indigo-500",
            arrowSoft: "text-indigo-400",
        },
    }

    const tc =
        themeStyles[
            themeAccent as keyof typeof themeStyles
        ]

    const [query, setQuery] = useState("")

    const [open, setOpen] = useState(false)

    const [selectedIndex, setSelectedIndex] =
        useState(0)

    const wrapperRef =
        useRef<HTMLDivElement | null>(null)

    const results = useMemo(() => {

        if (!query.trim()) return []

        return dokumentasi
            .filter((doc) =>
                doc.judul
                    .toLowerCase()
                    .includes(query.toLowerCase())
            )
            .slice(0, 8)

    }, [query, dokumentasi])

    useEffect(() => {

        const handleClickOutside = (
            event: MouseEvent
        ) => {

            if (
                wrapperRef.current &&
                !wrapperRef.current.contains(
                    event.target as Node
                )
            ) {
                setOpen(false)
            }
        }

        document.addEventListener(
            "mousedown",
            handleClickOutside
        )

        return () => {
            document.removeEventListener(
                "mousedown",
                handleClickOutside
            )
        }

    }, [])

    useEffect(() => {

        if (results.length > 0) {
            setOpen(true)
        } else {
            setOpen(false)
        }

    }, [results])

    const handleKeyDown = (
        e: React.KeyboardEvent<HTMLInputElement>
    ) => {

        if (!open) return

        if (e.key === "ArrowDown") {

            e.preventDefault()

            setSelectedIndex((prev) =>
                prev < results.length - 1
                    ? prev + 1
                    : prev
            )
        }

        if (e.key === "ArrowUp") {

            e.preventDefault()

            setSelectedIndex((prev) =>
                prev > 0
                    ? prev - 1
                    : 0
            )
        }

        if (e.key === "Escape") {
            setOpen(false)
        }

        if (e.key === "Enter") {

            e.preventDefault()

            const selected =
                results[selectedIndex]

            if (selected) {

                setOpen(false)

                router.visit(
                    `/docs/${selected.slug}`,
                    {
                        preserveScroll: true,
                        preserveState: true,
                    }
                )
            }
        }
    }

    return (
        <div
            ref={wrapperRef}
            className="relative"
        >

            {/* INPUT */}
            <div className="relative">

                <Search
                    className="
                        absolute left-4 top-1/2
                        h-4 w-4 -translate-y-1/2
                        text-gray-400
                    "
                />

                <input
                    type="text"
                    value={query}
                    onChange={(e) => {
                        setQuery(e.target.value)
                        setSelectedIndex(0)
                    }}
                    onFocus={() => {
                        if (results.length > 0) {
                            setOpen(true)
                        }
                    }}
                    onKeyDown={handleKeyDown}
                    placeholder="Cari dokumentasi..."
                    className={`
                        h-9 w-full rounded-md
                        border border-gray-200
                        bg-white
                        pl-11 pr-4 text-sm
                        shadow-sm
                        outline-none transition

                        ${tc.border}
                        ${tc.ring}
                        focus:ring-1

                        dark:border-white/10
                        dark:bg-white/5
                        dark:text-white
                    `}
                />
            </div>

            {/* DROPDOWN */}
            {open && (
                <div
                    className="
                        absolute left-0 right-0 top-[calc(100%+12px)]
                        z-50 overflow-hidden
                        rounded-xl
                        border border-gray-200/70
                        bg-white
                        shadow-2xl

                        dark:border-white/10
                        dark:bg-[#0b1120]
                    "
                >

                    {/* HEADER */}
                    <div
                        className="
                            border-b border-gray-200/70
                            px-4 py-3

                            dark:border-white/10
                        "
                    >
                        <p
                            className="
                                text-xs font-semibold
                                uppercase tracking-[0.18em]
                                text-gray-500
                                dark:text-gray-400
                            "
                        >
                            Hasil pencarian
                        </p>
                    </div>

                    {/* RESULTS */}
                    <div className="max-h-[420px] overflow-y-auto p-2">

                        {results.map((doc, index) => {

                            const active =
                                selectedIndex === index

                            return (
                                <Link
                                    key={doc.id}
                                    href={`/docs/${doc.slug}`}
                                    onMouseEnter={() =>
                                        setSelectedIndex(index)
                                    }
                                    className={`
                                        group flex items-center
                                        gap-3 rounded-xl
                                        px-4 py-3 transition-all duration-200

                                        ${active
                                            ? tc.activeBg
                                            : ""
                                        }
                                    `}
                                >

                                    <div
                                        className={`
                                            self-start mt-0.5 flex h-9 w-9
                                            shrink-0 items-center justify-center
                                            rounded-xl transition-all duration-200

                                            ${active
                                                ? tc.activeIcon
                                                : "bg-gray-100 text-gray-400 dark:bg-white/5 dark:text-gray-500"
                                            }
                                        `}
                                    >
                                        <FileText className="h-4 w-4" />
                                    </div>

                                    <div className="min-w-0 flex-1">

                                        <div
                                            className={`
                                                line-clamp-1 text-sm font-semibold transition-colors

                                                ${active
                                                    ? tc.activeText
                                                    : "text-gray-900 dark:text-white"
                                                }
                                            `}
                                        >
                                            {doc.judul}
                                        </div>

                                        <div
                                            className="
                                                mt-1 text-xs
                                                text-gray-500
                                                dark:text-gray-400
                                            "
                                        >
                                            {
                                                doc.kategori
                                                    ?.kategori
                                            }
                                        </div>
                                    </div>

                                    <ChevronRight
                                        className={`
                                            h-5 w-5 shrink-0 transition-all duration-200

                                            ${active
                                                ? `translate-x-1 opacity-100 ${tc.arrow}`
                                                : `opacity-0 ${tc.arrowSoft}`
                                            }
                                        `}
                                    />
                                </Link>
                            )
                        })}

                        {results.length === 0 && (
                            <div
                                className="
                                    px-4 py-10 text-center
                                    text-sm text-gray-500
                                    dark:text-gray-400
                                "
                            >
                                Dokumentasi tidak ditemukan.
                            </div>
                        )}
                    </div>
                </div>
            )}
        </div>
    )
}