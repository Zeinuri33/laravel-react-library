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

export default function EditMahasiswaModal({
  open,
  setOpen,
  mahasiswa,
  prodis,
}: {
  open: boolean
  setOpen: (v: boolean) => void
  mahasiswa: any
  prodis: Prodi[]
}) {
  const { data, setData, processing, errors, reset } = useForm({
    lulusan: "",
    nim: "",
    nama: "",
    jk: "",
    prodi_id: "",
    kecamatan: "",
    kabupaten: "",
    provinsi: "",
  })

  // ==============================
  // INIT DATA
  // ==============================
  useEffect(() => {
    if (mahasiswa && open) {
      setData({
        lulusan: mahasiswa.lulusan || "",
        nim: mahasiswa.nim || "",
        nama: mahasiswa.nama || "",
        jk: mahasiswa.jk || "",
        prodi_id: mahasiswa.prodi?.id?.toString() || "",
        kecamatan: mahasiswa.kecamatan || "",
        kabupaten: mahasiswa.kabupaten || "",
        provinsi: mahasiswa.provinsi || "",
      })
    }
  }, [mahasiswa, open])

  // ==============================
  // SUBMIT
  // ==============================
  const submit = (e: any) => {
    e.preventDefault()

    router.put(`/mahasiswa/${mahasiswa.id}`, data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal update mahasiswa", {
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

    toast("Mahasiswa berhasil diperbarui", {
      description: now,
    })
  }

  if (!open || !mahasiswa) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title="Edit Mahasiswa"
            description={`Ubah data ${mahasiswa.nama}`}
          />
          <Separator />
        </DialogHeader>

        <form onSubmit={submit} className="space-y-4">

          {/* NAMA */}
          <div>
            <Label className="pb-2">Nama</Label>
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

          {/* NIM */}
          <div>
            <Label className="pb-2">NIM</Label>
            <Input
              value={data.nim}
              onChange={(e) => setData("nim", e.target.value)}
              placeholder="Contoh: 220123456"
            />
            {errors.nim && (
              <p className="text-red-500 text-sm">
                {errors.nim}
              </p>
            )}
          </div>

          {/* JK */}
          <div>
            <Label className="pb-2">Jenis Kelamin</Label>
            <Select
              value={data.jk}
              onValueChange={(value) => setData("jk", value)}
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Pilih JK" />
              </SelectTrigger>

              <SelectContent>
                <SelectItem value="L">Laki-laki</SelectItem>
                <SelectItem value="P">Perempuan</SelectItem>
              </SelectContent>
            </Select>

            {errors.jk && (
              <p className="text-red-500 text-sm">
                {errors.jk}
              </p>
            )}
          </div>

          {/* LULUSAN (TAHUN) */}
        <div>
        <Label className="pb-2">Tahun Lulusan</Label>

        <Select
            value={data.lulusan}
            onValueChange={(value) => setData("lulusan", value)}
        >
            <SelectTrigger className="w-full">
            <SelectValue placeholder="Pilih Tahun Lulusan" />
            </SelectTrigger>

            <SelectContent>
            {Array.from({ length: 5 }, (_, i) => {
                const year = new Date().getFullYear() - i
                return (
                <SelectItem key={year} value={String(year)}>
                    {year}
                </SelectItem>
                )
            })}
            </SelectContent>
        </Select>

        {errors.lulusan && (
            <p className="text-red-500 text-sm">
            {errors.lulusan}
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

          {/* KECAMATAN */}
          <div>
            <Label className="pb-2">Kecamatan</Label>
            <Input
              value={data.kecamatan}
              onChange={(e) => setData("kecamatan", e.target.value)}
              placeholder="Contoh: Sukolilo"
            />
          </div>

          {/* KABUPATEN */}
          <div>
            <Label className="pb-2">Kabupaten</Label>
            <Input
              value={data.kabupaten}
              onChange={(e) => setData("kabupaten", e.target.value)}
              placeholder="Contoh: Pati"
            />
          </div>

          {/* PROVINSI */}
          <div>
            <Label className="pb-2">Provinsi</Label>
            <Input
              value={data.provinsi}
              onChange={(e) => setData("provinsi", e.target.value)}
              placeholder="Contoh: Jawa Tengah"
            />
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