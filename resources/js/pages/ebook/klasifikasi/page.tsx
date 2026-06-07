"use client"

import { useState } from "react"
import { Head } from "@inertiajs/react"

import Heading from "@/components/heading"
import { DataTable } from "@/components/data-table"

import {
    columns,
    EbookKlasifikasi,
} from "./columns"

import CreateKlasifikasiModal from "./create"
import EditKlasifikasiModal from "./edit"

export default function Page({
    klasifikasis,
}: {
    klasifikasis: EbookKlasifikasi[]
}) {
    const [openEdit, setOpenEdit] =
        useState(false)

    const [selectedData, setSelectedData] =
        useState<EbookKlasifikasi | null>(
            null
        )

    const handleEdit = (
        data: EbookKlasifikasi
    ) => {
        setSelectedData(data)
        setOpenEdit(true)
    }

    return (
        <>
            <Head title="Klasifikasi E-Book" />

            <div className="p-6 space-y-4">
                <div className="flex items-center justify-between">
                    <Heading
                        variant="small"
                        title="Data Klasifikasi E-Book"
                        description="Daftar klasifikasi koleksi e-book."
                    />

                    <CreateKlasifikasiModal />
                </div>

                <DataTable
                    columns={columns(handleEdit)}
                    data={klasifikasis}
                />

                <EditKlasifikasiModal
                    open={openEdit}
                    setOpen={setOpenEdit}
                    dataKlasifikasi={
                        selectedData
                    }
                />
            </div>
        </>
    )
}

Page.layout = {
    breadcrumbs: [
        {
            title: "Klasifikasi E-Book",
            href: "/ebook-klasifikasi",
        },
    ],
}
