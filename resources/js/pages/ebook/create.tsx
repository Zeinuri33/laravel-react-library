"use client"

import { useCallback, useState, useEffect, useRef   } from "react"
import axios from "axios"
import { Head, router, useForm, Link, usePage } from "@inertiajs/react"
import { Check, ChevronsUpDown, SearchX, Upload, X } from "lucide-react"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Separator } from "@/components/ui/separator"
import { toast } from "sonner"
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle,
} from "@/components/ui/alert-dialog"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"

import {
    Command,
    CommandEmpty,
    CommandGroup,
    CommandInput,
    CommandItem,
    CommandList,
} from "@/components/ui/command"

import { cn } from "@/lib/utils"

const ignoredTitleWords = new Set([
    "buku",
    "ebook",
    "e-book",
    "edisi",
    "jilid",
    "volume",
    "vol",
    "seri",
    "panduan",
    "dasar",
    "pengantar",
    "untuk",
    "dan",
    "atau",
    "yang",
    "dengan",
    "dalam",
    "pada",
    "the",
    "and",
    "for",
    "with",
])

const tokenize = (value: string | null | undefined) =>
    (value ?? "")
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, " ")
        .split(" ")
        .map((word) => word.trim())
        .filter((word) => word.length > 2 && !ignoredTitleWords.has(word))

