"use client"

import {
    Dialog,
    DialogContent,
    DialogHeader,
} from "@/components/ui/dialog"

import {
    Tabs,
    TabsContent,
    TabsList,
    TabsTrigger,
} from "@/components/ui/tabs"

import { Button } from "@/components/ui/button"

import { Input } from "@/components/ui/input"

import { Label } from "@/components/ui/label"

import { Separator } from "@/components/ui/separator"

import Heading from "@/components/heading"

import {
    ImagePlus,
    Link2,
    Upload,
    X,
    Loader2,
} from "lucide-react"

import {
    useEffect,
    useRef,
    useState,
} from "react"

interface Props {
    open: boolean
    onClose: () => void
    onInsert: (url: string) => void
}

export default function ImageModal({
    open,
    onClose,
    onInsert,
}: Props) {

    const [tab, setTab] =
        useState<"url" | "upload">("url")

    const [url, setUrl] = useState("")

    const [uploading, setUploading] =
        useState(false)

    const [preview, setPreview] =
        useState<string | null>(null)

    const fileRef =
        useRef<HTMLInputElement | null>(null)

    const resetModal = () => {
        setTab("url")
        setUrl("")
        setUploading(false)
        setPreview(null)

        if (fileRef.current) {
            fileRef.current.value = ""
        }
    }

    useEffect(() => {
        if (!open) {
            resetModal()
        }
    }, [open])

    const handleClose = () => {
        resetModal()
        onClose()
    }

    const handleUpload = async (
        e: React.ChangeEvent<HTMLInputElement>
    ) => {

        const file = e.target.files?.[0]

        if (!file) return

        setPreview(
            URL.createObjectURL(file)
        )

        const formData = new FormData()

        formData.append("image", file)

        try {

            setUploading(true)

            const response = await fetch(
                "/dokumentasi/upload-image",
                {
                    method: "POST",

                    body: formData,

                    headers: {
                        "X-Requested-With":
                            "XMLHttpRequest",

                        "X-CSRF-TOKEN":
                            (
                                document.querySelector(
                                    'meta[name="csrf-token"]'
                                ) as HTMLMetaElement
                            )?.content || "",
                    },
                }
            )

            const data = await response.json()

            if (data.url) {

                onInsert(data.url)

                resetModal()

                onClose()
            }

        } catch (error) {

            console.error(error)

            alert("Upload gagal")
        } finally {

            setUploading(false)
        }
    }

    return (
        <Dialog
            open={open}
            onOpenChange={handleClose}
        >

            <DialogContent>

                <DialogHeader>

                    <Heading
                        variant="small"
                        title="Insert Image"
                        description="Upload gambar atau gunakan URL gambar."
                    />

                    <Separator />
                </DialogHeader>

                <Tabs
                    value={tab}
                    onValueChange={(v) =>
                        setTab(
                            v as
                                | "url"
                                | "upload"
                        )
                    }
                    className="w-full"
                >

                    <TabsList className="grid w-full grid-cols-2">

                        <TabsTrigger value="url">
                            <Link2 className="mr-2 h-4 w-4" />
                            Via URL
                        </TabsTrigger>

                        <TabsTrigger value="upload">
                            <Upload className="mr-2 h-4 w-4" />
                            Upload
                        </TabsTrigger>
                    </TabsList>

                    {/* URL */}
                    <TabsContent
                        value="url"
                        className="space-y-4 pt-4"
                    >

                        <div>
                            <Label className="pb-2">
                                URL Gambar
                            </Label>

                            <Input
                                type="text"
                                placeholder="https://..."
                                value={url}
                                onChange={(e) =>
                                    setUrl(
                                        e.target.value
                                    )
                                }
                            />
                        </div>

                        {url && (
                            <div
                                className="
                                    overflow-hidden
                                    rounded-lg
                                    border
                                    bg-muted
                                "
                            >

                                <img
                                    src={url}
                                    alt="Preview"
                                    className="
                                        max-h-[300px]
                                        w-full
                                        object-contain
                                    "
                                />
                            </div>
                        )}

                        <Button
                            type="button"
                            className="w-full"
                            onClick={() => {

                                if (!url) return

                                onInsert(url)

                                resetModal()

                                onClose()
                            }}
                        >

                            <ImagePlus className="mr-2 h-4 w-4" />

                            Insert Image
                        </Button>
                    </TabsContent>

                    {/* Upload */}
                    <TabsContent
                        value="upload"
                        className="space-y-4 pt-4"
                    >

                        <div className="space-y-2 text-center">

                            <Label className="block">
                                Upload Gambar
                            </Label>

                            <div className="flex justify-center">

                                <div className="relative h-28 w-28">

                                    <label
                                        className="
                                            block
                                            h-28 w-28
                                            cursor-pointer
                                        "
                                    >

                                        <div
                                            className="
                                                flex h-28 w-28
                                                items-center
                                                justify-center

                                                overflow-hidden
                                                rounded-xl
                                                border
                                                bg-muted
                                            "
                                        >

                                            {preview ? (
                                                <img
                                                    src={
                                                        preview
                                                    }
                                                    alt="Preview"
                                                    className="
                                                        h-full
                                                        w-full
                                                        object-cover
                                                    "
                                                />
                                            ) : uploading ? (
                                                <Loader2
                                                    className="
                                                        h-6 w-6
                                                        animate-spin
                                                        text-muted-foreground
                                                    "
                                                />
                                            ) : (
                                                <Upload
                                                    className="
                                                        h-6 w-6
                                                        text-muted-foreground
                                                    "
                                                />
                                            )}
                                        </div>

                                        <div
                                            className="
                                                absolute inset-0
                                                flex items-center
                                                justify-center

                                                rounded-xl
                                                bg-black/40

                                                opacity-0
                                                transition

                                                hover:opacity-100
                                            "
                                        >

                                            <span
                                                className="
                                                    text-xs
                                                    text-white
                                                "
                                            >
                                                Upload
                                            </span>
                                        </div>

                                        <Input
                                            ref={fileRef}
                                            type="file"
                                            accept="image/*"
                                            className="hidden"
                                            onChange={
                                                handleUpload
                                            }
                                        />
                                    </label>

                                    {preview && (
                                        <button
                                            type="button"
                                            onClick={() => {

                                                setPreview(
                                                    null
                                                )

                                                if (
                                                    fileRef.current
                                                ) {
                                                    fileRef.current.value =
                                                        ""
                                                }
                                            }}
                                            className="
                                                absolute bottom-0 right-0

                                                flex h-7 w-7
                                                items-center
                                                justify-center

                                                rounded-full
                                                bg-red-500
                                                text-white
                                                shadow
                                            "
                                        >

                                            <X className="h-4 w-4" />
                                        </button>
                                    )}
                                </div>
                            </div>

                            <p
                                className="
                                    text-sm
                                    text-muted-foreground
                                "
                            >
                                Klik gambar untuk upload
                            </p>
                        </div>

                        <Button
                            type="button"
                            variant="outline"
                            className="w-full"
                            onClick={() =>
                                fileRef.current?.click()
                            }
                            disabled={uploading}
                        >

                            {uploading ? (
                                <>
                                    <Loader2
                                        className="
                                            mr-2 h-4 w-4
                                            animate-spin
                                        "
                                    />

                                    Uploading...
                                </>
                            ) : (
                                <>
                                    <Upload
                                        className="
                                            mr-2 h-4 w-4
                                        "
                                    />

                                    Pilih Gambar
                                </>
                            )}
                        </Button>
                    </TabsContent>
                </Tabs>
            </DialogContent>
        </Dialog>
    )
}


