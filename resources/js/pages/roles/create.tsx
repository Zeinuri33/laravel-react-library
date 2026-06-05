"use client"

import { useState } from "react"
import { useForm, usePage } from "@inertiajs/react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Checkbox } from "@/components/ui/checkbox"
import { Plus } from "lucide-react"
import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"

import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTrigger,
} from "@/components/ui/dialog"

export default function CreateRoleModal() {
  const [open, setOpen] = useState(false)

  const { permissions, auth } = usePage().props as any
  const userPermissions = auth?.permissions ?? []

  const { data, setData, post, processing, reset, errors } = useForm({
    name: "",
    permissions: [] as string[],
  })

  const togglePermission = (permission: string) => {
    if (data.permissions.includes(permission)) {
      setData(
        "permissions",
        data.permissions.filter((p) => p !== permission)
      )
    } else {
      setData("permissions", [...data.permissions, permission])
    }
  }

  const groupPermissions = (permissions: any[]) => {
    const groups: Record<string, any[]> = {}

    permissions.forEach((p) => {
      const parts = p.name.split("-")
      const group = parts[parts.length - 1] // 🔥 ambil belakang

      if (!groups[group]) {
        groups[group] = []
      }

      groups[group].push(p)
    })

    return groups
  }

  const groupedPermissions = groupPermissions(permissions || [])

  // SELECT ALL GLOBAL
  const handleSelectAll = (checked: boolean) => {
    if (checked) {
      setData(
        "permissions",
        permissions.map((p: any) => p.name)
      )
    } else {
      setData("permissions", [])
    }
  }

  // SELECT PER GROUP
  const handleSelectGroup = (group: string, checked: boolean) => {
    const groupItems = groupedPermissions[group].map((p) => p.name)

    if (checked) {
      setData("permissions", [
        ...new Set([...data.permissions, ...groupItems]),
      ])
    } else {
      setData(
        "permissions",
        data.permissions.filter((p) => !groupItems.includes(p))
      )
    }
  }

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    post("/roles", {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal menyimpan role", {
          description: "Periksa kembali data.",
        })
      },
    })
  }

  const handleSuccess = () => {
    reset()
    setOpen(false)

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

    const toastId = toast(`Role ${data.name} berhasil dibuat`, {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  return (
    <>
      {userPermissions.includes("tambah-role") && (
        <Dialog open={open} onOpenChange={setOpen}>
          
          {/* Trigger */}
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Tambah Role
            </Button>
          </DialogTrigger>

          {/* Modal */}
          <DialogContent>
            <DialogHeader>
              <Heading
                variant="small"
                title="Tambah Role"
                description="Isi form untuk membuat role baru."
              />
              <Separator />
            </DialogHeader>

            <form onSubmit={submit} className="space-y-4">

              {/* Nama Role */}
              <div>
                <Label className="pb-2">Nama Role</Label>
                <Input
                  placeholder="Contoh: admin"
                  value={data.name}
                  onChange={(e) => setData("name", e.target.value)}
                />
                {errors.name && (
                  <p className="text-red-500 text-sm">{errors.name}</p>
                )}
              </div>

              {/* Permissions */}
              <div>
                <Label className="pb-2">Permissions</Label>

                {/* SELECT ALL */}
                <div className="flex items-center gap-2 mb-3">
                  <Checkbox
                    checked={
                      data.permissions.length === permissions.length
                    }
                    onCheckedChange={(val) => handleSelectAll(!!val)}
                  />
                  <span className="text-sm font-medium">Pilih Semua</span>
                </div>

                {/* GROUP */}
                <div className="space-y-4 max-h-64 overflow-y-auto border rounded-md p-3">
                  {Object.entries(groupedPermissions).map(([group, items]) => {
                    const allChecked = items.every((p: any) =>
                      data.permissions.includes(p.name)
                    )

                    return (
                      <div key={group} className="space-y-2">

                        {/* GROUP HEADER */}
                        <div className="flex items-center gap-2">
                          <Checkbox
                            checked={allChecked}
                            onCheckedChange={(val) =>
                              handleSelectGroup(group, !!val)
                            }
                          />
                          <span className="font-semibold capitalize">
                            {group}
                          </span>
                        </div>

                        {/* ITEMS */}
                        <div className="grid grid-cols-4 gap-2 pl-6">
                          {items.map((p: any) => (
                            <label
                              key={p.name}
                              className="flex items-center gap-2 text-sm"
                            >
                              <Checkbox
                                checked={data.permissions.includes(p.name)}
                                onCheckedChange={() =>
                                  togglePermission(p.name)
                                }
                              />
                              {p.name.split("-")[0]}
                            </label>
                          ))}
                        </div>
                      </div>
                    )
                  })}
                </div>

                {errors.permissions && (
                  <p className="text-red-500 text-sm mt-1">
                    {errors.permissions}
                  </p>
                )}
              </div>

              {/* Submit */}
              <div className="pt-3">
                <Button type="submit" disabled={processing} className="w-full">
                  Simpan
                </Button>
              </div>

            </form>
          </DialogContent>
        </Dialog>
      )}
    </>
  )
}