"use client"

import { useState } from "react"
import { router, useForm } from "@inertiajs/react"

import { Plus } from "lucide-react"
import { toast } from "sonner"

import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { Textarea } from "@/components/ui/textarea"

import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTrigger,
} from "@/components/ui/dialog"

export default function CreateKlasifikasiModal() {
    const [open, setOpen] = useState(false)

    const {
        data,
        setData,
        processing,
        reset,
        errors,
    } = useForm({
        kode: "",
        kategori: "",
        deskripsi: "",
    })

    const submit = (e: React.FormEvent) => {
        e.preventDefault()

        router.post(
            "/klasifikasi-ebooks",
            data,
            {
                onSuccess: () => {
                    reset()
                    setOpen(false)

                    toast.success(
                        "Klasifikasi berhasil ditambahkan"
                    )
                },

                onError: () => {
                    toast.error(
                        "Gagal menyimpan klasifikasi"
                    )
                },
            }
        )
    }

    return (
        <Dialog
            open={open}
            onOpenChange={setOpen}
        >
            <DialogTrigger asChild>
                <Button>
                    <Plus className="mr-2 h-4 w-4" />
                    Tambah Klasifikasi
                </Button>
            </DialogTrigger>

            <DialogContent>
                <DialogHeader>
                    <Heading
                        variant="small"
                        title="Tambah Klasifikasi"
                        description="Tambah data klasifikasi e-book."
                    />

                    <Separator />
                </DialogHeader>

                <form
                    onSubmit={submit}
                    className="space-y-4"
                >
                    <div>
                        <Label className="pb-2">
                            Kode
                        </Label>

                        <Input
                            placeholder="Contoh: 000"
                            value={data.kode}
                            onChange={(e) =>
                                setData(
                                    "kode",
                                    e.target.value
                                )
                            }
                        />

                        {errors.kode && (
                            <p className="text-sm text-red-500 mt-1">
                                {errors.kode}
                            </p>
                        )}
                    </div>

                    <div>
                        <Label className="pb-2">
                            Kategori
                        </Label>

                        <Input
                            placeholder="Contoh: Karya Umum"
                            value={data.kategori}
                            onChange={(e) =>
                                setData(
                                    "kategori",
                                    e.target.value
                                )
                            }
                        />

                        {errors.kategori && (
                            <p className="text-sm text-red-500 mt-1">
                                {errors.kategori}
                            </p>
                        )}
                    </div>

                    <div>
                        <Label className="pb-2">
                            Deskripsi
                        </Label>

                        <Textarea
                            placeholder="Masukkan deskripsi klasifikasi..."
                            value={data.deskripsi}
                            onChange={(e) =>
                                setData(
                                    "deskripsi",
                                    e.target.value
                                )
                            }
                        />

                        {errors.deskripsi && (
                            <p className="text-sm text-red-500 mt-1">
                                {errors.deskripsi}
                            </p>
                        )}
                    </div>

                    <Button
                        type="submit"
                        disabled={processing}
                        className="w-full"
                    >
                        Simpan
                    </Button>
                </form>
            </DialogContent>
        </Dialog>
    )
}
