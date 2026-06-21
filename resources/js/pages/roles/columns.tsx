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
import { Badge } from "@/components/ui/badge"

// ==============================
// TYPE
// ==============================
export type Role = {
  id: number
  name: string
  permissions: { name: string }[]
  created_at: string
  updated_at: string
}

// ==============================
// DELETE
// ==============================
const handleDelete = (role: Role) => {
  router.delete(`/roles/${role.id}`, {
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
export const columns = (onEdit: (role: Role) => void): ColumnDef<Role>[] => [
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
  // ROLE NAME
  // ==============================
  {
    accessorKey: "name",
    header: ({ column }) => (
      <DataTableSortHeader column={column}>
        Nama Role
      </DataTableSortHeader>
    ),
    cell: ({ row }) => (
      <div className="ml-3 font-medium">
        {row.getValue("name")}
      </div>
    ),
  },

  // ==============================
  // PERMISSIONS
  // ==============================
  {
  id: "permissions",
    accessorFn: (row) =>
      row.permissions?.map((p) => p.name).join(", "),
    header: () => (
      <div className="hidden md:flex">Permissions</div>
    ),
    cell: ({ row }) => {
      const permissions = row.original.permissions || []

      // 🔥 ambil 5 terakhir (anggap terbaru di belakang)
      const latest = permissions.slice(-5)
      const remaining = permissions.length - latest.length

      return (
        <div className="hidden md:flex flex-wrap gap-1">
          {permissions.length > 0 ? (
            <>
              {latest.map((p, i) => (
                <Badge key={i} variant="secondary">
                  {p.name}
                </Badge>
              ))}

              {remaining > 0 && (
                <Badge variant="outline">
                  +{remaining} lainnya
                </Badge>
              )}
            </>
          ) : (
            <span className="text-muted-foreground text-sm">
              -
            </span>
          )}
        </div>
      )
    },
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
      const a = new Date(rowA.getValue("created_at")).getTime()
      const b = new Date(rowB.getValue("created_at")).getTime()
      return a - b
    },

    cell: ({ row }) => {
      const date = new Date(row.getValue("created_at"))

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
  // UPDATED
  // ==============================
  {
  accessorKey: "updated_at",

    header: ({ column }) => (
      <DataTableSortHeader column={column} className="hidden md:flex">
        Diperbarui
      </DataTableSortHeader>
    ),

    sortingFn: (rowA, rowB) => {
      const a = new Date(rowA.getValue("updated_at")).getTime()
      const b = new Date(rowB.getValue("updated_at")).getTime()
      return a - b
    },

    cell: ({ row }) => {
      const date = new Date(row.getValue("updated_at"))

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
                    Hapus Role
                  </AlertDialogTitle>
                  <AlertDialogDescription>
                    Yakin ingin menghapus role{" "}
                    <b>{row.original.name}</b>?
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