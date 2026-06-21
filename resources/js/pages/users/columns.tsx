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

// This type is used to define the shape of our data.
// You can use a Zod schema here if you want.
export type User = {
  id: string
  name: string
  username: string
  email: string
  avatar_url?: string
  role?: string //  tambah ini (kalau pakai mapping backend)
  roles?: { name: string }[] //  alternatif kalau pakai with('roles')
}

import { router } from "@inertiajs/react"
import { toast } from "sonner"
import { Badge } from "@/components/ui/badge"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"


const handleDelete = (user: any) => {
  router.delete(`/users/${user.id}`, {
    onSuccess: () => {
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

      toast(`User ${user.name} berhasil dihapus`, {
        description: now,
      })
    },
    onError: () => {
      toast("Gagal menghapus user", {
        description: "Terjadi kesalahan.",
      })
    },
  })
}


export const columns = (onEdit: (user: User) => void): ColumnDef<User>[] => [
  {
    id: "select",
    header: ({ table }) => (
      <Checkbox
        checked={
          table.getIsAllPageRowsSelected() ||
          (table.getIsSomePageRowsSelected() && "indeterminate")
        }
        onCheckedChange={(value) => table.toggleAllPageRowsSelected(!!value)}
        aria-label="Select all"
      />
    ),
    cell: ({ row }) => (
      <Checkbox
        checked={row.getIsSelected()}
        onCheckedChange={(value) => row.toggleSelected(!!value)}
        aria-label="Select row"
      />
    ),
    enableSorting: false,
    enableHiding: false,
  },
  {
  id: "pengguna",
    header: ({ column }) => (
      <DataTableSortHeader column={column}>
        Pengguna
      </DataTableSortHeader>
    ),
    accessorFn: (row) => row.name,
    cell: ({ row }) => {
      const name = row.original.name
      const email = row.original.email

      return (
        <div className="flex items-center gap-3 ml-3">
          <Avatar className="h-8 w-8">
            <Avatar className="h-8 w-8">
            <AvatarImage
              src={row.original.avatar_url || undefined}
              alt={name}
            />
            <AvatarFallback>
              {name?.charAt(0).toUpperCase()}
            </AvatarFallback>
          </Avatar>
            <AvatarFallback>
              {name?.charAt(0).toUpperCase()}
            </AvatarFallback>
          </Avatar>

          <div className="flex flex-col">
            <span className="font-medium">{name}</span>
            <span className="text-xs text-muted-foreground">{email}</span>
          </div>
        </div>
      )
    },
  },
  {
    accessorKey: "username",
    header: ({ column }) => (
      <DataTableSortHeader column={column} className="hidden md:flex">
        Username
      </DataTableSortHeader>
    ),
    cell: ({ row }) => {
      const username = row.getValue("username") as string

      return (
        <div className="ml-3 hidden md:block">
          <Badge variant="secondary">
            {username}
          </Badge>
        </div>
      )
    },
  },

  {
  id: "role",
    accessorFn: (row) =>
      row.role || row.roles?.[0]?.name || "", // 🔥 penting untuk sorting

    header: ({ column }) => (
      <DataTableSortHeader column={column} className="hidden md:flex">
        Role
      </DataTableSortHeader>
    ),

    cell: ({ row }) => {
      const role =
        row.original.role ||
        row.original.roles?.[0]?.name ||
        "-"

      return (
        <div className="ml-3 hidden md:block">
          <Badge variant="outline">
            {role}
          </Badge>
        </div>
      )
    },
  },

  {
    accessorKey: "created_at",
    header: ({ column }) => (
      <DataTableSortHeader column={column} className="hidden md:flex">
        Dibuat
      </DataTableSortHeader>
    ),
    cell: ({ row }) => {
      const date = new Date(row.getValue("created_at") as string)

      return (
        <div className="ml-3 text-sm hidden md:block">
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
    accessorKey: "updated_at",
    header: ({ column }) => (
      <DataTableSortHeader column={column} className="hidden md:flex">
        Diperbarui
      </DataTableSortHeader>
    ),
    cell: ({ row }) => {
      const date = new Date(row.getValue("updated_at") as string)

      return (
        <div className="ml-3 text-sm hidden md:block">
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
    id: "Opsi",
    cell: ({ row }) => {
      const payment = row.original

      return (
        <div className="flex justify-end">
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" className="h-8 w-8 p-0">
                <span className="sr-only">Open menu</span>
                <MoreHorizontal className="h-4 w-4" />
              </Button>
            </DropdownMenuTrigger>

            <DropdownMenuContent align="end">
              <DropdownMenuLabel>Opsi</DropdownMenuLabel>
              <DropdownMenuSeparator />
              <DropdownMenuItem onClick={() => onEdit(row.original)}>
                Edit
              </DropdownMenuItem>
              <AlertDialog>
                <AlertDialogTrigger asChild>
                  <DropdownMenuItem
                    onSelect={(e) => e.preventDefault()} // 🔥 penting biar dialog kebuka
                    className="text-red-500"
                  >
                    Hapus
                  </DropdownMenuItem>
                </AlertDialogTrigger>

                <AlertDialogContent size="sm">
                  <AlertDialogHeader>
                    <AlertDialogTitle>
                      Hapus User
                    </AlertDialogTitle>
                    <AlertDialogDescription>
                      Yakin ingin menghapus user <b>{row.original.name}</b>? 
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
      )
    },
  }
]