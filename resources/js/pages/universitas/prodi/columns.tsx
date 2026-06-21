"use client"

import { ColumnDef } from "@tanstack/react-table"
import { MoreHorizontal } from "lucide-react"

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

import { router } from "@inertiajs/react"
import { toast } from "sonner"

// ==============================
// TYPE
// ==============================
export type Prodi = {
  id: number
  prodi: string
  kode: string
  fakultas: {
    id: number
    fakultas: string
  }
  kontak: string
  created_at: string
  updated_at: string
}

// ==============================
// DELETE
// ==============================
const handleDelete = (prodi: Prodi) => {
  router.delete(`/prodi/${prodi.id}`, {
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
        toast(flash.error, { description: now })
        return
      }

      if (flash?.success) {
        toast(flash.success, { description: now })
      }
    },
  })
}

// ==============================
// COLUMNS
// ==============================
export const columns = (
  onEdit: (prodi: Prodi) => void
): ColumnDef<Prodi>[] => [
  {
    id: "select",
    header: ({ table }) => (
      <Checkbox
        checked={
          table.getIsAllPageRowsSelected() ||
          (table.getIsSomePageRowsSelected() && "indeterminate")
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
    accessorKey: "prodi",
    header: ({ column }) => (
      <DataTableSortHeader column={column}>
        Nama Prodi
      </DataTableSortHeader>
    ),
    cell: ({ row }) => (
      <div className="ml-3 font-medium">
        {row.getValue("prodi")}
      </div>
    ),
  },

  // ==============================
  // KODE
  // ==============================
  {
    accessorKey: "kode",
    header: ({ column }) => (
      <DataTableSortHeader column={column}>
        Kode
      </DataTableSortHeader>
    ),
    cell: ({ row }) => (
      <div className="ml-3">
        {row.getValue("kode")}
      </div>
    ),
  },

  {
    id: "fakultas",
    accessorFn: (row) => row.fakultas?.fakultas ?? "-",
    header: ({ column }) => (
      <DataTableSortHeader column={column}>
        Fakultas
      </DataTableSortHeader>
    ),
    cell: ({ row }) => {
      const namaFakultas =
        row.original.fakultas?.fakultas ?? "-"

      const getColor = (fakultas: string) => {
        switch (fakultas) {
          case "Ilmu Kesehatan":
            return "bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-300"

          case "Sosial dan Humaniora":
            return "bg-red-100 text-red-700 dark:bg-red-900/50 dark:text-red-300"

          case "Sains dan Teknologi":
            return "bg-blue-100 text-blue-700 dark:bg-blue-900/50 dark:text-blue-300"

          case "Tarbiyah":
            return "bg-yellow-100 text-yellow-700 dark:bg-yellow-900/50 dark:text-yellow-300"

          case "Dakwah dan Ushuluddin":
            return "bg-teal-100 text-teal-700 dark:bg-teal-900/50 dark:text-teal-300"

          case "Syariah dan Ekonomi Islam":
            return "bg-green-100 text-green-700 dark:bg-green-900/50 dark:text-green-300"

          default:
            return "bg-muted text-muted-foreground"
        }
      }

      return (
        <div className="ml-3">
          <span
            className={`px-3 py-1 rounded-full text-xs font-semibold ${getColor(
              namaFakultas
            )}`}
          >
            {namaFakultas}
          </span>
        </div>
      )
    },
  },

  // ==============================
  // KONTAK
  // ==============================
  {
    accessorKey: "kontak",
    header: "Kontak",
    cell: ({ row }) => (
      <div>
        {row.getValue("kontak")}
      </div>
    ),
  },


  // ==============================
  // ACTION
  // ==============================
  {
    id: "actions",
    cell: ({ row }) => (
      <div className="flex justify-end">
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="ghost" className="h-8 w-8 p-0">
              <MoreHorizontal className="h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>

          <DropdownMenuContent align="end">
            <DropdownMenuLabel>Opsi</DropdownMenuLabel>
            <DropdownMenuSeparator />

            <DropdownMenuItem
              onClick={() => onEdit(row.original)}
            >
              Edit
            </DropdownMenuItem>

            <AlertDialog>
              <AlertDialogTrigger asChild>
                <DropdownMenuItem
                  onSelect={(e) => e.preventDefault()}
                  className="text-red-500"
                >
                  Hapus
                </DropdownMenuItem>
              </AlertDialogTrigger>

              <AlertDialogContent size="sm">
                <AlertDialogHeader>
                  <AlertDialogTitle>
                    Hapus Prodi
                  </AlertDialogTitle>
                  <AlertDialogDescription>
                    Yakin ingin menghapus prodi{" "}
                    <b>{row.original.prodi}</b>?
                  </AlertDialogDescription>
                </AlertDialogHeader>

                <AlertDialogFooter>
                  <AlertDialogCancel>Batal</AlertDialogCancel>
                  <AlertDialogAction
                    onClick={() => handleDelete(row.original)}
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