export default function CreateEbook() {
    

    const [open, setOpen] = useState(false)
    const [search, setSearch] = useState("")

    const [preview, setPreview] =
        useState<string | null>(null)
    const [extracting, setExtracting] =
        useState(false)


    const {
        data, setData, post, processing, errors,
    } = useForm({
        judul: "", isbn: "", eisbn: "", tahun_terbit: "", penulis: "", penerbit: "", klasifikasi_id: "", deskripsi: "", cover: null as File | null, file: null as File | null,
        cover_path: "" as string,
        file_path: "" as string,
    })

    type PageProps = {
        klasifikasis: {
            id: number
            kode: string
            kategori: string | null
            deskripsi: string
        }[]
    }

    const { klasifikasis } = usePage<PageProps>().props

    const [showLeaveDialog, setShowLeaveDialog] = useState(false)

    const manualKlasifikasiRef = useRef(false)
    const autoSelectedKlasifikasiRef = useRef<string>("")

    const findBestKlasifikasiByTitle = useCallback((title: string) => {
        const titleTokens = tokenize(title)

        if (titleTokens.length === 0) {
            return null
        }

        let bestMatch: (typeof klasifikasis)[number] | null = null
        let bestScore = 0

        for (const item of klasifikasis) {
            const kodeTokens = new Set(tokenize(item.kode))
            const kategoriTokens = new Set(tokenize(item.kategori))
            const deskripsiTokens = new Set(tokenize(item.deskripsi))

            let score = 0

            for (const token of titleTokens) {
                if (kodeTokens.has(token)) score += 6
                if (kategoriTokens.has(token)) score += 5
                if (deskripsiTokens.has(token)) score += 2
            }

            if (score > bestScore) {
                bestScore = score
                bestMatch = item
            }
        }

        return bestScore >= 5 ? bestMatch : null
    }, [klasifikasis])

    const submit = (e: React.FormEvent) => {
        e.preventDefault()

        bypassGuard.current = true

        post("/list-ebooks", {
            forceFormData: true,
            preserveScroll: true,
            onSuccess: () => {
                toast.success(`E-Book ${data.judul} berhasil ditambahkan`)
                router.visit("/list-ebooks")
            },
            onError: () => {
                bypassGuard.current = false
                toast.error("Gagal menyimpan E-Book")
            },
        })
    }
    const [pdfPreview, setPdfPreview] =
    useState<string | null>(null)

    const handlePdfUpload = async (
    e: React.ChangeEvent<HTMLInputElement>
    ) => {
        const file = e.target.files?.[0]
        if (!file) return
        manualKlasifikasiRef.current = false
        autoSelectedKlasifikasiRef.current = ""
        setData("file", file)
        setPdfPreview(
            URL.createObjectURL(file)
        )
        setExtracting(true)
        setProgress(0)
        const timer = setInterval(() => {
            setProgress((prev) => {
                if (prev >= 90) {
                    return prev
                }
                return prev + 10
            })
        }, 300)

        try {
            const formData = new FormData()
            formData.append(
                "file",
                file
            )
            const response = await axios.post("/ebooks/extract", formData)
            const ebook = response.data
            setData("judul", ebook.judul ?? "")
            setData("isbn", ebook.isbn ?? "")
            setData("eisbn", ebook.eisbn ?? "")
            setData("tahun_terbit", ebook.tahun_terbit ?? "")
            setData("penulis", ebook.penulis ?? "")
            setData("penerbit", ebook.penerbit ?? "")
            setData("deskripsi", ebook.deskripsi ?? "")
            setData("file_path", ebook.file_path)

            if (ebook.cover) {
                setPreview(ebook.cover)
                setData("cover_path", ebook.cover_path)
            }
            clearInterval(timer)
            setProgress(100)
            setTimeout(() => {
                setExtracting(false)
            }, 300)
            toast.success(
                "Metadata PDF berhasil dibaca"
            )
        } catch (error) {
            clearInterval(timer)
            setProgress(0)
            setExtracting(false)
            toast.error(
                "Gagal membaca metadata PDF"
            )
        }
    }
    const [progress, setProgress] =

    useState(0)

    const selectedKlasifikasi = klasifikasis.find(
        (item) => String(item.id) === data.klasifikasi_id
    )

    const filteredKlasifikasis = klasifikasis.filter((item) => {
        const keyword = (search || "")
            .toLowerCase()
            .trim()

        const text = `${item.kode ?? ""} ${item.kategori ?? ""} ${item.deskripsi ?? ""}`
            .toLowerCase()

        if (!keyword) return true

        if (text.includes(keyword)) return true

        const tokens = keyword
            .split(" ")
            .filter(Boolean)

        if (tokens.length === 0) return true

        return tokens.some((token) => text.includes(token))
    })



    const bypassGuard = useRef(false)
    const pendingUrlRef = useRef<string | null>(null)

    useEffect(() => {
        if (manualKlasifikasiRef.current) return

        const shouldAutoSelect =
            !data.klasifikasi_id ||
            data.klasifikasi_id === autoSelectedKlasifikasiRef.current

        if (!shouldAutoSelect) return

        const match = findBestKlasifikasiByTitle(data.judul)

        if (!match) {
            if (
                data.klasifikasi_id &&
                data.klasifikasi_id === autoSelectedKlasifikasiRef.current
            ) {
                autoSelectedKlasifikasiRef.current = ""
                setData("klasifikasi_id", "")
            }

            return
        }

        const nextKlasifikasiId = String(match.id)

        if (data.klasifikasi_id !== nextKlasifikasiId) {
            autoSelectedKlasifikasiRef.current = nextKlasifikasiId
            setData("klasifikasi_id", nextKlasifikasiId)
        }
    }, [data.judul, data.klasifikasi_id, findBestKlasifikasiByTitle])

    useEffect(() => {
        // =========================
        // HANDLE BROWSER REFRESH / CLOSE TAB
        // =========================
        const handleUnload = () => {
            if (!data.file_path && !data.cover_path) return

            const payload = JSON.stringify({
                file_path: data.file_path,
                cover_path: data.cover_path,
            })

            navigator.sendBeacon(
                "/ebooks/cleanup-temp",
                new Blob([payload], {
                    type: "application/json",
                })
            )
        }

        window.addEventListener("beforeunload", handleUnload)

        // =========================
        // HANDLE INERTIA NAVIGATION
        // =========================
        const removeRouterListener = router.on("before", (event) => {
            if (bypassGuard.current) return

            if (!data.file_path && !data.cover_path) return

            event.preventDefault()

            pendingUrlRef.current = event.detail.visit.url.toString()
            setShowLeaveDialog(true)
        })

        // =========================
        // CLEANUP
        // =========================
        return () => {
            window.removeEventListener("beforeunload", handleUnload)
            removeRouterListener()
        }
    }, [data.file_path, data.cover_path])

    

    return (
    <>
        <Head title="Tambah E-Book" />
            <div className="p-6 space-y-4">
                <div className="flex justify-between">
                    <Heading
                        variant="small"
                        title="Tambah E-Book"
                        description="Tambahkan koleksi e-book baru."
                    />
                    <Link href="/list-ebooks">
                        <Button variant="outline">
                            Kembali
                        </Button>
                    </Link>
                </div>
            <Separator />

            <div className="grid gap-6 lg:grid-cols-12 items-stretch">
                {/* kiri */}
                <div className="lg:col-span-8 flex flex-col h-full">
                    <div className="relative h-full rounded-lg border overflow-hidden bg-muted">
                        {pdfPreview ? (
                            <>
                                <iframe
                                    src={pdfPreview}
                                    className="h-full w-full"
                                />

                                <Button
                                    type="button"
                                    variant="destructive"
                                    className="absolute bottom-3 right-3 z-20"
                                    onClick={async () => {
                                        if (data.file_path || data.cover_path) {
                                            await axios.post("/ebooks/cleanup-temp", {
                                                file_path: data.file_path,
                                                cover_path: data.cover_path,
                                            })
                                        }

                                        setData("file", null)
                                        setData("file_path", "")
                                        setData("cover_path", "")
                                        setData("judul", "")
                                        setData("isbn", "")
                                        setData("eisbn", "")
                                        setData("tahun_terbit", "")
                                        setData("penulis", "")
                                        setData("penerbit", "")
                                        setData("klasifikasi_id", "")
                                        setData("deskripsi", "")
                                        manualKlasifikasiRef.current = false
                                        autoSelectedKlasifikasiRef.current = ""
                                        setPdfPreview(null)
                                        setPreview(null)
                                    }}
                                >
                                    <X className="mr-2 h-4 w-4" />
                                    Remove PDF
                                </Button>
                            </>
                        ) : (
                            <label className="flex h-full w-full cursor-pointer flex-col items-center justify-center gap-3">
                                <Upload className="h-10 w-10 text-muted-foreground" />

                                <div className="text-center">
                                    <p className="font-medium">
                                        Upload PDF
                                    </p>

                                    <p className="text-sm text-muted-foreground">
                                        Klik untuk memilih file PDF
                                    </p>
                                </div>

                                <Input
                                    type="file"
                                    accept=".pdf"
                                    className="hidden"
                                    onChange={handlePdfUpload}
                                />
                            </label>
                        )}

                        {/* LOADING OVERLAY */}
                        {extracting && (
                            <div className="absolute inset-0 z-50 flex flex-col items-center justify-center bg-background/90 backdrop-blur-sm">

                                <div className="h-12 w-12 rounded-full border-4 border-primary border-t-transparent animate-spin" />

                                <h3 className="mt-4 text-lg font-semibold">
                                    Membaca Metadata PDF
                                </h3>

                                <p className="mt-1 text-sm text-muted-foreground">
                                    Mohon tunggu sebentar...
                                </p>

                                <div className="mt-6 w-80">
                                    <div className="h-3 overflow-hidden rounded-full bg-muted">
                                        <div
                                            className="h-full bg-primary transition-all duration-300"
                                            style={{
                                                width: `${progress}%`,
                                            }}
                                        />
                                    </div>

                                    <div className="mt-2 flex justify-between text-xs text-muted-foreground">
                                        <span>Processing...</span>
                                        <span>{progress}%</span>
                                    </div>
                                </div>
                            </div>
                        )}
                    </div>
                </div>
                {/* kanan */}
                <div className="lg:col-span-4 flex flex-col h-full">
                    {/* FORM SCROLL */}
                    <div className="flex-1 overflow-y-auto px-4 py-2">
                        <form id="ebook-form" onSubmit={submit} className="space-y-4">
                            {/* COVER */}
                            <div className="space-y-2 text-center">
                                <Label>
                                    Cover Buku
                                </Label>
                                <div className="flex justify-center">
                                    <div className="relative h-40 w-28">
                                        <label className="block h-40 w-28 cursor-pointer">
                                            <div className="h-40 w-28 rounded-lg border overflow-hidden bg-muted flex items-center justify-center">
                                                {preview ? (
                                                    <img src={preview} className="h-full w-full object-cover"/>
                                                ) : (
                                                    <Upload className="h-6 w-6 text-muted-foreground" />
                                                )}
                                            </div>
                                            <div className="absolute inset-0 flex items-center justify-center rounded-lg bg-black/40 opacity-0 hover:opacity-100 transition">
                                                <span className="text-white text-xs">
                                                    Upload
                                                </span>
                                            </div>
                                            <Input type="file" accept="image/*" className="hidden" onChange={
                                                ( e ) => {
                                                    const file =
                                                        e
                                                            .target
                                                            .files?.[0]
                                                    if (
                                                        file
                                                    ) {
                                                        setData(
                                                            "cover",
                                                            file
                                                        )
                                                        setPreview(
                                                            URL.createObjectURL(
                                                                file
                                                            )
                                                        )
                                                    }
                                                }}
                                            />
                                        </label>
                                        {preview && (
                                            <button
                                                type="button"
                                                onClick={() => {
                                                    setData(
                                                        "cover",
                                                        null
                                                    )
                                                    setPreview(
                                                        null
                                                    )
                                                }}
                                                className="absolute bottom-0 right-0 h-7 w-7 rounded-full bg-red-500 text-white flex items-center justify-center"
                                            >
                                                <X className="h-4 w-4" />
                                            </button>
                                        )}
                                    </div>
                                </div>
                                {errors.cover && (
                                    <p className="text-sm text-red-500">
                                        {
                                            errors.cover
                                        }
                                    </p>
                                )}
                            </div>
                            <div>
                                <Label className="pb-2">Judul Buku</Label>
                                <Input placeholder="Masukkan judul buku" value={data.judul} onChange={(e) => setData("judul", e.target.value)}/>
                            </div>

                            <div>
                                <Label className="pb-2">ISBN</Label>
                                <Input placeholder="978-602-xxxx-xxx-x" value={data.isbn} onChange={(e) => setData("isbn", e.target.value)}/>
                            </div>

                            <div>
                                <Label className="pb-2">EISBN</Label>
                                <Input placeholder="978-602-xxxx-xxx-x" value={data.eisbn} onChange={(e) => setData("eisbn", e.target.value)}/>
                            </div>

                            <div>
                                <Label className="pb-2">Tahun Terbit</Label>
                                <Input placeholder="2026" value={data.tahun_terbit} onChange={(e) => setData("tahun_terbit", e.target.value)}/>
                            </div>
                            <div>
                                <Label className="pb-2">Penulis</Label>
                                <Input placeholder="Nama penulis" value={data.penulis} onChange={(e) => setData("penulis", e.target.value)}/>
                            </div>

                            <div>
                                <Label className="pb-2">Penerbit</Label>
                                <Input placeholder="Nama penerbit" value={data.penerbit} onChange={(e) => setData("penerbit", e.target.value)}/>
                            </div>
                            <div>
                                <Label className="pb-2">Klasifikasi</Label>

                                <Button
                                    type="button"
                                    variant="outline"
                                    role="combobox"
                                    className="w-full justify-between"
                                    onClick={() => setOpen(true)}
                                >
                                    <span className="truncate">
                                        {selectedKlasifikasi
                                            ? `${selectedKlasifikasi.kode} - ${selectedKlasifikasi.kategori}`
                                            : "Pilih Klasifikasi"}
                                    </span>
                                    <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
                                </Button>

                                <Dialog
                                    open={open}
                                    onOpenChange={(nextOpen) => {
                                        setOpen(nextOpen)

                                        if (!nextOpen) {
                                            setSearch("")
                                        }
                                    }}
                                >
                                    <DialogContent className="max-w-2xl overflow-hidden bg-background p-0">
                                        <DialogHeader className="border-b bg-background px-6 py-4">
                                            <DialogTitle>
                                                Pilih Klasifikasi
                                            </DialogTitle>
                                            <DialogDescription>
                                                Cari berdasarkan kode, kategori, atau deskripsi klasifikasi.
                                            </DialogDescription>
                                        </DialogHeader>

                                        <Command
                                            shouldFilter={false}
                                            className="rounded-none bg-background text-foreground [&_[data-slot=command-input-wrapper]]:h-11 [&_[data-slot=command-input-wrapper]]:bg-background [&_[data-slot=command-input]]:h-11 [&_[data-slot=command-input]]:py-0"
                                        >
                                            <CommandInput
                                                placeholder="Cari klasifikasi..."
                                                value={search}
                                                onValueChange={(value) => setSearch(value ?? "")}
                                            />

                                            <CommandList className="max-h-[420px] bg-background">
                                                {filteredKlasifikasis.length === 0 ? (
                                                    <CommandEmpty className="bg-background px-6 py-10">
                                                        <div className="flex flex-col items-center gap-3 text-center">
                                                            <div className="flex h-12 w-12 items-center justify-center rounded-full border bg-muted/40">
                                                                <SearchX className="h-5 w-5 text-muted-foreground" />
                                                            </div>
                                                            <div className="space-y-1">
                                                                <p className="font-medium text-foreground">
                                                                    Tidak ditemukan
                                                                </p>
                                                                <p className="text-sm text-muted-foreground">
                                                                    Coba gunakan kata kunci lain atau cek kembali judul/kode klasifikasi.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </CommandEmpty>
                                                ) : (
                                                    <CommandGroup className="bg-background">
                                                        {filteredKlasifikasis.map((item) => (
                                                            <CommandItem
                                                                key={item.id}
                                                                value={String(item.id)}
                                                                className="items-start bg-background py-3 data-[selected=true]:bg-muted/70"
                                                                onSelect={() => {
                                                                    manualKlasifikasiRef.current = true
                                                                    autoSelectedKlasifikasiRef.current = ""
                                                                    setData(
                                                                        "klasifikasi_id",
                                                                        String(item.id)
                                                                    )
                                                                    setOpen(false)
                                                                    setSearch("")
                                                                }}
                                                            >
                                                                <Check
                                                                    className={cn(
                                                                        "mt-0.5 mr-2 h-4 w-4",
                                                                        data.klasifikasi_id ===
                                                                            String(item.id)
                                                                            ? "opacity-100"
                                                                            : "opacity-0"
                                                                    )}
                                                                />
                                                                <div className="min-w-0 flex-1">
                                                                    <div className="font-medium">
                                                                        {item.kode} - {item.kategori}
                                                                    </div>
                                                                    {item.deskripsi && (
                                                                        <div className="mt-1 line-clamp-2 text-xs text-muted-foreground">
                                                                            {item.deskripsi}
                                                                        </div>
                                                                    )}
                                                                </div>
                                                            </CommandItem>
                                                        ))}
                                                    </CommandGroup>
                                                )}
                                            </CommandList>
                                        </Command>
                                    </DialogContent>
                                </Dialog>

                                {errors.klasifikasi_id && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.klasifikasi_id}
                                    </p>
                                )}
                            </div>
                            <div>
                                <Label className="pb-2">Deskripsi</Label>
                                <Textarea rows={5} placeholder="Masukkan deskripsi atau ringkasan buku..." value={data.deskripsi} onChange={(e) => setData("deskripsi", e.target.value)}/>
                            </div>
                        </form>
                    </div>
                    <div className="px-4 pt-4 bg-background">
                        <Button
                            type="submit"
                            form="ebook-form"
                            disabled={processing}
                            className="w-full"
                        >
                            Simpan E-Book
                        </Button>
                    </div>
                </div>
            </div>
        </div>
        {/* Popup Dialog */}
