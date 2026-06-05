"use client"

import { Head } from "@inertiajs/react"

import Heading from "@/components/heading"

import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"

import { Badge } from "@/components/ui/badge"

type Usulan = {
    id: number
    nama: string
    kontak: string
    subjek?: string
    pesan: string
    jawaban?: string
    created_at: string
}

export default function DetailUsulan({
    usulan,
}: {
    usulan: Usulan
}) {
    return (
        <>
            <Head title="Detail Usulan" />

            <div className="space-y-6 p-6">

                <Heading
                    variant="small"
                    title="Detail Usulan"
                    description="Informasi lengkap usulan dari pengunjung website."
                />

                <Card>
                    <CardHeader className="flex flex-row items-center justify-between">
                        <CardTitle>
                            Informasi Pengirim
                        </CardTitle>

                        <Badge
                            variant={
                                usulan.jawaban
                                    ? "default"
                                    : "outline"
                            }
                        >
                            {usulan.jawaban
                                ? "Sudah Dijawab"
                                : "Belum Dijawab"}
                        </Badge>
                    </CardHeader>

                    <CardContent className="space-y-5">

                        <div className="grid gap-5 md:grid-cols-2">

                            <div className="space-y-1">
                                <p className="text-sm text-muted-foreground">
                                    Nama Pengirim
                                </p>

                                <p className="font-medium">
                                    {usulan.nama}
                                </p>
                            </div>

                            <div className="space-y-1">
                                <p className="text-sm text-muted-foreground">
                                    Kontak WhatsApp
                                </p>

                                <p className="font-medium">
                                    {usulan.kontak}
                                </p>
                            </div>

                            <div className="space-y-1">
                                <p className="text-sm text-muted-foreground">
                                    Subjek
                                </p>

                                <p className="font-medium">
                                    {usulan.subjek || "-"}
                                </p>
                            </div>

                            <div className="space-y-1">
                                <p className="text-sm text-muted-foreground">
                                    Waktu Pengiriman
                                </p>

                                <p className="font-medium">
                                    {new Date(
                                        usulan.created_at
                                    ).toLocaleString(
                                        "id-ID",
                                        {
                                            day: "2-digit",
                                            month: "long",
                                            year: "numeric",
                                            hour: "2-digit",
                                            minute: "2-digit",
                                        }
                                    )}{" "}
                                    WIB
                                </p>
                            </div>
                        </div>

                        <div className="space-y-2">
                            <p className="text-sm text-muted-foreground">
                                Isi Pesan
                            </p>

                            <div className="rounded-xl border bg-muted/30 p-4 whitespace-pre-wrap leading-relaxed">
                                {usulan.pesan}
                            </div>
                        </div>

                        {usulan.jawaban && (
                            <div className="space-y-2">
                                <p className="text-sm text-muted-foreground">
                                    Jawaban Admin
                                </p>

                                <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-4 whitespace-pre-wrap leading-relaxed dark:border-emerald-900 dark:bg-emerald-950/30">
                                    {usulan.jawaban}
                                </div>
                            </div>
                        )}
                    </CardContent>
                </Card>
            </div>
        </>
    )
}

DetailUsulan.layout = {
    breadcrumbs: [
        {
            title: "List Usulan",
            href: "/usulan-list",
        },
        {
            title: "Detail Usulan",
            href: "#",
        },
    ],
}