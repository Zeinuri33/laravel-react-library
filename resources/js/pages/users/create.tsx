"use client"

import { useState } from "react"
import { useForm, usePage } from "@inertiajs/react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Upload, X, Plus } from "lucide-react"
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

export default function UserCreateModal() {
  const [open, setOpen] = useState(false)

  const { data, setData, post, processing, reset, errors } = useForm({
    name: "",
    username: "",
    email: "",
    password: "",
    password_confirmation: "",
    avatar: null as File | null,
    role: "",
  })

  const [preview, setPreview] = useState<string | null>(null)

  const submit = (e: React.FormEvent) => {
    e.preventDefault()

    post("/users", {
      forceFormData: true,
      onSuccess: () => handleSuccess(),
      onError: () => {
        toast("Gagal menyimpan user", {
          description: "Periksa kembali data yang diinput.",
        })
      },
    })
  }

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

    const toastId = toast(`Alhamdulillah, User ${data.name} berhasil dibuat`, {
      description: now,
      action: {
        label: "Tutup",
        onClick: () => toast.dismiss(toastId),
      },
    })
  }
const { auth, roles } = usePage().props as any

const permissions = auth?.permissions ?? []


  return (
  <>
    {permissions.includes('tambah-user') && (
    <Dialog open={open} onOpenChange={setOpen}>
      
      {/* Trigger */}
      <DialogTrigger asChild>
          <Button>
            <Plus className="mr-2 h-4 w-4" />
            Tambah User
          </Button>
      </DialogTrigger>

      {/* Modal */}
      <DialogContent>
        <DialogHeader>
          <Heading
            variant="small"
            title="Tambah Pengguna"
            description="Isi form di bawah ini untuk menambahkan pengguna baru."
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
                        alt="Preview"
                        className="h-full w-full object-cover"
                      />
                    ) : (
                      <Upload className="h-6 w-6 text-muted-foreground" />
                    )}
                  </div>

                  <div className="absolute inset-0 flex items-center justify-center rounded-lg bg-black/40 opacity-0 hover:opacity-100 transition">
                    <span className="text-white text-xs">Upload</span>
                  </div>

                  <Input
                    type="file"
                    accept="image/*"
                    className="hidden"
                    onChange={(e) => {
                      const file = e.target.files?.[0]
                      if (file) {
                        setData("avatar", file)
                        setPreview(URL.createObjectURL(file))
                      }
                    }}
                  />
                </label>

                {preview && (
                  <button
                    type="button"
                    onClick={() => {
                      setData("avatar", null)
                      setPreview(null)
                    }}
                    className="absolute bottom-0 right-0 flex h-7 w-7 items-center justify-center rounded-full bg-red-500 text-white shadow"
                  >
                    <X className="h-4 w-4" />
                  </button>
                )}
              </div>
            </div>

            {errors.avatar && (
              <p className="text-sm text-red-500">{errors.avatar}</p>
            )}
          </div>

          {/* Nama */}
          <div>
            <Label className="pb-2">Nama Pengguna</Label>
            <Input
              placeholder="Masukkan nama pengguna"
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
            <Label className="pb-2">Email (Opsional)</Label>
            <Input
              type="email"
              placeholder="contoh@email.com"
              value={data.email}
              onChange={(e) => setData("email", e.target.value)}
            />
            {errors.email && <p className="text-red-500 text-sm">{errors.email}</p>}
          </div>

          {/* Role */}
          <div>
            <Label className="pb-2">Role</Label>

            <Select
              value={data.role}
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

          {/* Password */}
          <div>
            <Label className="pb-2">Password</Label>
            <Input
              type="password"
              placeholder="Minimal 8 karakter"
              value={data.password}
              onChange={(e) => setData("password", e.target.value)}
            />
            {errors.password && <p className="text-red-500 text-sm">{errors.password}</p>}
          </div>

          {/* Konfirmasi Password */}
          <div>
            <Label className="pb-2">Konfirmasi Password</Label>
            <Input
              type="password"
              placeholder="Ulangi password"
              value={data.password_confirmation}
              onChange={(e) => setData("password_confirmation", e.target.value)}
            />
            {errors.password_confirmation && (
              <p className="text-red-500 text-sm">
                {errors.password_confirmation}
              </p>
            )}
          </div>
          
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