<AlertDialog open={showLeaveDialog} onOpenChange={setShowLeaveDialog}>
    <AlertDialogContent size="sm">
        <AlertDialogHeader className="text-center space-y-2">
            <AlertDialogTitle className="text-lg font-semibold">
                Tinggalkan halaman?
            </AlertDialogTitle>
            <AlertDialogDescription className="text-sm text-muted-foreground">
                File PDF yang belum disimpan akan dihapus dari temporary storage.
            </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter className="flex flex-col gap-2 sm:flex-row sm:justify-center">
            <AlertDialogCancel className="w-full sm:w-auto">
                Tetap di Halaman
            </AlertDialogCancel>
            <AlertDialogAction
                onClick={async () => {
                    try {
                        await axios.post("/ebooks/cleanup-temp", {
                            file_path: data.file_path,
                            cover_path: data.cover_path,
                        })
                        bypassGuard.current = true
                        setShowLeaveDialog(false)
                        const url = pendingUrlRef.current
                        pendingUrlRef.current = null
                        if (url) {
                            router.visit(url)
                        }
                    } finally {
                        setTimeout(() => {
                            bypassGuard.current = false
                        }, 800)
                    }
                }}
            >
                Keluar Halaman
            </AlertDialogAction>
        </AlertDialogFooter>
    </AlertDialogContent>
</AlertDialog>
    </>
    )
}

CreateEbook.layout = {
    breadcrumbs: [
        {
            title: "E-Book",
            href: "/list-ebooks",
        },
        {
            title: "Tambah",
            href: "/ebooks/create",
        },
    ],
}
