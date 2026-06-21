"use client"

import { Head, Link, useForm } from "@inertiajs/react"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { toast } from "sonner"

type EbookUserData = {
    id: number
    nama: string
    email: string | null
    id_anggota: string | null
    prodi: string | null
    fakultas: string | null
    jenis_login: "google" | "opac"
    is_active: boolean
}

export default function EditEbookUser({
    user,
}: {
    user: EbookUserData
}) {
    const {
        data,
        setData,
        put,
        processing,
        errors,
    } = useForm({
        nama: user.nama,
        email: user.email || "",
        id_anggota: user.id_anggota || "",
        prodi: user.prodi || "",
        fakultas: user.fakultas || "",
        jenis_login: user.jenis_login,
        is_active: user.is_active,
    })

    const submit = (e: React.FormEvent) => {
        e.preventDefault()

        put(`/ebook-users/${user.id}`, {
            onSuccess: () => {
                toast.success("User ebook berhasil diperbarui")
            },
        })
    }

    return (
        <>
            <Head title="Edit User E-Book" />

            <div className="p-6 space-y-4">
                <div className="flex justify-between">
                    <Heading
                        variant="small"
                        title="Edit User E-Book"
                        description="Edit data pengguna akses e-book."
                    />

                    <Link href="/ebook-users">
                        <Button variant="outline">
                            Kembali
                        </Button>
                    </Link>
                </div>

                <Separator />

                <div className="max-w-2xl">
                    <form onSubmit={submit} className="space-y-6">
                        <div className="space-y-4">
                            <div>
                                <Label htmlFor="nama" className="mb-2 block">
                                    Nama Lengkap
                                </Label>

                                <Input
                                    id="nama"
                                    placeholder="Contoh: Ahmad Fauzi"
                                    value={data.nama}
                                    onChange={(e) =>
                                        setData("nama", e.target.value)
                                    }
                                />

                                {errors.nama && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.nama}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label htmlFor="email" className="mb-2 block">
                                    Email
                                </Label>

                                <Input
                                    id="email"
                                    type="email"
                                    placeholder="contoh@email.com"
                                    value={data.email}
                                    onChange={(e) =>
                                        setData("email", e.target.value)
                                    }
                                />

                                {errors.email && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.email}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label htmlFor="id_anggota" className="mb-2 block">
                                    ID Anggota
                                </Label>

                                <Input
                                    id="id_anggota"
                                    placeholder="Contoh: AG-001"
                                    value={data.id_anggota}
                                    onChange={(e) =>
                                        setData("id_anggota", e.target.value)
                                    }
                                />

                                {errors.id_anggota && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.id_anggota}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label htmlFor="prodi" className="mb-2 block">
                                    Prodi
                                </Label>

                                <Input
                                    id="prodi"
                                    placeholder="Contoh: Teknik Informatika"
                                    value={data.prodi}
                                    onChange={(e) =>
                                        setData("prodi", e.target.value)
                                    }
                                />

                                {errors.prodi && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.prodi}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label htmlFor="fakultas" className="mb-2 block">
                                    Fakultas
                                </Label>

                                <Input
                                    id="fakultas"
                                    placeholder="Contoh: Fakultas Teknik"
                                    value={data.fakultas}
                                    onChange={(e) =>
                                        setData("fakultas", e.target.value)
                                    }
                                />

                                {errors.fakultas && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.fakultas}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label className="mb-2 block">
                                    Jenis Login
                                </Label>

                                <div className="flex gap-2">
                                    <Button
                                        type="button"
                                        variant={
                                            data.jenis_login === "opac"
                                                ? "default"
                                                : "outline"
                                        }
                                        onClick={() =>
                                            setData("jenis_login", "opac")
                                        }
                                        className="flex-1"
                                    >
                                        OPAC
                                    </Button>

                                    <Button
                                        type="button"
                                        variant={
                                            data.jenis_login === "google"
                                                ? "default"
                                                : "outline"
                                        }
                                        onClick={() =>
                                            setData("jenis_login", "google")
                                        }
                                        className="flex-1"
                                    >
                                        Google
                                    </Button>
                                </div>

                                {errors.jenis_login && (
                                    <p className="mt-1 text-sm text-red-500">
                                        {errors.jenis_login}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label className="mb-2 block">
                                    Status
                                </Label>

                                <div className="flex gap-2">
                                    <Button
                                        type="button"
                                        variant={
                                            data.is_active
                                                ? "default"
                                                : "outline"
                                        }
                                        onClick={() =>
                                            setData("is_active", true)
                                        }
                                        className="flex-1"
                                    >
                                        Aktif
                                    </Button>

                                    <Button
                                        type="button"
                                        variant={
                                            !data.is_active
                                                ? "default"
                                                : "outline"
                                        }
                                        onClick={() =>
                                            setData("is_active", false)
                                        }
                                        className="flex-1"
                                    >
                                        Tidak Aktif
                                    </Button>
                                </div>
                            </div>
                        </div>

                        <Button
                            type="submit"
                            disabled={processing}
                            className="w-full sm:w-auto"
                        >
                            Update User
                        </Button>
                    </form>
                </div>
            </div>
        </>
    )
}

EditEbookUser.layout = {
    breadcrumbs: [
        {
            title: "User E-Book",
            href: "/ebook-users",
        },
        {
            title: "Edit",
            href: "#",
        },
    ],
}
