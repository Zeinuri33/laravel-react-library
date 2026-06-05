"use client"

import { useState } from "react"
import { useForm, usePage } from "@inertiajs/react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Plus } from "lucide-react"
import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"
import { router } from "@inertiajs/react"

import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTrigger,
} from "@/components/ui/dialog"

export default function CreatePermissionModal() {
  const [open, setOpen] = useState(false)

  const { auth } = usePage().props as any
  const userPermissions = auth?.permissions ?? []

  const { data, setData, post, processing, reset, errors } = useForm({
    name: "",
    action: "",
    module: "",
  })

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    const name = `${data.action}-${data.module}`
      .toLowerCase()
      .replace(/\s+/g, "")

    router.post("/permissions", { name }, {
      onSuccess: () => handleSuccess(name),
      onError: () => {
        toast("Gagal menyimpan permission", {
          description: "Periksa kembali data.",
        })
      },
    })
  }

  const handleSuccess = (name: string) => {
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

    const toastId = toast(`Permission ${name} berhasil dibuat`, {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  return (
    <>
      {userPermissions.includes("tambah-akses") && (
        <Dialog open={open} onOpenChange={setOpen}>

          {/* Trigger */}
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Tambah Permission
            </Button>
          </DialogTrigger>

          {/* Modal */}
          <DialogContent>
            <DialogHeader>
              <Heading
                variant="small"
                title="Tambah Permission"
                description="Isi aksi dan kategori permission."
              />
              <Separator />
            </DialogHeader>

            <form onSubmit={submit} className="space-y-4">

              {/* ACTION */}
              <div>
                <Label className="pb-2">Aksi</Label>
                <Input
                  placeholder="Contoh: lihat"
                  value={data.action}
                  onChange={(e) => setData("action", e.target.value)}
                />
                {errors.name && (
                  <p className="text-red-500 text-sm">{errors.name}</p>
                )}
              </div>

              {/* MODULE */}
              <div>
                <Label className="pb-2">Kategori / Modul</Label>
                <Input
                  placeholder="Contoh: user"
                  value={data.module}
                  onChange={(e) => setData("module", e.target.value)}
                />
              </div>

              {/* PREVIEW */}
              <div className="text-sm text-muted-foreground">
                Preview:{" "}
                <b>
                  {data.action && data.module
                    ? `${data.action}-${data.module}`
                    : "-"}
                </b>
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