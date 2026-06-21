"use client"

import { ColumnDef } from "@tanstack/react-table"
import {
    MoreHorizontal,
} from "lucide-react"

import { router, Link } from "@inertiajs/react"
import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import { DataTableSortHeader } from "@/components/data-table-sort-header"
import { Checkbox } from "@/components/ui/checkbox"

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

export interface EbookKlasifikasi {
    id: number
    kode: string
    kategori: string | null
    deskripsi: string
    created_at: string
    updated_at: string
}

const handleDelete = (
    klasifikasi: EbookKlasifikasi
) => {
    router.delete(
        `/klasifikasi-ebooks/${klasifikasi.id}`,
        {
            onSuccess: () => {
                toast.success(
                    "Klasifikasi berhasil dihapus"
                )
            },

            onError: () => {
                toast.error(
                    "Gagal menghapus klasifikasi"
                )
            },
        }
    )
}

export const columns = (
    onEdit: (
        klasifikasi: EbookKlasifikasi
    ) => void
): ColumnDef<EbookKlasifikasi>[] => [
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
                    table.toggleAllPageRowsSelected(
                        !!value
                    )
                }
            />
        ),

        cell: ({ row }) => (
            <Checkbox
                checked={row.getIsSelected()}
                onCheckedChange={(value) =>
                    row.toggleSelected(!!value)
                }
            />
        ),

        enableSorting: false,
        enableHiding: false,
    },

    {
        accessorKey: "kode",

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                Kode
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ms-3">
                {row.original.kode ?? "-"}
            </div>
        ),
    },

    {
        accessorKey: "kategori",

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                Kategori
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ms-3">
                {row.original.kategori ?? "-"}
            </div>
        ),
    },

    {
        accessorKey: "deskripsi",

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                Deskripsi
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ms-3 max-w-md truncate">
                {row.original.deskripsi}
            </div>
        ),
    },

    {
        id: "opsi",

        cell: ({ row }) => (
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

                        <DropdownMenuItem
                            onClick={() =>
                                onEdit(
                                    row.original
                                )
                            }
                        >
                            Edit
                        </DropdownMenuItem>

                        <AlertDialog>
                            <AlertDialogTrigger
                                asChild
                            >
                                <DropdownMenuItem
                                    onSelect={(
                                        e
                                    ) =>
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
                                        Hapus
                                        Klasifikasi
                                    </AlertDialogTitle>

                                    <AlertDialogDescription>
                                        Yakin ingin
                                        menghapus
                                        klasifikasi
                                        <b>
                                            {" "}
                                            {
                                                row
                                                    .original
                                                    .kode
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
        ),
    },
]
