"use client"

import { ColumnDef } from "@tanstack/react-table"
import {
    ChevronsUpDown,
    Folder,
    MoreHorizontal,
} from "lucide-react"

import { router } from "@inertiajs/react"
import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
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

// ==============================
// TYPE
// ==============================
export type Kategori = {
    id: number
    kategori: string
}

export type Dokumentasi = {
    id: number
    judul: string
    created_at: string

    kategori: Kategori
}

// ==============================
// DELETE
// ==============================
const handleDelete = (item: Dokumentasi) => {
    router.delete(`/dokumentasi/${item.id}`, {
        onSuccess: (page) => {
            const flash = page.props.flash as any

            const now =
                new Date().toLocaleString("id-ID", {
                    weekday: "long",
                    year: "numeric",
                    month: "long",
                    day: "numeric",
                }) +
                " pukul " +
                new Date().toLocaleTimeString("id-ID", {
                    hour: "2-digit",
                    minute: "2-digit",
                })

            if (flash?.error) {
                toast(flash.error, {
                    description: now,
                })
                return
            }

            if (flash?.success) {
                toast(flash.success, {
                    description: now,
                })
            }
        },
    })
}

// ==============================
// COLUMNS
// ==============================
export const columns = (
    onEdit: (item: Dokumentasi) => void
): ColumnDef<Dokumentasi>[] => [
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

    // ==============================
    // JUDUL
    // ==============================
    {
        accessorKey: "judul",

        header: ({ column }) => (
            <Button
                variant="ghost"
                onClick={() =>
                    column.toggleSorting(
                        column.getIsSorted() === "asc"
                    )
                }
            >
                Judul
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        cell: ({ row }) => (
            <div className="ml-3 font-medium">
                {row.getValue("judul")}
            </div>
        ),
    },

    // ==============================
    // KATEGORI
    // ==============================
    {
        id: "kategori",

        accessorFn: (row) => row.kategori?.kategori,

        header: () => (
            <div className="hidden md:flex">
                Kategori
            </div>
        ),

        cell: ({ row }) => (
            <div className="hidden md:flex ml-3">
                <Badge
                    variant="secondary"
                    className="gap-1"
                >
                    <Folder className="h-3 w-3" />

                    {row.original.kategori?.kategori}
                </Badge>
            </div>
        ),
    },

    // ==============================
    // CREATED
    // ==============================
    {
        accessorKey: "created_at",

        header: ({ column }) => (
            <Button
                variant="ghost"
                className="hidden md:flex"
                onClick={() =>
                    column.toggleSorting(
                        column.getIsSorted() === "asc"
                    )
                }
            >
                Dibuat
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        sortingFn: (rowA, rowB) => {
            const a = new Date(
                rowA.getValue("created_at")
            ).getTime()

            const b = new Date(
                rowB.getValue("created_at")
            ).getTime()

            return a - b
        },

        cell: ({ row }) => {
            const date = new Date(
                row.getValue("created_at")
            )

            return (
                <div className="ml-3 text-sm hidden md:block">
                    {date.toLocaleDateString("id-ID", {
                        day: "2-digit",
                        month: "short",
                        year: "numeric",
                    })}
                </div>
            )
        },
    },

    // ==============================
    // ACTIONS
    // ==============================
    {
        id: "actions",

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
                                onEdit(row.original)
                            }
                        >
                            Edit
                        </DropdownMenuItem>

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
                                        Hapus Dokumentasi
                                    </AlertDialogTitle>

                                    <AlertDialogDescription>
                                        Yakin ingin
                                        menghapus dokumentasi{" "}
                                        <b>
                                            {
                                                row.original
                                                    .judul
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