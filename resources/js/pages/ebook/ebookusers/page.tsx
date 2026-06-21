"use client"

import { Head, Link } from "@inertiajs/react"
import { Plus } from "lucide-react"

import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { DataTable } from "@/components/data-table"

import { columns, EbookUser } from "./columns"

export default function Page({
    users,
}: {
    users: EbookUser[]
}) {
    return (
        <>
            <Head title="User E-Book" />

            <div className="p-6 space-y-4">
                <div className="flex items-center justify-between">
                    <Heading
                        variant="small"
                        title="Data User E-Book"
                        description="Daftar pengguna yang memiliki akses ke e-book."
                    />

                    <Button asChild>
                        <Link href="/ebook-users/create">
                            <Plus className="mr-2 h-4 w-4" />
                            Tambah User
                        </Link>
                    </Button>
                </div>

                <DataTable
                    columns={columns}
                    data={users}
                />
            </div>
        </>
    )
}

Page.layout = {
    breadcrumbs: [
        {
            title: "User E-Book",
            href: "/ebook-users",
        },
    ],
}
