"use client"

import { useEffect } from "react"
import { useForm, router } from "@inertiajs/react"

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

export default function EditFakultasModal({
  open,
  setOpen,
  fakultas,
}: any) {

  const { data, setData, processing, errors, reset } = useForm({
    fakultas: "",
    dekan: "",
  })

  // ==============================
  // INIT DATA
  // ==============================
  useEffect(() => {
    if (fakultas && open) {
      setData({
        fakultas: fakultas.fakultas || "",
        dekan: fakultas.dekan || "",
      })
    }
  }, [fakultas, open])

  // ==============================
  // SUBMIT
  // ==============================
  const submit = (e: any) => {
    e.preventDefault()

    router.put(`/fakultas/${fakultas.id}`, data, {
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal update fakultas", {
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

    toast("Fakultas berhasil diperbarui", {
      description: now,
    })
  }

  if (!open || !fakultas) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title="Edit Fakultas"
            description={`Ubah data ${fakultas.fakultas}`}
          />
          <Separator />
        </DialogHeader>

        <form onSubmit={submit} className="space-y-4">

          {/* FAKULTAS */}
          <div>
            <Label className="pb-2">Nama Fakultas</Label>
            <Input
              value={data.fakultas}
              onChange={(e) => setData("fakultas", e.target.value)}
              placeholder="Contoh: Fakultas Ilmu Komputer"
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
              value={data.dekan}
              onChange={(e) => setData("dekan", e.target.value)}
              placeholder="Contoh: Dr. Ahmad Zeinuri"
            />
            {errors.dekan && (
              <p className="text-red-500 text-sm">
                {errors.dekan}
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