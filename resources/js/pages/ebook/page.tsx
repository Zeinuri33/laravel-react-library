"use client"

import { useState } from "react"
import { Head, Link } from "@inertiajs/react"
import { Plus } from "lucide-react"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { DataTable } from "@/components/data-table"
import { columns, Ebook } from "./columns"
import EditEbookModal from "./edit"

export default function Page({
    ebooks,
}: {
    ebooks: Ebook[]
}) {
    const [openEdit, setOpenEdit] =
        useState(false)

    const [selectedEbook, setSelectedEbook] =
        useState<Ebook | null>(null)

    const handleEdit = (ebook: Ebook) => {
        setSelectedEbook(ebook)
        setOpenEdit(true)
    }

    return (
        <>
            <Head title="E-Book" />

            <div className="p-6 space-y-4">
                <div className="flex items-center justify-between">
                    <Heading
                        variant="small"
                        title="Data E-Book"
                        description="Daftar koleksi e-book perpustakaan."
                    />

                    <Button asChild>
                        <Link href="/list-ebooks/create">
                            <Plus className="mr-2 h-4 w-4" />
                            Tambah E-Book
                        </Link>
                    </Button>
                </div>

                <DataTable
                    columns={columns(handleEdit)}
                    data={ebooks}
                />
            </div>
        </>
    )
}

Page.layout = {
    breadcrumbs: [
        {
            title: "E-Book",
            href: "/ebooks",
        },
    ],
}
