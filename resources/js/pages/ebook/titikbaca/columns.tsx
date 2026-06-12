"use client"

import { ColumnDef } from "@tanstack/react-table"
import {
    ChevronsUpDown,
    MoreHorizontal,
} from "lucide-react"

import { router, Link } from "@inertiajs/react"
import { toast } from "sonner"

import { Button } from "@/components/ui/button"
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

export type Titik = {
    id: number
    nama: string
    latitude: number
    longitude: number
    radius: number
    is_active: boolean
    created_at: string
    updated_at: string
}

const handleDelete = (titik: Titik) => {
    router.delete(`/titik-ebooks/${titik.id}`, {
        onSuccess: () => {
            toast.success(
                "Titik baca berhasil dihapus"
            )
        },
        onError: () => {
            toast.error(
                "Gagal menghapus titik baca"
            )
        },
    })
}

export const columns: ColumnDef<Titik>[] = [
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
        accessorKey: "nama",

        header: ({ column }) => (
            <Button
                variant="ghost"
                onClick={() =>
                    column.toggleSorting(
                        column.getIsSorted() === "asc"
                    )
                }
            >
                Nama Titik
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),
    },

    {
        accessorKey: "latitude",
        header: "Latitude",
    },

    {
        accessorKey: "longitude",
        header: "Longitude",
    },

    {
        accessorKey: "radius",

        header: "Radius (m)",

        cell: ({ row }) => (
            <span>
                {row.original.radius} m
            </span>
        ),
    },

    {
        accessorKey: "is_active",

        header: "Status",

        cell: ({ row }) =>
            row.original.is_active ? (
                <Badge>
                    Aktif
                </Badge>
            ) : (
                <Badge variant="secondary">
                    Tidak Aktif
                </Badge>
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

                        <DropdownMenuItem asChild>
                            <Link
                                href={`/titik-ebooks/${row.original.id}/edit`}
                            >
                                Edit
                            </Link>
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
                                        Hapus Titik Baca
                                    </AlertDialogTitle>

                                    <AlertDialogDescription>
                                        Yakin ingin
                                        menghapus
                                        <b>
                                            {" "}
                                            {row.original.nama}
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