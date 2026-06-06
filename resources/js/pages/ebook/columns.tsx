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
    Avatar,
    AvatarFallback,
    AvatarImage,
} from "@/components/ui/avatar"

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



type Klasifikasi = {
    id: number
    kategori: string
    deskripsi: string
}

export type Ebook = {
    id: number
    cover?: string
    file?: string
    judul: string
    isbn?: string
    eisbn?: string
    tahun_terbit?: number
    penulis?: string
    penerbit?: string
    qty: number
    deskripsi?: string
    created_at: string
    updated_at: string

    klasifikasi?: Klasifikasi | null   // 👈 TAMBAH INI
}

const limitWords = (text?: string, limit = 5) => {
    if (!text) return "-"
    const words = text.split(" ")
    return words.length > limit
        ? words.slice(0, limit).join(" ") + "..."
        : text
}

const handleDelete = (ebook: Ebook) => {
    router.delete(`/list-ebooks/${ebook.id}`, {
        onSuccess: () => {
            toast.success(
                "E-Book berhasil dihapus"
            )
        },

        onError: () => {
            toast.error(
                "Gagal menghapus E-Book"
            )
        },
    })
}

export const columns = (
    onEdit: (ebook: Ebook) => void
): ColumnDef<Ebook>[] => [
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
                E-Book
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        cell: ({ row }) => (
            <div className="ms-3 flex items-center gap-3">
                <Avatar className="h-16 w-12 rounded-sm">
                    <AvatarImage
                        src={
                            row.original.cover
                                ? `/storage/${row.original.cover}`
                                : undefined
                        }
                        alt={row.original.judul}
                    />

                    <AvatarFallback className="rounded-sm text-xs">
                        {row.original.judul?.substring(0, 2).toUpperCase()}
                    </AvatarFallback>
                </Avatar>

                <div className="max-w-[300px]">
                    <div className="font-medium truncate">
                        {row.original.judul}
                    </div>

                    <div className="text-sm text-muted-foreground truncate">
                        {row.original.penulis ||
                            "-"}
                    </div>
                </div>
            </div>
        ),
    },

    {
        accessorKey: "isbn",

        header: ({ column }) => (
            <Button
                variant="ghost"
                className="hidden lg:flex"
                onClick={() =>
                    column.toggleSorting(
                        column.getIsSorted() === "asc"
                    )
                }
            >
                ISBN
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        cell: ({ row }) => (
            <div className="ms-3 hidden lg:block">
                {row.original.isbn || "-"}
            </div>
        ),
    },

    {
        accessorKey: "tahun_terbit",

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
                Tahun
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        cell: ({ row }) => (
            <div className="ms-4 hidden md:block">
                {row.original.tahun_terbit ||
                    "-"}
            </div>
        ),
    },

    {
        accessorFn: (row) => row.klasifikasi?.kategori,
        id: "kategori",

        header: ({ column }) => (
            <Button
                variant="ghost"
                className="hidden md:flex"
                onClick={() =>
                    column.toggleSorting(column.getIsSorted() === "asc")
                }
            >
                Kategori
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        cell: ({ row }) => {
            const kategori = row.original.klasifikasi?.kategori
            const deskripsi = row.original.klasifikasi?.deskripsi

            return (
                <div className="ms-4 hidden md:block space-y-1">
                    {/* BARIS 1 */}
                    <div className="font-medium">
                        {limitWords(kategori, 2)}
                    </div>

                    {/* BARIS 2 */}
                    <div className="text-xs text-muted-foreground">
                        {limitWords(deskripsi, 5)}
                    </div>
                </div>
            )
        },
    },

    {
        accessorKey: "qty",

        header: ({ column }) => (
            <Button
                variant="ghost"
                className="hidden sm:flex"
                onClick={() =>
                    column.toggleSorting(
                        column.getIsSorted() === "asc"
                    )
                }
            >
                Qty
                <ChevronsUpDown className="ml-2 h-4 w-4" />
            </Button>
        ),

        cell: ({ row }) => (
            <div className="ms-4 hidden sm:block">
                <Badge>
                    {row.original.qty}
                </Badge>
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

                        <DropdownMenuItem asChild>
                            <Link href={`/list-ebooks/${row.original.id}/edit`}>
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
                                        Hapus
                                        E-Book
                                    </AlertDialogTitle>

                                    <AlertDialogDescription>
                                        Yakin ingin
                                        menghapus
                                        <b>
                                            {" "}
                                            {
                                                row
                                                    .original
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
