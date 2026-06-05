"use client"

import { useState, useEffect, useRef  } from "react"
import axios from "axios"
import { Head, router, useForm, Link } from "@inertiajs/react"
import {Upload,FileText,X,} from "lucide-react"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Separator } from "@/components/ui/separator"
import { toast } from "sonner"
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle,
} from "@/components/ui/alert-dialog"
interface Ebook {
    id: number
    judul: string
    isbn: string
    eisbn: string
    tahun_terbit: string
    penulis: string
    penerbit: string
    kategori: string
    qty: number
    deskripsi: string
    file: string | null
    cover: string | null
    file_path: string
    cover_path: string
}

export default function EditEbook({
    ebook,
}: {
    ebook: Ebook
}) {

    const [preview, setPreview] =
        useState<string | null>(ebook.cover)

    const [extracting, setExtracting] =
        useState(false)


    const {
        data,
        setData,
        post,
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
        kategori: ebook.kategori ?? "",
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
    const handleSuccess = () => {
        toast.success(
            `E-Book ${data.judul} berhasil ditambahkan`
        )
        router.visit("/list-ebooks")
    }

    const [pdfPreview] = useState<string | null>(
        ebook.file
    )

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
                                <Label className="pb-2">Kategori</Label>
                                <Input placeholder="Pendidikan, Agama, Teknologi, dll" value={data.kategori} onChange={(e) => setData("kategori", e.target.value)}/>
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
