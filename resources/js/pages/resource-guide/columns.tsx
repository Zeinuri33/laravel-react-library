"use client"

import { router } from "@inertiajs/react"
import type { ColumnDef } from "@tanstack/react-table"
import { GraduationCap, MoreHorizontal } from "lucide-react"

import { toast } from "sonner"

import { DataTableSortHeader } from "@/components/data-table-sort-header"
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
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Checkbox } from "@/components/ui/checkbox"

import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"


// ==============================
// TYPE
// ==============================
export type ResourceGuide = {
    id: number
    created_at: string

    prodi: {
        id: number
        prodi: string
        kode: string

        fakultas: {
            id: number
            fakultas: string
        } | null
    } | null
}

// ==============================
// DELETE
// ==============================
const handleDelete = (item: ResourceGuide) => {
    router.delete(`/resource-guide/${item.id}`, {
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
    onEdit: (item: ResourceGuide) => void
): ColumnDef<ResourceGuide>[] => [
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
    // PRODI
    // ==============================
    {
        id: "prodi",

        accessorFn: (row) => row.prodi?.prodi,

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                Prodi
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <div className="ml-3">
                <div className="font-medium">
                    {row.original.prodi?.prodi ?? "—"}
                </div>

                <div className="text-xs text-muted-foreground">
                    {row.original.prodi?.kode ?? ""}
                </div>
            </div>
        ),
    },

    // ==============================
    // FAKULTAS
    // ==============================
    {
        id: "fakultas",

        accessorFn: (row) => row.prodi?.fakultas?.fakultas,

        header: () => (
            <div className="hidden md:flex">
                Fakultas
            </div>
        ),

        cell: ({ row }) => (
            <div className="hidden md:flex ml-3">
                <Badge
                    variant="secondary"
                    className="gap-1"
                >
                    <GraduationCap className="h-3 w-3" />

                    {row.original.prodi?.fakultas?.fakultas ?? "—"}
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
            <DataTableSortHeader column={column} className="hidden md:flex">
                Dibuat
            </DataTableSortHeader>
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
                                        Hapus Resource Guide
                                    </AlertDialogTitle>

                                    <AlertDialogDescription>
                                        Yakin ingin
                                        menghapus resource guide untuk
                                        prodi{" "}
                                        <b>
                                            {
                                                row.original
                                                    .prodi
                                                    ?.prodi
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
