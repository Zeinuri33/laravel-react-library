"use client"

import { useEffect, useState } from "react"
import { useForm, usePage } from "@inertiajs/react"

import {
  Dialog,
  DialogContent,
  DialogHeader,
} from "@/components/ui/dialog"

import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import { Checkbox } from "@/components/ui/checkbox"
import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"

// ==============================
// HELPER
// ==============================

// grouping berdasarkan belakang (user, role, dll)
const groupPermissions = (permissions: any[]) => {
  const groups: Record<string, any[]> = {}

  permissions.forEach((p) => {
    const parts = p.name.split("-")
    const group = parts[parts.length - 1]

    if (!groups[group]) groups[group] = []

    groups[group].push(p)
  })

  return groups
}

// format label (lihat → Lihat)
const formatPermission = (name: string) => {
  const action = name.split("-")[0]
  return action.charAt(0).toUpperCase() + action.slice(1)
}

export default function EditRoleModal({ open, setOpen, role }: any) {
  const { permissions } = usePage().props as any

  const [groupedPermissions, setGroupedPermissions] = useState<any>({})

  const { data, setData, put, processing, errors, reset } = useForm({
    name: "",
    permissions: [] as string[],
  })

  // ==============================
  // INIT DATA
  // ==============================
  useEffect(() => {
    if (role && open) {
      setData({
        name: role.name || "",
        permissions: role.permissions?.map((p: any) => p.name) || [],
      })
    }
  }, [role, open])

  // grouping
  useEffect(() => {
    setGroupedPermissions(groupPermissions(permissions || []))
  }, [permissions])

  // ==============================
  // HANDLER
  // ==============================

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

  const handleSelectGroup = (group: string, checked: boolean) => {
    const items = groupedPermissions[group].map((p: any) => p.name)

    if (checked) {
      setData("permissions", [
        ...new Set([...data.permissions, ...items]),
      ])
    } else {
      setData(
        "permissions",
        data.permissions.filter((p) => !items.includes(p))
      )
    }
  }

  // ==============================
  // SUBMIT
  // ==============================
  const submit = (e: any) => {
    e.preventDefault()

    put(`/roles/${role.id}`, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal update role", {
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

    toast(`Role ${data.name} berhasil diperbarui`, {
      description: now,
    })
  }

  if (!open || !role) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title={data.name}
            description="Edit role dan permissions."
          />
          <Separator />
        </DialogHeader>

        <form onSubmit={submit} className="space-y-4">

          {/* Nama */}
          <div>
            <Label className="pb-2">Nama Role</Label>
            <Input
              value={data.name}
              onChange={(e) => setData("name", e.target.value)}
            />
            {errors.name && (
              <p className="text-red-500 text-sm">{errors.name}</p>
            )}
          </div>

          {/* PERMISSIONS */}
          <div>
            <Label className="pb-2">Permissions</Label>

            {/* SELECT ALL */}
            <div className="flex items-center gap-2 mb-3">
              <Checkbox
                checked={
                  data.permissions.length === permissions.length
                }
                onCheckedChange={(val) =>
                  handleSelectAll(!!val)
                }
              />
              <span className="text-sm font-medium">
                Pilih Semua
              </span>
            </div>

            {/* GROUP */}
            <div className="space-y-4 max-h-64 overflow-y-auto border rounded-md p-3">
              {Object.entries(groupedPermissions).map(
                ([group, items]: any) => {
                  const allChecked = items.every((p: any) =>
                    data.permissions.includes(p.name)
                  )

                  return (
                    <div key={group} className="space-y-2">

                      {/* HEADER */}
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
                      <div className="grid grid-cols-2 gap-2 pl-6">
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
                            {formatPermission(p.name)}
                          </label>
                        ))}
                      </div>
                    </div>
                  )
                }
              )}
            </div>

            {errors.permissions && (
              <p className="text-red-500 text-sm mt-1">
                {errors.permissions}
              </p>
            )}
          </div>

          {/* SUBMIT */}
          <div className="pt-4">
            <Button
              type="submit"
              disabled={processing}
              className="w-full"
            >
              Simpan Perubahan
            </Button>
          </div>

        </form>
      </DialogContent>
    </Dialog>
  )
}