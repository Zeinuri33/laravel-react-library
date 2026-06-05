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

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

// ==============================
// TYPE
// ==============================
type Fakultas = {
  id: number
  fakultas: string
}

export default function CreateProdiModal({
  fakultas,
}: {
  fakultas: Fakultas[]
}) {
  const [open, setOpen] = useState(false)

  const { auth } = usePage().props as any
  const userPermissions = auth?.permissions ?? []

  const { data, setData, processing, reset, errors } = useForm({
    prodi: "",
    kode: "",
    fakultas_id: "",
    kontak: "",
  })

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    router.post("/prodi", data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal menyimpan prodi", {
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

    const toastId = toast("Prodi berhasil ditambahkan", {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  return (
    <>
      {userPermissions.includes("tambah-prodi") && (
        <Dialog open={open} onOpenChange={setOpen}>

          {/* Trigger */}
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Tambah Prodi
            </Button>
          </DialogTrigger>

          {/* Modal */}
          <DialogContent>
            <DialogHeader>
              <Heading
                variant="small"
                title="Tambah Prodi"
                description="Isi data program studi."
              />
              <Separator />
            </DialogHeader>

            <form onSubmit={submit} className="space-y-4">

              {/* PRODI */}
              <div>
                <Label className="pb-2">Nama Prodi</Label>
                <Input
                  placeholder="Contoh: Teknik Informatika"
                  value={data.prodi}
                  onChange={(e) => setData("prodi", e.target.value)}
                />
                {errors.prodi && (
                  <p className="text-red-500 text-sm">
                    {errors.prodi}
                  </p>
                )}
              </div>

              {/* KODE */}
              <div>
                <Label className="pb-2">Kode</Label>
                <Input
                  placeholder="Contoh: TI01"
                  value={data.kode}
                  onChange={(e) => setData("kode", e.target.value)}
                />
                {errors.kode && (
                  <p className="text-red-500 text-sm">
                    {errors.kode}
                  </p>
                )}
              </div>

              {/* FAKULTAS */}
              <div>
                <Label className="pb-2">Fakultas</Label>

                <Select
                  value={data.fakultas_id}
                  onValueChange={(value) => setData("fakultas_id", value)}
                >
                  <SelectTrigger className="w-full">
                    <SelectValue placeholder="Pilih Fakultas" />
                  </SelectTrigger>

                  <SelectContent>
                    {fakultas.map((f) => (
                      <SelectItem key={f.id} value={String(f.id)}>
                        {f.fakultas}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>

                {errors.fakultas_id && (
                  <p className="text-red-500 text-sm mt-1">
                    {errors.fakultas_id}
                  </p>
                )}
              </div>

              {/* KONTAK */}
              <div>
                <Label className="pb-2">Kontak</Label>
                <Input
                  placeholder="Contoh: 08123456789"
                  value={data.kontak}
                  onChange={(e) => setData("kontak", e.target.value)}
                />
                {errors.kontak && (
                  <p className="text-red-500 text-sm">
                    {errors.kontak}
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