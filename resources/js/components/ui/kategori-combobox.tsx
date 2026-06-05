"use client"

import { useMemo, useState } from "react"

import { router } from "@inertiajs/react"

import {
    Check,
    Pencil,
} from "lucide-react"

import { toast } from "sonner"

import { Button } from "@/components/ui/button"

import { Input } from "@/components/ui/input"

import {
    Command,
    CommandEmpty,
    CommandGroup,
    CommandItem,
} from "@/components/ui/command"

import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"

import { Label } from "@/components/ui/label"

interface Kategori {
    id: number
    kategori: string
}

interface Props {
    kategori: Kategori[]
    value: string
    onChange: (value: string) => void
    label?: string
    placeholder?: string
}

export default function KategoriCombobox({
    kategori,
    value,
    onChange,
    label = "Kategori",
    placeholder = "Masukkan kategori",
}: Props) {

    const [open, setOpen] = useState(false)

    const [editingId, setEditingId] =
        useState<number | null>(null)

    const [editValue, setEditValue] =
        useState("")

    const filteredKategori = useMemo(() => {

        return kategori.filter((item) =>
            item.kategori
                .toLowerCase()
                .includes(value.toLowerCase())
        )

    }, [kategori, value])

    const selectedKategori = useMemo(() => {

        return kategori.find(
            (item) =>
                item.kategori.toLowerCase() ===
                value.toLowerCase()
        )

    }, [kategori, value])

    const handleUpdateKategori = (
        id: number
    ) => {

        if (!editValue.trim()) {
            toast("Kategori wajib diisi")
            return
        }

        router.patch(
            `/dokumentasi/kategori/${id}`,
            {
                kategori: editValue,
            },
            {
                preserveScroll: true,

                onSuccess: () => {

                    toast(
                        "Kategori berhasil diupdate"
                    )

                    setEditingId(null)
                },

                onError: () => {
                    toast(
                        "Gagal mengupdate kategori"
                    )
                },
            }
        )
    }

    return (
        <div className="space-y-2">

            <Label>
                {label}
            </Label>

            {/* INPUT */}
            <Input
                value={value}
                onChange={(e) =>
                    onChange(e.target.value)
                }
                placeholder={placeholder}
                onFocus={() => setOpen(true)}
            />

            <Popover
                open={open}
                onOpenChange={setOpen}
            >
                <PopoverTrigger asChild>
                    <div />
                </PopoverTrigger>

                <PopoverContent
                    align="start"
                    className="
                        w-[var(--radix-popover-trigger-width)]
                        p-0
                    "
                >

                    <Command>

                        {/* TEXT TETAP */}
                        <div
                            className="
                                border-b
                                px-3
                                py-2
                                text-sm
                                text-muted-foreground
                            "
                        >
                            Kategori yang sesuai
                        </div>

                        <CommandEmpty>
                            Kategori tidak ditemukan
                        </CommandEmpty>

                        <CommandGroup className="max-h-60 overflow-auto">

                            {filteredKategori.map((item) => (

                                <CommandItem
                                    key={item.id}
                                    value={item.kategori}
                                    className="
                                        flex
                                        items-center
                                        justify-between
                                        gap-2
                                    "
                                    onSelect={() => {

                                        onChange(item.kategori)

                                        setOpen(false)
                                    }}
                                >

                                    {/* KIRI */}
                                    <div
                                        className="
                                            flex
                                            items-center
                                            gap-2
                                            flex-1
                                        "
                                    >

                                        <Check
                                            className={`
                                                h-4 w-4
                                                ${
                                                    selectedKategori?.id === item.id
                                                        ? "opacity-100"
                                                        : "opacity-0"
                                                }
                                            `}
                                        />

                                        {editingId === item.id ? (

                                            <Input
                                                autoFocus
                                                value={editValue}
                                                onChange={(e) =>
                                                    setEditValue(
                                                        e.target.value
                                                    )
                                                }
                                                onClick={(e) =>
                                                    e.stopPropagation()
                                                }
                                                onKeyDown={(e) => {

                                                    if (
                                                        e.key === "Enter"
                                                    ) {

                                                        e.preventDefault()

                                                        handleUpdateKategori(
                                                            item.id
                                                        )
                                                    }
                                                }}
                                            />

                                        ) : (

                                            <span>
                                                {item.kategori}
                                            </span>
                                        )}
                                    </div>

                                    {/* EDIT */}
                                    <Button
                                        type="button"
                                        size="icon"
                                        variant="ghost"
                                        className="h-8 w-8"
                                        onClick={(e) => {

                                            e.preventDefault()

                                            e.stopPropagation()

                                            if (
                                                editingId === item.id
                                            ) {

                                                handleUpdateKategori(
                                                    item.id
                                                )

                                            } else {

                                                setEditingId(item.id)

                                                setEditValue(
                                                    item.kategori
                                                )
                                            }
                                        }}
                                    >

                                        <Pencil className="h-4 w-4" />
                                    </Button>
                                </CommandItem>
                            ))}

                        </CommandGroup>
                    </Command>
                </PopoverContent>
            </Popover>
        </div>
    )
}