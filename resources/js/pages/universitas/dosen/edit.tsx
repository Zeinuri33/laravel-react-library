"use client"

import { useEffect } from "react"
import { useForm, router } from "@inertiajs/react"

import {
  Dialog,
  DialogContent,
  DialogHeader,
} from "@/components/ui/dialog"

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"

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

export default function EditDosenModal({
  open,
  setOpen,
  dosen,
  prodis,
}: {
  open: boolean
  setOpen: (v: boolean) => void
  dosen: any
  prodis: Prodi[]
}) {
  const { data, setData, processing, errors, reset } = useForm({
    nama: "",
    nidn: "",
    kontak: "",
    prodi_id: "",
  })

  // ==============================
  // INIT DATA
  // ==============================
  useEffect(() => {
    if (dosen && open) {
      setData({
        nama: dosen.nama || "",
        nidn: dosen.nidn || "",
        kontak: dosen.kontak || "",
        prodi_id: dosen.prodi?.id?.toString() || "",
      })
    }
  }, [dosen, open])

  // ==============================
  // SUBMIT
  // ==============================
  const submit = (e: any) => {
    e.preventDefault()

    router.put(`/dosen/${dosen.id}`, data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal update dosen", {
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

    toast("Dosen berhasil diperbarui", {
      description: now,
    })
  }

  if (!open || !dosen) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title="Edit Dosen"
            description={`Ubah data ${dosen.nama}`}
          />
          <Separator />
        </DialogHeader>

        <form onSubmit={submit} className="space-y-4">

          {/* NAMA */}
          <div>
            <Label className="pb-2">Nama Dosen</Label>
            <Input
              value={data.nama}
              onChange={(e) => setData("nama", e.target.value)}
              placeholder="Contoh: Ahmad Fauzi"
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
              value={data.nidn}
              onChange={(e) => setData("nidn", e.target.value)}
              placeholder="Contoh: 0123456789"
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
                    {p.prodi} {p.fakultas ? `- ${p.fakultas.fakultas}` : ""}
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
              value={data.kontak}
              onChange={(e) => setData("kontak", e.target.value)}
              placeholder="Contoh: 08123456789"
            />
            {errors.kontak && (
              <p className="text-red-500 text-sm">
                {errors.kontak}
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