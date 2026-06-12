"use client"

import { useCallback, useState, useEffect, useRef   } from "react"
import { Head, router, useForm, Link, usePage } from "@inertiajs/react"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { toast } from "sonner"
import {
    MapContainer,
    TileLayer,
    Marker,
    Circle,
    LayersControl,
    useMapEvents,
} from "react-leaflet"

const { BaseLayer, Overlay } = LayersControl

import "leaflet/dist/leaflet.css"
function LocationPicker({
    position,
    onSelect,
}: {
    position: [number, number]
    onSelect: (
        lat: number,
        lng: number
    ) => void
}) {
    useMapEvents({
        click(e) {
            onSelect(
                e.latlng.lat,
                e.latlng.lng
            )
        },
    })

    return (
        <Marker position={position} />
    )
}

export default function CreateEbook() {
    
    const [preview, setPreview] =
        useState<string | null>(null)
    const [extracting, setExtracting] =
        useState(false)

    const {
        data,
        setData,
        post,
        processing,
        errors,
    } = useForm({
        nama: "",
        latitude: "-7.751233324336584",
        longitude: "114.27367858251472",
        radius: 50,
        is_active: true,
    })
    const [position, setPosition] =
        useState<[number, number]>([
            -7.751233324336584,
            114.27367858251472,
        ])

    const submit = (
    e: React.FormEvent
    ) => {
        e.preventDefault()

        post("/titik-ebooks", {
            onSuccess: () => {
                toast.success(
                    "Titik baca berhasil ditambahkan"
                )
            },
        })
    }


    type PageProps = {
        klasifikasis: {
            id: number
            kode: string
            kategori: string | null
            deskripsi: string
        }[]
    }

    const [showLeaveDialog, setShowLeaveDialog] = useState(false)

    return (
    <>
        <Head title="Tambah Titik Baca" />
            <div className="p-6 space-y-4">
                <div className="flex justify-between">
                    <Heading
                        variant="small"
                        title="Tambah Titik Baca"
                        description="Tambahkan lokasi akses e-book."
                    />
                    <Link href="/titik-ebooks">
                        <Button variant="outline">
                            Kembali
                        </Button>
                    </Link>
                </div>
            <Separator />

            <div className="grid gap-6 lg:grid-cols-12 items-stretch">
                {/* kiri */}
                <div className="lg:col-span-8 flex flex-col h-full">
                    <div className="relative h-full rounded-lg border overflow-hidden">
                        <MapContainer
                            center={position}
                            zoom={18}
                            style={{
                                height: "100%",
                                minHeight: "450px",
                            }}
                        >
                            <LayersControl position="topright">
                                <LayersControl.BaseLayer
                                    checked
                                    name="🛰️ Hybrid"
                                >
                                    <TileLayer
                                        attribution="Google Maps"
                                        url="https://mt1.google.com/vt/lyrs=y&x={x}&y={y}&z={z}"
                                        maxZoom={22}
                                    />
                                </LayersControl.BaseLayer>

                                <LayersControl.BaseLayer
                                    name="🗺️ Street"
                                >
                                    <TileLayer
                                        attribution="Google Maps"
                                        url="https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}"
                                        maxZoom={22}
                                    />
                                </LayersControl.BaseLayer>

                                <LayersControl.BaseLayer
                                    name="📸 Satellite"
                                >
                                    <TileLayer
                                        attribution="Google Maps"
                                        url="https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}"
                                        maxZoom={22}
                                    />
                                </LayersControl.BaseLayer>

                            </LayersControl>

                            <LocationPicker
                                position={position}
                                onSelect={(lat, lng) => {
                                    setPosition([
                                        lat,
                                        lng,
                                    ])

                                    setData(
                                        "latitude",
                                        String(lat)
                                    )

                                    setData(
                                        "longitude",
                                        String(lng)
                                    )
                                }}
                            />

                            <Circle
                                center={position}
                                radius={Number(
                                    data.radius
                                )}
                            />
                        </MapContainer>
                    </div>
                </div>
                {/* kanan */}
                <div className="lg:col-span-4 flex flex-col h-full">
                    {/* FORM SCROLL */}
                    <div className="flex-1 overflow-y-auto px-4 py-2">
                        <form id="ebook-form" onSubmit={submit} className="space-y-4">
                            <div>
                                <Label className="mb-2 block">Nama Titik Baca</Label>
                                <Input
                                    placeholder="Contoh: Gazebo Fakultas Tarbiyah"
                                    value={data.nama}
                                    onChange={(e) =>
                                        setData(
                                            "nama",
                                            e.target.value
                                        )
                                    }
                                />

                                {errors.nama && (
                                    <p className="text-sm text-red-500">
                                        {errors.nama}
                                    </p>
                                )}
                            </div>

                            <div>
                                <Label className="mb-2 block">
                                    Latitude
                                </Label>

                                <Input
                                    placeholder="Pilih titik pada peta"
                                    value={data.latitude}
                                    readOnly
                                />
                            </div>

                            <div>
                                <Label className="mb-2 block">
                                    Longitude
                                </Label>

                                <Input
                                    placeholder="Pilih titik pada peta"
                                    value={data.longitude}
                                    readOnly
                                />
                            </div>

                            <div>
                                <Label className="mb-2 block">
                                    Radius (Meter)
                                </Label>

                                <Input
                                    type="number"
                                    placeholder="Contoh: 50"
                                    value={data.radius}
                                    onChange={(e) =>
                                        setData(
                                            "radius",
                                            Number(
                                                e.target.value
                                            )
                                        )
                                    }
                                />
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
                                            setData(
                                                "is_active",
                                                true
                                            )
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
                                            setData(
                                                "is_active",
                                                false
                                            )
                                        }
                                        className="flex-1"
                                    >
                                        Tidak Aktif
                                    </Button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div className="px-4 pt-4 bg-background">
                        <Button
                            type="submit"
                            form="ebook-form"
                            disabled={processing}
                            className="w-full"
                        >
                            Simpan Titik Baca
                        </Button>
                    </div>
                </div>
            </div>
        </div>
    </>
    )
}

CreateEbook.layout = {
    breadcrumbs: [
        {
            title: "Titik Baca",
            href: "/titik-ebooks",
        },
        {
            title: "Tambah",
            href: "/titik-ebooks/create",
        },
    ],
}
