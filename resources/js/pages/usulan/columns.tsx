"use client"

import { ColumnDef } from "@tanstack/react-table"

import {
    MoreHorizontal,
} from "lucide-react"

import { router } from "@inertiajs/react"

import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import { DataTableSortHeader } from "@/components/data-table-sort-header"

import { Checkbox } from "@/components/ui/checkbox"

import { Badge } from "@/components/ui/badge"

import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
    AlertDialogTrigger,
} from "@/components/ui/alert-dialog"

export type Usulan = {
    id: number
    nama: string
    kontak: string
    subjek?: string
    pesan: string
    jawaban?: string
    created_at: string
    updated_at: string
}

const handleDelete = (usulan: Usulan) => {
    router.delete(`/usulan/${usulan.id}`, {
        onSuccess: () => {
            toast.success("Usulan berhasil dihapus")
        },

        onError: () => {
            toast.error("Gagal menghapus usulan")
        },
    })
}

export const columns = (): ColumnDef<Usulan>[] => [
    {
        id: "select",

        header: ({ table }) => (
            <Checkbox
                checked={
                    table.getIsAllPageRowsSelected() ||
                    (table.getIsSomePageRowsSelected() &&
                        "indeterminate")
                }
                onCheckedChange={(value) =>
                    table.toggleAllPageRowsSelected(!!value)
                }
                aria-label="Select all"
            />
        ),

        cell: ({ row }) => (
            <Checkbox
                checked={row.getIsSelected()}
                onCheckedChange={(value) =>
                    row.toggleSelected(!!value)
                }
                aria-label="Select row"
            />
        ),

        enableSorting: false,
        enableHiding: false,
    },

    {
        accessorKey: "nama",

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                Nama
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ml-3 font-medium">
                {row.original.nama}
            </div>
        ),
    },

    {
        accessorKey: "kontak",

        header: ({ column }) => (
            <DataTableSortHeader column={column} className="hidden md:flex">
                Kontak
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ml-3 hidden md:block">
                <Badge variant="secondary">
                    {row.original.kontak}
                </Badge>
            </div>
        ),
    },

    {
        accessorKey: "subjek",

        header: ({ column }) => (
            <DataTableSortHeader column={column} className="hidden lg:flex">
                Subjek
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ml-3 hidden lg:block max-w-[220px] truncate">
                {row.original.subjek || "-"}
            </div>
        ),
    },

    {
        accessorKey: "jawaban",

        header: ({ column }) => (
            <DataTableSortHeader column={column} className="hidden md:flex">
                Status
            </DataTableSortHeader>
        ),

        cell: ({ row }) => {
            const sudahDijawab = !!row.original.jawaban

            return (
                <div className="ml-3 hidden md:block">
                    <Badge
                        variant={
                            sudahDijawab
                                ? "default"
                                : "outline"
                        }
                    >
                        {sudahDijawab
                            ? "Sudah Dijawab"
                            : "Belum Dijawab"}
                    </Badge>
                </div>
            )
        },
    },

    {
        accessorKey: "created_at",

        header: ({ column }) => (
            <DataTableSortHeader column={column} className="hidden md:flex">
                Masuk
            </DataTableSortHeader>
        ),

        cell: ({ row }) => {
            const date = new Date(
                row.original.created_at
            )

            return (
                <div className="ml-3 hidden md:block text-sm">
                    {date.toLocaleString("id-ID", {
                        day: "2-digit",
                        month: "short",
                        year: "numeric",
                    })}
                </div>
            )
        },
    },

    {
        id: "opsi",

        cell: ({ row }) => {
            const sudahDijawab = !!row.original.jawaban

            return (
                <div className="flex justify-end">
                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <Button
                                variant="ghost"
                                className="h-8 w-8 p-0"
                            >
                                <MoreHorizontal className="h-4 w-4" />
                            </Button>
                        </DropdownMenuTrigger>

                        <DropdownMenuContent align="end">
                            <DropdownMenuLabel>
                                Opsi
                            </DropdownMenuLabel>

                            <DropdownMenuSeparator />

                            {/* DETAIL */}
                            <DropdownMenuItem
                                onClick={() =>
                                    router.visit(
                                        `/usulan/${row.original.id}/detail`
                                    )
                                }
                            >
                                Detail
                            </DropdownMenuItem>

                            {/* JAWAB */}
                            {!sudahDijawab && (
                                <DropdownMenuItem
                                    onClick={() =>
                                        router.visit(
                                            `/usulan/${row.original.id}/jawab`
                                        )
                                    }
                                >
                                    Jawab
                                </DropdownMenuItem>
                            )}

                            <AlertDialog>
                                <AlertDialogTrigger asChild>
                                    <DropdownMenuItem
                                        onSelect={(e) =>
                                            e.preventDefault()
                                        }
                                        className="text-red-500"
                                    >
                                        Hapus
                                    </DropdownMenuItem>
                                </AlertDialogTrigger>

                                <AlertDialogContent size="sm">
                                    <AlertDialogHeader>
                                        <AlertDialogTitle>
                                            Hapus Usulan
                                        </AlertDialogTitle>

                                        <AlertDialogDescription>
                                            Yakin ingin menghapus
                                            usulan dari{" "}
                                            <b>
                                                {
                                                    row.original
                                                        .nama
                                                }
                                            </b>
                                            ?
                                        </AlertDialogDescription>
                                    </AlertDialogHeader>

                                    <AlertDialogFooter>
                                        <AlertDialogCancel>
                                            Batal
                                        </AlertDialogCancel>

                                        <AlertDialogAction
                                            onClick={() =>
                                                handleDelete(
                                                    row.original
                                                )
                                            }
                                        >
                                            Hapus
                                        </AlertDialogAction>
                                    </AlertDialogFooter>
                                </AlertDialogContent>
                            </AlertDialog>
                        </DropdownMenuContent>
                    </DropdownMenu>
                </div>
            )
        },
    },
]