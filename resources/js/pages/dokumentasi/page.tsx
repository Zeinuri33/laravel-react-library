"use client"

import { useState } from "react"

import { Head, router } from "@inertiajs/react"

import Heading from "@/components/heading"
import { DataTable } from "@/components/data-table"

import {
    columns,
    Dokumentasi,
} from "./columns"

import { Button } from "@/components/ui/button"

import { BookCopy, Plus } from "lucide-react"

interface Props {
    dokumentasi: Dokumentasi[]
}

export default function DokumentasiPage({
    dokumentasi,
}: Props) {

    const [selected, setSelected] =
        useState<Dokumentasi | null>(null)

    const handleEdit = (
        item: Dokumentasi
    ) => {
        setSelected(item)

        router.visit(
            `/dokumentasi/${item.id}/edit`
        )
    }

    return (
        <>
            <Head title="Dokumentasi" />

            <div className="p-6 space-y-4">

                {/* Header */}
                <div className="flex items-center justify-between">

                    <Heading
                        variant="small"
                        title="Dokumentasi Layanan"
                        description="Daftar dokumentasi layanan."
                    />

                    <Button
                        onClick={() =>
                            router.visit(
                                "/dokumentasi/create"
                            )
                        }
                        className="gap-2"
                    >
                        <Plus className="h-4 w-4" />

                        Tambah Dokumentasi
                    </Button>
                </div>

                {/* Table */}
                <DataTable
                    columns={columns(handleEdit)}
                    data={dokumentasi}
                />
            </div>
        </>
    )
}

DokumentasiPage.layout = {
    breadcrumbs: [
        {
            title: "Dokumentasi",
            href: "/dokumentasi",
        },
    ],
}