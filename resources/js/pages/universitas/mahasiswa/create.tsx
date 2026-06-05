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

export default function CreateMahasiswaModal({
  prodis,
}: {
  prodis: Prodi[]
}) {
  const [open, setOpen] = useState(false)

  const { auth } = usePage().props as any
  const userPermissions = auth?.permissions ?? []

  const { data, setData, processing, reset, errors } = useForm({
    lulusan: "",
    nim: "",
    nama: "",
    jk: "",
    prodi_id: "",
    kecamatan: "",
    kabupaten: "",
    provinsi: "",
  })

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    router.post("/mahasiswa", data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal menyimpan mahasiswa", {
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

    const toastId = toast("Mahasiswa berhasil ditambahkan", {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  return (
    <>
      {userPermissions.includes("tambah-mahasiswa") && (
        <Dialog open={open} onOpenChange={setOpen}>

          {/* Trigger */}
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Tambah Mahasiswa
            </Button>
          </DialogTrigger>

          {/* Modal */}
          <DialogContent>
            <DialogHeader>
              <Heading
                variant="small"
                title="Tambah Mahasiswa"
                description="Isi data mahasiswa."
              />
              <Separator />
            </DialogHeader>

            <form onSubmit={submit} className="space-y-4">

              {/* NAMA */}
              <div>
                <Label className="pb-2">Nama</Label>
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

              {/* NIM */}
              <div>
                <Label className="pb-2">NIM</Label>
                <Input
                  placeholder="Contoh: 220123456"
                  value={data.nim}
                  onChange={(e) => setData("nim", e.target.value)}
                />
                {errors.nim && (
                  <p className="text-red-500 text-sm">
                    {errors.nim}
                  </p>
                )}
              </div>

              {/* JENIS KELAMIN */}
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

              {/* KECAMATAN */}
              <div>
                <Label className="pb-2">Kecamatan</Label>
                <Input
                  placeholder="Contoh: Sukolilo"
                  value={data.kecamatan}
                  onChange={(e) => setData("kecamatan", e.target.value)}
                />
              </div>

              {/* KABUPATEN */}
              <div>
                <Label className="pb-2">Kabupaten</Label>
                <Input
                  placeholder="Contoh: Pati"
                  value={data.kabupaten}
                  onChange={(e) => setData("kabupaten", e.target.value)}
                />
              </div>

              {/* PROVINSI */}
              <div>
                <Label className="pb-2">Provinsi</Label>
                <Input
                  placeholder="Contoh: Jawa Tengah"
                  value={data.provinsi}
                  onChange={(e) => setData("provinsi", e.target.value)}
                />
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