// resources/js/pages/docs/index.tsx

import { useEffect, useMemo, useState } from "react"
import { Head, Link } from "@inertiajs/react"
import {
    BookOpen,
    ChevronDown,
    ChevronRight,
    FileText,
    Layers3,
    LibraryBig,
    Menu,
    Moon,
    Search,
    Sun,
    X,
} from "lucide-react"

type DocMenu = {
    title: string
    slug: string
}

type DocCategory = {
    title: string
    icon?: any
    menus: DocMenu[]
}

const docs: DocCategory[] = [
    {
        title: "Panduan Dasar",
        icon: BookOpen,
        menus: [
            {
                title: "Pengenalan Digilib",
                slug: "pengenalan-digilib",
            },
            {
                title: "Cara Login",
                slug: "cara-login",
            },
            {
                title: "Dashboard",
                slug: "dashboard",
            },
        ],
    },

    {
        title: "Manajemen Buku",
        icon: LibraryBig,
        menus: [
            {
                title: "Tambah Buku",
                slug: "tambah-buku",
            },
            {
                title: "Import Buku Excel",
                slug: "import-buku",
            },
            {
                title: "Kategori Buku",
                slug: "kategori-buku",
            },
        ],
    },

    {
        title: "Repository",
        icon: Layers3,
        menus: [
            {
                title: "Upload Skripsi",
                slug: "upload-skripsi",
            },
            {
                title: "Repository Mahasiswa",
                slug: "repository-mahasiswa",
            },
        ],
    },

    {
        title: "Sirkulasi",
        icon: FileText,
        menus: [
            {
                title: "Peminjaman",
                slug: "peminjaman",
            },
            {
                title: "Pengembalian",
                slug: "pengembalian",
            },
        ],
    },
]

const contentMap: Record<
    string,
    {
        title: string
        content: string
    }
> = {
    "pengenalan-digilib": {
        title: "Pengenalan Digilib Ibrahimy",
        content:
            "Digilib Ibrahimy adalah platform perpustakaan digital modern yang digunakan untuk mengelola koleksi buku, repository, jurnal, serta layanan perpustakaan secara terintegrasi.",
    },

    "cara-login": {
        title: "Cara Login",
        content:
            "Masuk menggunakan akun yang diberikan administrator. Setelah login Anda akan diarahkan menuju dashboard utama sistem.",
    },

    dashboard: {
        title: "Dashboard",
        content:
            "Dashboard menampilkan statistik koleksi, aktivitas pengguna, jumlah peminjaman, dan informasi penting lainnya.",
    },

    "tambah-buku": {
        title: "Tambah Buku",
        content:
            "Masuk ke menu Buku kemudian klik tombol tambah buku untuk menambahkan koleksi baru ke sistem.",
    },

    "import-buku": {
        title: "Import Buku Excel",
        content:
            "Fitur import memungkinkan admin memasukkan ribuan data buku sekaligus menggunakan template Excel.",
    },

    "kategori-buku": {
        title: "Kategori Buku",
        content:
            "Kategori buku digunakan untuk mengelompokkan koleksi agar pencarian lebih mudah dilakukan.",
    },

    "upload-skripsi": {
        title: "Upload Skripsi",
        content:
            "Mahasiswa atau admin dapat mengunggah file skripsi PDF beserta metadata penulis dan abstrak.",
    },

    "repository-mahasiswa": {
        title: "Repository Mahasiswa",
        content:
            "Repository mahasiswa berisi karya ilmiah, skripsi, jurnal, dan dokumen akademik lainnya.",
    },

    peminjaman: {
        title: "Peminjaman Buku",
        content:
            "Petugas dapat melakukan transaksi peminjaman melalui halaman sirkulasi dengan scan barcode atau input manual.",
    },

    pengembalian: {
        title: "Pengembalian Buku",
        content:
            "Pengembalian buku akan otomatis menghitung keterlambatan serta denda apabila ada.",
    },
}

