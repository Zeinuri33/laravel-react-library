"use client"

import { useState } from "react"
import { useForm, usePage, router } from "@inertiajs/react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
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

export default function CreateFakultasModal() {
  const [open, setOpen] = useState(false)

  const { auth } = usePage().props as any
  const userPermissions = auth?.permissions ?? []

  const { data, setData, processing, reset, errors } = useForm({
    fakultas: "",
    dekan: "",
  })

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    router.post("/fakultas", data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal menyimpan fakultas", {
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

    const toastId = toast("Fakultas berhasil ditambahkan", {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  return (
    <>
      {userPermissions.includes("tambah-fakultas") && (
        <Dialog open={open} onOpenChange={setOpen}>

          {/* Trigger */}
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Tambah Fakultas
            </Button>
          </DialogTrigger>

          {/* Modal */}
          <DialogContent>
            <DialogHeader>
              <Heading
                variant="small"
                title="Tambah Fakultas"
                description="Isi data fakultas dan dekan."
              />
              <Separator />
            </DialogHeader>

            <form onSubmit={submit} className="space-y-4">

              {/* FAKULTAS */}
              <div>
                <Label className="pb-2">Nama Fakultas</Label>
                <Input
                  placeholder="Contoh: Fakultas Ilmu Komputer"
                  value={data.fakultas}
                  onChange={(e) => setData("fakultas", e.target.value)}
                />
                {errors.fakultas && (
                  <p className="text-red-500 text-sm">
                    {errors.fakultas}
                  </p>
                )}
              </div>

              {/* DEKAN */}
              <div>
                <Label className="pb-2">Dekan</Label>
                <Input
                  placeholder="Contoh: Dr. Ahmad Zeinuri"
                  value={data.dekan}
                  onChange={(e) => setData("dekan", e.target.value)}
                />
                {errors.dekan && (
                  <p className="text-red-500 text-sm">
                    {errors.dekan}
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