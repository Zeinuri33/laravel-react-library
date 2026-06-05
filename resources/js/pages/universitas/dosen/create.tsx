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
// TYPE PRODI
// ==============================
type Prodi = {
  id: number
  prodi: string
  fakultas?: {
    id: number
    fakultas: string
  }
}

export default function CreateDosenModal({
  prodis,
}: {
  prodis: Prodi[]
}) {
  const [open, setOpen] = useState(false)

  const { auth } = usePage().props as any
  const userPermissions = auth?.permissions ?? []

  const { data, setData, processing, reset, errors } = useForm({
    nama: "",
    nidn: "",
    kontak: "",
    prodi_id: "",
  })

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    router.post("/dosen", data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal menyimpan dosen", {
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

    const toastId = toast("Dosen berhasil ditambahkan", {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  return (
    <>
      {userPermissions.includes("tambah-dosen") && (
        <Dialog open={open} onOpenChange={setOpen}>

          {/* Trigger */}
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Tambah Dosen
            </Button>
          </DialogTrigger>

          {/* Modal */}
          <DialogContent>
            <DialogHeader>
              <Heading
                variant="small"
                title="Tambah Dosen"
                description="Isi data dosen."
              />
              <Separator />
            </DialogHeader>

            <form onSubmit={submit} className="space-y-4">

              {/* NAMA */}
              <div>
                <Label className="pb-2">Nama Dosen</Label>
                <Input
                  placeholder="Contoh: Ahmad Fauzi"
                  value={data.nama}
                  onChange={(e) => setData("nama", e.target.value)}
                />
                {errors.nama && (
                  <p className="text-red-500 text-sm">
                    {errors.nama}
                  </p>
                )}
              </div>

              {/* NIDN */}
              <div>
                <Label className="pb-2">NIDN</Label>
                <Input
                  placeholder="Contoh: 0123456789"
                  value={data.nidn}
                  onChange={(e) => setData("nidn", e.target.value)}
                />
                {errors.nidn && (
                  <p className="text-red-500 text-sm">
                    {errors.nidn}
                  </p>
                )}
              </div>

              {/* PRODI */}
              <div>
                <Label className="pb-2">Prodi</Label>

                <Select
                  value={data.prodi_id}
                  onValueChange={(value) => setData("prodi_id", value)}
                >
                  <SelectTrigger className="w-full">
                    <SelectValue placeholder="Pilih Prodi" />
                  </SelectTrigger>

                  <SelectContent>
                    {prodis.map((p) => (
                      <SelectItem key={p.id} value={String(p.id)}>
                        {p.prodi}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>

                {errors.prodi_id && (
                  <p className="text-red-500 text-sm mt-1">
                    {errors.prodi_id}
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