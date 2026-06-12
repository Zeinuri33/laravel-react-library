"use client"

import { useState } from "react"
import { Head, Link } from "@inertiajs/react"
import { Plus } from "lucide-react"

import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { DataTable } from "@/components/data-table"

import { columns, Titik } from "./columns"

export default function Page({
    titiks,
}: {
    titiks: Titik[]
}) {
    const [openEdit, setOpenEdit] =
        useState(false)

    const [selectedTitik, setSelectedTitik] =
        useState<Titik | null>(null)

    const handleEdit = (titik: Titik) => {
        setSelectedTitik(titik)
        setOpenEdit(true)
    }

    return (
        <>
            <Head title="Titik Baca E-Book" />

            <div className="p-6 space-y-4">
                <div className="flex items-center justify-between">
                    <Heading
                        variant="small"
                        title="Data Titik Baca"
                        description="Daftar lokasi akses e-book."
                    />

                    <Button asChild>
                        <Link href="/titik-ebooks/create">
                            <Plus className="mr-2 h-4 w-4" />
                            Tambah Titik Baca
                        </Link>
                    </Button>
                </div>

                <DataTable
                    columns={columns(handleEdit)}
                    data={titiks}
                />
            </div>
        </>
    )
}

Page.layout = {
    breadcrumbs: [
        {
            title: "Titik Baca",
            href: "/titik-ebooks",
        },
    ],
}
