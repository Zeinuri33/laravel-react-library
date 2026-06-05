"use client"

import { Head, useForm } from "@inertiajs/react"
import { toast } from "sonner"
import Heading from "@/components/heading"

import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"

import { Button } from "@/components/ui/button"

import { Textarea } from "@/components/ui/textarea"

type Usulan = {
    id: number
    nama: string
    kontak: string
    subjek?: string
    pesan: string
    jawaban?: string
}

export default function JawabUsulan({
    usulan,
}: {
    usulan: Usulan
}) {
    const { data, setData, put, processing, errors } =
        useForm({
            jawaban: "",
        })

    const submit = (e: React.FormEvent) => {
        e.preventDefault()

        put(`/usulan/${usulan.id}/jawab`, {
            preserveScroll: true,

            onSuccess: () => {
                toast.success(
                    "Jawaban berhasil dikirim"
                )
            },

            onError: () => {
                toast.error(
                    "Gagal mengirim jawaban"
                )
            },
        })
    }

    return (
        <>
            <Head title="Jawab Usulan" />

            <div className="space-y-6 p-6">

                <Heading
                    variant="small"
                    title="Jawab Usulan"
                    description="Kirim balasan kepada pengirim usulan."
                />

                <Card>
                    <CardHeader>
                        <CardTitle>
                            Detail Pengirim
                        </CardTitle>
                    </CardHeader>

                    <CardContent className="space-y-4 text-sm">
                        <div>
                            <span className="font-semibold">
                                Nama:
                            </span>{" "}
                            {usulan.nama}
                        </div>

                        <div>
                            <span className="font-semibold">
                                Kontak:
                            </span>{" "}
                            {usulan.kontak}
                        </div>

                        <div>
                            <span className="font-semibold">
                                Subjek:
                            </span>{" "}
                            {usulan.subjek || "-"}
                        </div>

                        <div>
                            <span className="font-semibold">
                                Pesan:
                            </span>

                            <div className="mt-2 rounded-md border p-4 whitespace-pre-wrap">
                                {usulan.pesan}
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader>
                        <CardTitle>
                            Jawaban Admin
                        </CardTitle>
                    </CardHeader>

                    <CardContent>
                        <form
                            onSubmit={submit}
                            className="space-y-4"
                        >
                            <Textarea
                                rows={8}
                                placeholder="Tulis jawaban..."
                                value={data.jawaban}
                                onChange={(e) =>
                                    setData(
                                        "jawaban",
                                        e.target.value
                                    )
                                }
                            />

                            {errors.jawaban && (
                                <p className="text-sm text-red-500">
                                    {errors.jawaban}
                                </p>
                            )}

                            <Button
                                type="submit"
                                disabled={processing}
                            >
                                {processing
                                    ? "Mengirim..."
                                    : "Kirim Jawaban"}
                            </Button>
                        </form>
                    </CardContent>
                </Card>
            </div>
        </>
    )
}

JawabUsulan.layout = {
    breadcrumbs: [
        {
            title: "List Usulan",
            href: "/usulan-list",
        },
        {
            title: "Jawab Usulan",
            href: "#",
        },
    ],
}