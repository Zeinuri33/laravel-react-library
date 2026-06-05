"use client"

import { useEffect } from "react"
import { useForm } from "@inertiajs/react"
import { router } from "@inertiajs/react"

import {
  Dialog,
  DialogContent,
  DialogHeader,
} from "@/components/ui/dialog"

import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"

export default function EditPermissionModal({
  open,
  setOpen,
  permission,
}: any) {

  const { data, setData, processing, errors, reset } = useForm({
    name: "",
    action: "",
    module: "",
  })

  // ==============================
  // INIT DATA (split name)
  // ==============================
  useEffect(() => {
    if (permission && open) {
      const [action = "", module = ""] = permission.name.split("-")

      setData({
        action,
        module,
      })
    }
  }, [permission, open])

  // ==============================
  // SUBMIT
  // ==============================
  const submit = (e: any) => {
    e.preventDefault()

    if (!data.action || !data.module) {
      toast("Aksi dan kategori wajib diisi")
      return
    }

    const name = `${data.action}-${data.module}`
      .toLowerCase()
      .replace(/\s+/g, "")

    router.put(`/permissions/${permission.id}`, { name }, {
      onSuccess: () => handleSuccess(name),
      onError: () => {
        toast("Gagal update permission", {
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

    toast(`Permission ${name} berhasil diperbarui`, {
      description: now,
    })
  }

  if (!open || !permission) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title="Edit Permission"
            description={`Ubah permission ${permission.name}`}
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

          {/* ERROR */}
          {errors.name && (
            <p className="text-red-500 text-sm">{errors.name}</p>
          )}

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