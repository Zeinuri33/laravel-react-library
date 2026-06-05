"use client"

import { Head } from "@inertiajs/react"
import Heading from "@/components/heading"
import { DataTable } from "@/components/data-table"
import { columns, Usulan } from "./columns"

export default function UsulanList({
    usulans,
}: {
    usulans: Usulan[]
}) {
    return (
        <>
            <Head title="List Usulan" />

            <div className="space-y-4 p-6">

                {/* HEADER */}
                <div className="flex items-center justify-between">
                    <Heading
                        variant="small"
                        title="List Usulan"
                        description="Daftar usulan dan pesan yang masuk dari website."
                    />
                </div>

                {/* TABLE */}
                <DataTable
                    columns={columns()}
                    data={usulans}
                />
            </div>
        </>
    )
}

UsulanList.layout = {
    breadcrumbs: [
        {
            title: "List Usulan",
            href: "/usulan-list",
        },
    ],
}