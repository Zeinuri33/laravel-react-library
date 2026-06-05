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
// TYPE
// ==============================
type Fakultas = {
  id: number
  fakultas: string
}

export default function EditProdiModal({
  open,
  setOpen,
  prodi,
  fakultas,
}: {
  open: boolean
  setOpen: (v: boolean) => void
  prodi: any
  fakultas: Fakultas[]
}) {
  const { data, setData, processing, errors, reset } = useForm({
    prodi: "",
    kode: "",
    fakultas_id: "",
    kontak: "",
  })

  // ==============================
  // INIT DATA
  // ==============================
  useEffect(() => {
    if (prodi && open) {
      setData({
        prodi: prodi.prodi || "",
        kode: prodi.kode || "",
        fakultas_id: prodi.fakultas?.id?.toString() || "",
        kontak: prodi.kontak || "",
      })
    }
  }, [prodi, open])

  // ==============================
  // SUBMIT
  // ==============================
  const submit = (e: any) => {
    e.preventDefault()

    router.put(`/prodi/${prodi.id}`, data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal update prodi", {
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

    toast("Prodi berhasil diperbarui", {
      description: now,
    })
  }

  if (!open || !prodi) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title="Edit Prodi"
            description={`Ubah data ${prodi.prodi}`}
          />
          <Separator />
        </DialogHeader>

        <form onSubmit={submit} className="space-y-4">

          {/* PRODI */}
          <div>
            <Label className="pb-2">Nama Prodi</Label>
            <Input
              value={data.prodi}
              onChange={(e) => setData("prodi", e.target.value)}
              placeholder="Contoh: Teknik Informatika"
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
              value={data.kode}
              onChange={(e) => setData("kode", e.target.value)}
              placeholder="Contoh: TI01"
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