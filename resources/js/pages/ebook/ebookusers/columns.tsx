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

export type EbookUser = {
    id: number
    nama: string
    email: string | null
    google_id: string | null
    id_anggota: string | null
    prodi: string | null
    fakultas: string | null
    jenis_login: "google" | "opac"
    foto: string | null
    is_active: boolean
    last_login_at: string | null
    created_at: string
    updated_at: string
}

const handleDelete = (user: EbookUser) => {
    router.delete(`/ebook-users/${user.id}`, {
        onSuccess: () => {
            toast.success("User ebook berhasil dihapus")
        },
        onError: () => {
            toast.error("Gagal menghapus user ebook")
        },
    })
}

export const columns: ColumnDef<EbookUser>[] = [
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
            <DataTableSortHeader column={column}>
                Nama
            </DataTableSortHeader>
        ),
        cell: ({ row }) => (
            <div className="ms-3 font-medium">
                {row.original.nama}
            </div>
        ),
    },

    {
        accessorKey: "email",
        header: "Email",
        cell: ({ row }) => (
            <span className="text-muted-foreground">
                {row.original.email || "—"}
            </span>
        ),
    },

    {
        accessorKey: "id_anggota",

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                ID Anggota
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <span className="font-mono text-xs">
                {row.original.id_anggota || "—"}
            </span>
        ),
    },

    {
        accessorKey: "prodi",
        header: "Prodi",
        cell: ({ row }) => (
            <span className="text-muted-foreground">
                {row.original.prodi || "—"}
            </span>
        ),
    },

    {
        accessorKey: "fakultas",
        header: "Fakultas",
        cell: ({ row }) => (
            <span className="text-muted-foreground">
                {row.original.fakultas || "—"}
            </span>
        ),
    },

    {
        accessorKey: "jenis_login",

        header: "Jenis Login",

        cell: ({ row }) => (
            <Badge
                variant={
                    row.original.jenis_login === "google"
                        ? "default"
                        : "secondary"
                }
            >
                {row.original.jenis_login === "google"
                    ? "Google"
                    : "OPAC"}
            </Badge>
        ),
    },

    {
        accessorKey: "is_active",

        header: "Status",

        cell: ({ row }) =>
            row.original.is_active ? (
                <Badge variant="default">
                    Aktif
                </Badge>
            ) : (
                <Badge variant="secondary">
                    Tidak Aktif
                </Badge>
            ),
    },

    {
        accessorKey: "last_login_at",

        header: ({ column }) => (
            <DataTableSortHeader column={column}>
                Terakhir Login
            </DataTableSortHeader>
        ),

        cell: ({ row }) => (
            <span className="text-xs text-muted-foreground">
                {row.original.last_login_at
                    ? new Date(
                          row.original.last_login_at
                      ).toLocaleDateString("id-ID", {
                          day: "numeric",
                          month: "short",
                          year: "numeric",
                          hour: "2-digit",
                          minute: "2-digit",
                      })
                    : "—"}
            </span>
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
                                href={`/ebook-users/${row.original.id}/edit`}
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
                                        Hapus User Ebook
                                    </AlertDialogTitle>

                                    <AlertDialogDescription>
                                        Yakin ingin menghapus
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
