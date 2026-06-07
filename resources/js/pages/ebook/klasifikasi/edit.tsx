"use client"

import { useEffect } from "react"
import { useForm, router } from "@inertiajs/react"

import {
    Dialog,
    DialogContent,
    DialogHeader,
} from "@/components/ui/dialog"

import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import { Textarea } from "@/components/ui/textarea"

import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"

interface EbookKlasifikasi {
    id: number
    kode: string
    kategori: string | null
    deskripsi: string
}

interface Props {
    open: boolean
    setOpen: (open: boolean) => void
    dataKlasifikasi: EbookKlasifikasi | null
}

export default function EditKlasifikasiModal({
    open,
    setOpen,
    dataKlasifikasi,
}: Props) {
    const {
        data,
        setData,
        processing,
        errors,
        reset,
    } = useForm({
        kode: "",
        kategori: "",
        deskripsi: "",
    })

    useEffect(() => {
        if (dataKlasifikasi && open) {
            setData({
                kode: dataKlasifikasi.kode ?? "",
                kategori:
                    dataKlasifikasi.kategori ??
                    "",
                deskripsi:
                    dataKlasifikasi.deskripsi ??
                    "",
            })
        }
    }, [dataKlasifikasi, open])

    const submit = (
        e: React.FormEvent
    ) => {
        e.preventDefault()

        if (!dataKlasifikasi) return

        router.put(
            `/ebook-klasifikasi/${dataKlasifikasi.id}`,
            data,
            {
                onSuccess: () => {
                    reset()
                    setOpen(false)

                    toast.success(
                        "Klasifikasi berhasil diperbarui"
                    )
                },

                onError: () => {
                    toast.error(
                        "Gagal memperbarui klasifikasi"
                    )
                },
            }
        )
    }

    if (!open || !dataKlasifikasi)
        return null

    return (
        <Dialog
            open={open}
            onOpenChange={setOpen}
        >
            <DialogContent>
                <DialogHeader>
                    <Heading
                        variant="small"
                        title="Edit Klasifikasi"
                        description={`Ubah klasifikasi ${dataKlasifikasi.kode}`}
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
                            value={data.kode}
                            onChange={(e) =>
                                setData(
                                    "kode",
                                    e.target.value
                                )
                            }
                        />

                        {errors.kode && (
                            <p className="text-sm text-red-500">
                                {errors.kode}
                            </p>
                        )}
                    </div>

                    <div>
                        <Label className="pb-2">
                            Kategori
                        </Label>

                        <Input
                            value={
                                data.kategori
                            }
                            onChange={(e) =>
                                setData(
                                    "kategori",
                                    e.target.value
                                )
                            }
                        />

                        {errors.kategori && (
                            <p className="text-sm text-red-500">
                                {
                                    errors.kategori
                                }
                            </p>
                        )}
                    </div>

                    <div>
                        <Label className="pb-2">
                            Deskripsi
                        </Label>

                        <Textarea
                            rows={4}
                            value={
                                data.deskripsi
                            }
                            onChange={(e) =>
                                setData(
                                    "deskripsi",
                                    e.target.value
                                )
                            }
                        />

                        {errors.deskripsi && (
                            <p className="text-sm text-red-500">
                                {
                                    errors.deskripsi
                                }
                            </p>
                        )}
                    </div>

                    <Button
                        type="submit"
                        disabled={
                            processing
                        }
                        className="w-full"
                    >
                        Simpan Perubahan
                    </Button>
                </form>
            </DialogContent>
        </Dialog>
    )
}
