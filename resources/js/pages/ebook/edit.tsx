"use client"

import { useState } from "react"
import { Head, router, useForm, Link } from "@inertiajs/react"
import { Check, ChevronsUpDown, Upload, X } from "lucide-react"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Separator } from "@/components/ui/separator"
import { toast } from "sonner"
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

interface Ebook {
    id: number
    judul: string
    isbn: string
    eisbn: string
    tahun_terbit: string
    penulis: string
    penerbit: string
    klasifikasi_id: number | null
    qty: number
    deskripsi: string
    file: string | null
    cover: string | null
    file_path: string
    cover_path: string
}

type Klasifikasi = {
    id: number
    kode: string
    kategori: string | null
    deskripsi: string | null
}

export default function EditEbook({
    ebook,
    klasifikasis,
}: {
    ebook: Ebook
    klasifikasis: Klasifikasi[]
}) {

    const [open, setOpen] = useState(false)
    const [search, setSearch] = useState("")

    const [preview, setPreview] =
        useState<string | null>(ebook.cover)

    const {
        data,
        setData,
        put,
        processing,
        errors,
    } = useForm({
        judul: ebook.judul ?? "",
        isbn: ebook.isbn ?? "",
        eisbn: ebook.eisbn ?? "",
        tahun_terbit: ebook.tahun_terbit ?? "",
        penulis: ebook.penulis ?? "",
        penerbit: ebook.penerbit ?? "",
        klasifikasi_id: ebook.klasifikasi_id ? String(ebook.klasifikasi_id) : "",
        qty: ebook.qty ?? 1,
        deskripsi: ebook.deskripsi ?? "",

        cover: null as File | null,
        file: null as File | null,

        file_path: "",
        cover_path: "",
    })

    const submit = (e: React.FormEvent) => {
        e.preventDefault()
        put(`/list-ebooks/${ebook.id}`, {
            forceFormData: true,
            preserveScroll: true,
            onSuccess: () => {
                toast.success(
                    `E-Book ${data.judul} berhasil diperbarui`
                )
                router.visit("/list-ebooks")
            },
            onError: () => {
                toast.error(
                    "Gagal memperbarui E-Book"
                )
            },
        })
    }

    const [pdfPreview] = useState<string | null>(
        ebook.file
    )

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

    return (
    <>
        <Head title="Edit E-Book" />
            <div className="p-6 space-y-4">
                <div className="flex justify-between">
                    <Heading
                        variant="small"
                        title="Edit E-Book"
                        description="Perbarui data koleksi e-book."
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
                            <object
                                data={pdfPreview}
                                type="application/pdf"
                                className="h-full w-full"
                            >
                                PDF tidak dapat ditampilkan
                            </object>
                        ) : (
                            <div className="flex h-full w-full items-center justify-center">
                                <p className="text-sm text-muted-foreground">
                                    File PDF tidak tersedia
                                </p>
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
                                <Label className="pb-2">Qty</Label>
                                <Input type="number" min="1" placeholder="1" value={data.qty} onChange={(e) => setData("qty", Number(e.target.value))}/>
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
                                                    <CommandEmpty className="bg-background">
                                                        Tidak ditemukan
                                                    </CommandEmpty>
                                                ) : (
                                                    <CommandGroup className="bg-background">
                                                        {filteredKlasifikasis.map((item) => (
                                                            <CommandItem
                                                                key={item.id}
                                                                value={String(item.id)}
                                                                className="items-start bg-background py-3 data-[selected=true]:bg-muted/70"
                                                                onSelect={() => {
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

    </>
    )
}

EditEbook.layout = {
    breadcrumbs: [
        {
            title: "E-Book",
            href: "/list-ebooks",
        },
        {
            title: "Edit",
            href: "/ebooks/create",
        },
    ],
}
