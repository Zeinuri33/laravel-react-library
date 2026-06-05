"use client"

import { ColumnDef } from "@tanstack/react-table"
import { ChevronsUpDown, MoreHorizontal } from "lucide-react"

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
// TYPE MAHASISWA
// ==============================
export type Mahasiswa = {
  id: number
  lulusan: string
  nim: string
  nama: string
  jk: string
  kecamatan: string | null
  kabupaten: string | null
  provinsi: string | null
  prodi: {
    id: number
    prodi: string
    fakultas?: {
      id: number
      fakultas: string
    }
  }
  created_at: string
  updated_at: string
}

// ==============================
// DELETE
// ==============================
const handleDelete = (mahasiswa: Mahasiswa) => {
  router.delete(`/mahasiswa/${mahasiswa.id}`, {
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
// COLUMNS MAHASISWA
// ==============================
export const columns = (
  onEdit: (mahasiswa: Mahasiswa) => void
): ColumnDef<Mahasiswa>[] => [
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
  // NAMA
  // ==============================
  {
    accessorKey: "nama",
    header: ({ column }) => (
      <Button
        variant="ghost"
        onClick={() =>
          column.toggleSorting(column.getIsSorted() === "asc")
        }
      >
        Nama
        <ChevronsUpDown />
      </Button>
    ),
    cell: ({ row }) => (
      <div className="ml-3 font-medium">
        {row.getValue("nama")}
      </div>
    ),
  },

  // ==============================
  // NIM
  // ==============================
  {
    accessorKey: "nim",
    header: "NIM",
    cell: ({ row }) => (
      <div>{row.getValue("nim")}</div>
    ),
  },

  // ==============================
  // JENIS KELAMIN
  // ==============================
  {
    accessorKey: "jk",
    header: "JK",
    cell: ({ row }) => (
      <div>{row.getValue("jk")}</div>
    ),
  },

  // ==============================
  // LULUSAN
  // ==============================
  {
    accessorKey: "lulusan",
    header: "Lulusan",
    cell: ({ row }) => (
      <div>{row.getValue("lulusan")}</div>
    ),
  },

  // ==============================
  // PRODI
  // ==============================
  {
    id: "prodi",
    accessorFn: (row) => row.prodi?.prodi,
    header: ({ column }) => (
      <Button
        variant="ghost"
        onClick={() =>
          column.toggleSorting(column.getIsSorted() === "asc")
        }
      >
        Prodi
        <ChevronsUpDown />
      </Button>
    ),
    cell: ({ row }) => (
      <div className="ml-3">
        {row.original.prodi?.prodi}
      </div>
    ),
  },

  {
  id: "fakultas",
    accessorFn: (row) => row.prodi?.fakultas?.fakultas ?? "-",
    header: ({ column }) => (
      <Button
        variant="ghost"
        onClick={() =>
          column.toggleSorting(column.getIsSorted() === "asc")
        }
      >
        Fakultas
        <ChevronsUpDown />
      </Button>
    ),
    cell: ({ row }) => {
      const namaFakultas =
        row.original.prodi?.fakultas?.fakultas ?? "-"

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
  // ALAMAT
  // ==============================
  {
    id: "alamat",
    header: "Alamat",
    cell: ({ row }) => {
      const m = row.original
      return (
        <div>
          {[m.kecamatan, m.kabupaten, m.provinsi]
            .filter(Boolean)
            .join(", ") || "-"}
        </div>
      )
    },
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
                    Hapus Mahasiswa
                  </AlertDialogTitle>
                  <AlertDialogDescription>
                    Yakin ingin menghapus mahasiswa{" "}
                    <b>{row.original.nama}</b>?
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