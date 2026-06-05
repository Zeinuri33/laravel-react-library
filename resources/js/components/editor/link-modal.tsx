"use client"

import {
    Dialog,
    DialogContent,
    DialogHeader,
} from "@/components/ui/dialog"

import Heading from "@/components/heading"

import { Separator } from "@/components/ui/separator"

import { Label } from "@/components/ui/label"

import { Input } from "@/components/ui/input"

import { Button } from "@/components/ui/button"

import { Link2, Trash2 } from "lucide-react"

import { useEffect, useState } from "react"

interface Props {
    open: boolean

    onClose: () => void

    onInsert: (
        url: string,
        text: string
    ) => void

    onRemove?: () => void

    defaultUrl?: string

    defaultText?: string
}

export default function LinkModal({
    open,
    onClose,
    onInsert,
    onRemove,
    defaultUrl = "",
    defaultText = "",
}: Props) {

    const [url, setUrl] =
        useState(defaultUrl)

    const [text, setText] =
        useState(defaultText)

    useEffect(() => {

        if (open) {

            setUrl(defaultUrl)

            setText(defaultText)
        }

    }, [
        open,
        defaultUrl,
        defaultText,
    ])

    const handleClose = () => {

        setUrl("")

        setText("")

        onClose()
    }

    return (
        <Dialog
            open={open}
            onOpenChange={handleClose}
        >

            <DialogContent className="sm:max-w-md">

                <DialogHeader>

                    <Heading
                        variant="small"
                        title="Tambah Link"
                        description="Tambahkan link ke dokumentasi."
                    />

                    <Separator />
                </DialogHeader>

                <div className="space-y-4">

                    {/* TEXT */}
                    <div className="space-y-2">

                        <Label>
                            Teks Link
                        </Label>

                        <Input
                            placeholder="Contoh: Website Saya"
                            value={text}
                            onChange={(e) =>
                                setText(
                                    e.target.value
                                )
                            }
                        />
                    </div>

                    {/* URL */}
                    <div className="space-y-2">

                        <Label>
                            URL
                        </Label>

                        <Input
                            placeholder="https://..."
                            value={url}
                            onChange={(e) =>
                                setUrl(
                                    e.target.value
                                )
                            }
                        />
                    </div>

                    <div className="flex flex-col gap-2 sm:flex-row">
                        {onRemove && (
                            <Button
                                type="button"
                                variant="outline"
                                className="flex-1"
                                onClick={() => {

                                    onRemove()

                                    handleClose()
                                }}
                            >

                                <Trash2 className="mr-2 h-4 w-4" />

                                Hapus
                            </Button>
                        )}

                        <Button
                            type="button"
                            className="flex-1"
                            onClick={() => {

                                if (!url) return

                                onInsert(
                                    url,
                                    text
                                )

                                handleClose()
                            }}
                        >

                            <Link2 className="mr-2 h-4 w-4" />

                            Simpan Link
                        </Button>
                    </div>
                </div>
            </DialogContent>
        </Dialog>
    )
}