export default function DocsPage() {
    const [mobileOpen, setMobileOpen] = useState(false)

    const [darkMode, setDarkMode] = useState(true)

    const [openCategories, setOpenCategories] = useState<string[]>([
        "Panduan Dasar",
    ])

    const [activeMenu, setActiveMenu] =
        useState<string>("pengenalan-digilib")

    const activeContent = useMemo(() => {
        return contentMap[activeMenu]
    }, [activeMenu])

    const toggleCategory = (category: string) => {
        setOpenCategories((prev) =>
            prev.includes(category)
                ? prev.filter((c) => c !== category)
                : [...prev, category]
        )
    }

    useEffect(() => {
        const savedTheme = localStorage.getItem("docs-theme")

        if (savedTheme === "light") {
            setDarkMode(false)
        } else {
            setDarkMode(true)
        }
    }, [])

    useEffect(() => {
        if (darkMode) {
            document.documentElement.classList.add("dark")
            localStorage.setItem("docs-theme", "dark")
        } else {
            document.documentElement.classList.remove("dark")
            localStorage.setItem("docs-theme", "light")
        }
    }, [darkMode])

    useEffect(() => {
        window.scrollTo({
            top: 0,
            behavior: "smooth",
        })
    }, [activeMenu])

    return (
        <>
            <Head title="Dokumentasi Digilib" />

            <div className="min-h-screen bg-white text-gray-900 transition-colors duration-300 dark:bg-[#020817] dark:text-white">

                {/* BACKGROUND BLUR */}
                <div className="pointer-events-none fixed inset-0 overflow-hidden">
                    <div className="absolute left-0 top-0 h-[500px] w-[500px] rounded-full bg-gradient-to-br from-primary/20 to-green-400/20 blur-3xl dark:from-blue-700/20"></div>

                    <div className="absolute right-0 top-0 h-[500px] w-[500px] rounded-full bg-gradient-to-r from-cyan-400/20 to-sky-300/20 blur-3xl dark:to-indigo-600/20"></div>
                </div>

                {/* HEADER */}
                <header className="sticky top-0 z-50 border-b border-gray-200/70 bg-white/80 backdrop-blur-xl dark:border-white/10 dark:bg-[#020817]/80">
                    <div className="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 lg:px-6">

                        {/* LEFT */}
                        <div className="flex items-center gap-3">

                            <button
                                onClick={() => setMobileOpen(true)}
                                className="rounded-xl border border-gray-200 bg-white p-2 text-gray-700 transition hover:bg-gray-100 dark:border-white/10 dark:bg-white/5 dark:text-gray-300 dark:hover:bg-white/10 lg:hidden"
                            >
                                <Menu className="h-5 w-5" />
                            </button>

                            <Link
                                href="/"
                                className="flex items-center gap-3"
                            >
                                <img
                                    src="/kubah.png"
                                    className="h-10 dark:hidden"
                                />

                                <img
                                    src="/kubah-putih.png"
                                    className="hidden h-10 dark:block"
                                />

                                <div>
                                    <h1 className="text-sm font-bold">
                                        Digilib Ibrahimy
                                    </h1>

                                    <p className="text-xs text-gray-500 dark:text-gray-400">
                                        Documentation
                                    </p>
                                </div>
                            </Link>
                        </div>

                        {/* SEARCH */}
                        <div className="hidden w-full max-w-xl px-8 lg:block">
                            <div className="relative">
                                <Search className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-gray-400" />

                                <input
                                    type="text"
                                    placeholder="Cari dokumentasi..."
                                    className="h-11 w-full rounded-2xl border border-gray-200 bg-white pl-11 pr-4 text-sm shadow-sm outline-none transition focus:border-primary dark:border-white/10 dark:bg-white/5 dark:text-white dark:focus:border-cyan-500"
                                />
                            </div>
                        </div>

                        {/* RIGHT */}
                        <div className="flex items-center gap-3">

                            <button
                                onClick={() => setDarkMode(!darkMode)}
                                className="flex h-11 w-11 items-center justify-center rounded-2xl border border-gray-200 bg-white shadow-sm transition hover:bg-gray-100 dark:border-white/10 dark:bg-white/5 dark:hover:bg-white/10"
                            >
                                {darkMode ? (
                                    <Sun className="h-5 w-5 text-white" />
                                ) : (
                                    <Moon className="h-5 w-5 text-gray-700" />
                                )}
                            </button>
                        </div>
                    </div>
                </header>

                <div className="relative mx-auto flex max-w-7xl">

                    {/* MOBILE OVERLAY */}
                    {mobileOpen && (
                        <div
                            className="fixed inset-0 z-40 bg-black/50 backdrop-blur-sm lg:hidden"
                            onClick={() => setMobileOpen(false)}
                        />
                    )}

                    {/* SIDEBAR */}
                    <aside
                        className={`
                            fixed left-0 top-0 z-50 h-full w-[290px]
                            transform border-r border-gray-200
                            bg-white transition-transform duration-300
                            dark:border-white/10 dark:bg-[#081120]
                            lg:sticky lg:top-16 lg:z-0
                            lg:h-[calc(100vh-64px)]
                            lg:translate-x-0
                            ${
                                mobileOpen
                                    ? "translate-x-0"
                                    : "-translate-x-full"
                            }
                        `}
                    >
                        {/* MOBILE HEADER */}
                        <div className="flex h-16 items-center justify-between border-b border-gray-200 px-5 dark:border-white/10 lg:hidden">
                            <h2 className="font-semibold">
                                Dokumentasi
                            </h2>

                            <button
                                onClick={() => setMobileOpen(false)}
                                className="rounded-xl p-2 hover:bg-gray-100 dark:hover:bg-white/10"
                            >
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        {/* MENU */}
                        <div className="h-[calc(100%-64px)] overflow-y-auto px-4 py-6">
                            <nav className="space-y-4">
                                {docs.map((category) => {
                                    const isOpen =
                                        openCategories.includes(
                                            category.title
                                        )

                                    const Icon = category.icon

                                    return (
                                        <div
                                            key={category.title}
                                            className="overflow-hidden rounded-2xl border border-gray-200 bg-white/70 backdrop-blur-sm dark:border-white/5 dark:bg-white/[0.03]"
                                        >
                                            {/* CATEGORY */}
                                            <button
                                                onClick={() =>
                                                    toggleCategory(
                                                        category.title
                                                    )
                                                }
                                                className="flex w-full items-center justify-between px-4 py-3 transition hover:bg-gray-50 dark:hover:bg-white/5"
                                            >
                                                <div className="flex items-center gap-3">
                                                    {Icon && (
                                                        <Icon className="h-4 w-4 text-primary dark:text-cyan-400" />
                                                    )}

                                                    <span className="text-sm font-medium">
                                                        {category.title}
                                                    </span>
                                                </div>

                                                {isOpen ? (
                                                    <ChevronDown className="h-4 w-4 text-gray-400" />
                                                ) : (
                                                    <ChevronRight className="h-4 w-4 text-gray-400" />
                                                )}
                                            </button>

                                            {/* MENU */}
                                            <div
                                                className={`
                                                    overflow-hidden transition-all duration-300
                                                    ${
                                                        isOpen
                                                            ? "max-h-96 opacity-100"
                                                            : "max-h-0 opacity-0"
                                                    }
                                                `}
                                            >
                                                <div className="space-y-1 px-2 pb-3">
                                                    {category.menus.map(
                                                        (menu) => {
                                                            const active =
                                                                activeMenu ===
                                                                menu.slug

                                                            return (
                                                                <button
                                                                    key={
                                                                        menu.slug
                                                                    }
                                                                    onClick={() => {
                                                                        setActiveMenu(
                                                                            menu.slug
                                                                        )
                                                                        setMobileOpen(
                                                                            false
                                                                        )
                                                                    }}
                                                                    className={`
                                                                        w-full rounded-xl px-3 py-2 text-left text-sm transition
                                                                        ${
                                                                            active
                                                                                ? "bg-gradient-to-r from-primary/15 to-cyan-500/15 text-primary dark:text-cyan-300"
                                                                                : "text-gray-600 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-white/5 dark:hover:text-white"
                                                                        }
                                                                    `}
                                                                >
                                                                    {
                                                                        menu.title
                                                                    }
                                                                </button>
                                                            )
                                                        }
                                                    )}
                                                </div>
                                            </div>
                                        </div>
                                    )
                                })}
                            </nav>
                        </div>
                    </aside>

                    {/* CONTENT */}
                    <main className="min-w-0 flex-1 px-5 py-10 lg:px-12">

                        <div className="mx-auto max-w-4xl">

                            {/* TITLE */}
                            <h1 className="text-4xl font-black tracking-tight md:text-5xl">
                                {activeContent?.title}
                            </h1>

                            {/* DESC */}
                            <p className="mt-5 text-lg leading-8 text-gray-600 dark:text-gray-400">
                                {activeContent?.content}
                            </p>

                            {/* CARD */}
                            <div className="mt-10 space-y-8">

                                <section className="rounded-3xl border border-gray-200 bg-white/80 p-8 shadow-sm backdrop-blur-sm dark:border-white/10 dark:bg-white/[0.03]">

                                    <h2 className="mb-4 text-2xl font-bold">
                                        Penjelasan
                                    </h2>

                                    <p className="leading-8 text-gray-600 dark:text-gray-400">
                                        Tampilan dokumentasi dibuat modern,
                                        clean, dan konsisten dengan design system
                                        Digilib Ibrahimy menggunakan kombinasi
                                        glassmorphism, soft shadow, dark mode,
                                        dan smooth animation.
                                    </p>
                                </section>

                                <section className="rounded-3xl border border-primary/10 bg-gradient-to-br from-primary/5 via-cyan-500/5 to-sky-500/5 p-8 dark:border-cyan-500/10">

                                    <h2 className="mb-4 text-2xl font-bold">
                                        Fitur Utama
                                    </h2>

                                    <ul className="space-y-4 text-gray-700 dark:text-gray-300">
                                        <li>
                                            ✨ Sidebar accordion interaktif
                                        </li>

                                        <li>
                                            📱 Responsive mobile hamburger menu
                                        </li>

                                        <li>
                                            🌙 Light mode & dark mode
                                        </li>

                                        <li>
                                            ⚡ Smooth animation transition
                                        </li>

                                        <li>
                                            🎨 UI konsisten dengan Digilib
                                            Ibrahimy
                                        </li>
                                    </ul>
                                </section>
                            </div>
                        </div>
                    </main>

                    {/* RIGHT SIDEBAR */}
                    <aside className="sticky top-16 hidden h-[calc(100vh-64px)] w-[260px] shrink-0 overflow-y-auto border-l border-gray-200 px-6 py-10 dark:border-white/10 xl:block">

                        <div className="space-y-5">

                            <div>
                                <h3 className="text-sm font-semibold">
                                    On this page
                                </h3>
                            </div>

                            <div className="space-y-3 border-l border-gray-200 pl-4 text-sm dark:border-white/10">

                                <a
                                    href="#"
                                    className="block text-primary dark:text-cyan-400"
                                >
                                    Penjelasan
                                </a>

                                <a
                                    href="#"
                                    className="block text-gray-500 transition hover:text-gray-900 dark:text-gray-400 dark:hover:text-white"
                                >
                                    Fitur Utama
                                </a>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </>
    )
}