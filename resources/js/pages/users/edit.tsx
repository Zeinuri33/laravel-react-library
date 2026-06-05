"use client"

import { useEffect, useState } from "react"
import { useForm } from "@inertiajs/react"
import { Camera, X } from "lucide-react"

import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTrigger,
} from "@/components/ui/dialog"

import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import Heading from "@/components/heading"
import { toast } from "sonner"
import { Separator } from "@/components/ui/separator"
import { usePage } from "@inertiajs/react"

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

export default function EditUserModal({ open, setOpen, user }: any) {
  const [preview, setPreview] = useState<string | null>(null)

  const { data, setData, put, processing, errors, reset } = useForm({
    name: "",
    username: "",
    email: "",
    password: "",
    password_confirmation: "", // ✅ tambah ini
    avatar: null as File | null,
    role: "",
    remove_avatar: false,
  })

  // isi data saat modal dibuka
  useEffect(() => {
    if (user && open) {
      
      setData({
        name: user.name || "",
        username: user.username || "",
        email: user.email || "",
        password: "",
        password_confirmation: "",
        avatar: null,
        remove_avatar: false,
        role: user.roles && user.roles.length > 0 
        ? user.roles[0].name 
        : "",
      })

      setPreview(user.avatar_url || null)
    }
  }, [user, open])

  const handleSuccess = () => {
    reset()
    setPreview(null)
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

    const toastId = toast(`Alhamdulillah, User ${data.name} berhasil diperbarui`, {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }

  const submit = (e: any) => {
    e.preventDefault()

    put(`/users/${user.id}`, {
      forceFormData: true,
      onSuccess: handleSuccess,
      onError: () => {
        toast("Gagal memperbarui user", {
          description: "Periksa kembali data yang diinput.",
        })
      },
    })
  }

  const { roles } = usePage().props as any
  

if (!open || !user) return null

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title={data.name}
            description="Edit data pada form berikut."
          />
          <Separator />
        </DialogHeader>

        <form onSubmit={submit} className="space-y-4">

          {/* Avatar */}
          <div className="space-y-2 text-center">
            <Label className="block">Avatar</Label>

            <div className="flex justify-center">
              <div className="relative h-24 w-24">
                <label className="block h-24 w-24 cursor-pointer">
                  <div className="h-24 w-24 rounded-lg border overflow-hidden bg-muted flex items-center justify-center">
                    {preview ? (
                      <img
                        src={preview}
                        className="h-full w-full object-cover"
                      />
                    ) : (
                      <Camera className="h-6 w-6 text-muted-foreground" />
                    )}
                  </div>

                  {/* Overlay */}
                  <div className="absolute inset-0 flex items-center justify-center rounded-lg bg-black/40 opacity-0 hover:opacity-100 transition">
                    <span className="text-white text-xs">Upload</span>
                  </div>

                  {/* Hidden input */}
                  <Input
                    type="file"
                    className="hidden"
                    accept="image/*"
                    onChange={(e) => {
                      const file = e.target.files?.[0]
                      if (file) {
                        setData("avatar", file)
                        setPreview(URL.createObjectURL(file))
                        setData("remove_avatar", false) // ✅ batal hapus kalau upload baru
                      }
                    }}
                  />
                </label>

                {/* Tombol Hapus */}
                {preview && (
                  <button
                    type="button"
                    onClick={() => {
                      setData("avatar", null)
                      setPreview(null)
                      setData("remove_avatar", true) // ✅ tandai untuk dihapus
                    }}
                    className="absolute bottom-0 right-0 h-7 w-7 rounded-full bg-red-500 text-white flex items-center justify-center shadow hover:bg-red-600 transition"
                  >
                    <X className="h-4 w-4" />
                  </button>
                )}
              </div>
            </div>

            {/* Error */}
            {errors.avatar && (
              <p className="text-sm text-red-500">{errors.avatar}</p>
            )}
          </div>

          {/* Nama */}
          <div>
            <Label className="pb-2">Nama</Label>
            <Input
              placeholder="Masukkan nama"
              value={data.name}
              onChange={(e) => setData("name", e.target.value)}
            />
            {errors.name && <p className="text-red-500 text-sm">{errors.name}</p>}
          </div>

          {/* Username */}
          <div>
            <Label className="pb-2">Username</Label>
            <Input
              placeholder="Masukkan username"
              value={data.username}
              onChange={(e) => setData("username", e.target.value)}
            />
            {errors.username && <p className="text-red-500 text-sm">{errors.username}</p>}
          </div>

          {/* Email */}
          <div>
            <Label className="pb-2">Email</Label>
            <Input
              placeholder="email@gmail.com"
              value={data.email}
              onChange={(e) => setData("email", e.target.value)}
            />
            {errors.email && <p className="text-red-500 text-sm">{errors.email}</p>}
          </div>

          {/* Role */}
          <div>
            <Label className="pb-2">Role</Label>

            <Select
              value={data.role || ""}
              onValueChange={(value) => setData("role", value)}
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Pilih Role" />
              </SelectTrigger>

              <SelectContent>
                {roles?.map((role: string) => (
                  <SelectItem key={role} value={role}>
                    {role}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>

            {errors.role && (
              <p className="text-red-500 text-sm mt-1">{errors.role}</p>
            )}
          </div>

          {/* Password (optional) */}
          <div>
            <Label className="pb-2">Password</Label>
            <Input
              type="password"
              placeholder="Kosongkan jika tidak diubah"
              value={data.password}
              onChange={(e) => setData("password", e.target.value)}
            />
            {errors.password && <p className="text-red-500 text-sm">{errors.password}</p>}
          </div>

          <div>
            <Label className="pb-2">Konfirmasi Password</Label>
            <Input
              type="password"
              placeholder="Ulangi password"
              value={data.password_confirmation}
              onChange={(e) => setData("password_confirmation", e.target.value)}
            />
          </div>
          <div className="pt-5">
            <Button type="submit" disabled={processing} className="w-full">
              Simpan Pembaruan
            </Button>
          </div>

        </form>
      </DialogContent>
    </Dialog>
  )
}
