"use client"

import { Head, router, usePage } from "@inertiajs/react"

import Color from "@tiptap/extension-color"
import Highlight from "@tiptap/extension-highlight"
import LinkExtension from "@tiptap/extension-link"
import Placeholder from "@tiptap/extension-placeholder"
import TextAlign from "@tiptap/extension-text-align"
import { TextStyle } from "@tiptap/extension-text-style"
import Underline from "@tiptap/extension-underline"
import { useEditor, EditorContent } from "@tiptap/react"

import StarterKit from "@tiptap/starter-kit"
import {
    Bold,
    Heading1,
    Heading2,
    ImagePlus,
    Italic,
    Link2,
    List,
    ListOrdered,
    Pilcrow,
    Quote,
    Redo2,
    Save,
    UnderlineIcon,
    Undo2,
} from "lucide-react"
import { useEffect, useRef, useState } from "react"
import { toast } from "sonner"
import { CustomImage } from "@/components/editor/custom-image"
import ImageModal from "@/components/editor/image-modal"
import LinkModal from "@/components/editor/link-modal"


import Heading from "@/components/heading"
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from "@/components/ui/alert-dialog"
import { Button } from "@/components/ui/button"
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"




import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"

import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"

import { Separator } from "@/components/ui/separator"


interface Prodi {
    id: number
    prodi: string
    kode: string

    fakultas: {
        id: number
        fakultas: string
    } | null
}

interface ResourceGuide {
    id: number
    konten: string

    prodi: {
        id: number
        prodi: string
        kode: string

        fakultas: {
            id: number
            fakultas: string
        } | null
    } | null
}

interface Props {
    prodis: Prodi[]
    resourceGuide: ResourceGuide
}

function Toolbar({
    editor,
    onImageClick,
    onLinkClick,
}: {
    editor: any
    onImageClick: () => void
    onLinkClick: () => void
}) {

    if (!editor) {
return null
}

    const buttonClass = (active: boolean) =>
        `
        flex h-10 min-w-[40px] items-center justify-center
        rounded-lg border transition
        ${
            active
                ? "bg-primary text-primary-foreground border-primary"
                : "bg-background hover:bg-muted"
        }
    `

    return (
        <div className="mb-5 flex flex-wrap gap-2 border-b border-gray-200 pb-5 dark:border-white/10">

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleBold().run()
                }
                className={buttonClass(editor.isActive("bold"))}
            >
                <Bold className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleItalic().run()
                }
                className={buttonClass(editor.isActive("italic"))}
            >
                <Italic className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleUnderline().run()
                }
                className={buttonClass(editor.isActive("underline"))}
            >
                <UnderlineIcon className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleHeading({ level: 1 }).run()
                }
                className={buttonClass(
                    editor.isActive("heading", { level: 1 })
                )}
            >
                <Heading1 className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleHeading({ level: 2 }).run()
                }
                className={buttonClass(
                    editor.isActive("heading", { level: 2 })
                )}
            >
                <Heading2 className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleBulletList().run()
                }
                className={buttonClass(
                    editor.isActive("bulletList")
                )}
            >
                <List className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleOrderedList().run()
                }
                className={buttonClass(
                    editor.isActive("orderedList")
                )}
            >
                <ListOrdered className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().toggleBlockquote().run()
                }
                className={buttonClass(
                    editor.isActive("blockquote")
                )}
            >
                <Quote className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={onImageClick}
                className={buttonClass(false)}
            >
                <ImagePlus className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={onLinkClick}
                className={buttonClass(false)}
            >
                <Link2 className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() =>
                    editor.chain().focus().setParagraph().run()
                }
                className={buttonClass(
                    editor.isActive("paragraph")
                )}
            >
                <Pilcrow className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() => editor.chain().focus().undo().run()}
                className={buttonClass(false)}
            >
                <Undo2 className="h-4 w-4" />
            </button>

            <button
                type="button"
                onClick={() => editor.chain().focus().redo().run()}
                className={buttonClass(false)}
            >
                <Redo2 className="h-4 w-4" />
            </button>
        </div>
    )
}

export default function EditResourceGuide() {

    const {
        prodis,
        resourceGuide,
    } = usePage().props as unknown as Props

    const [prodiId, setProdiId] = useState(
        resourceGuide.prodi
            ? String(resourceGuide.prodi.id)
            : ""
    )

    const [showImageModal, setShowImageModal] =
        useState(false)

    const [showImageSetting, setShowImageSetting] =
        useState(false)

    const [imageForm, setImageForm] = useState({
        src: "",
        alt: "",
        title: "",
        align: "center",
        size: "large",
    })

    const [showLinkModal, setShowLinkModal] =
        useState(false)

    const [linkForm, setLinkForm] =
        useState({
            url: "",
            text: "",
        })

    const initialData = useRef({
        prodiId: resourceGuide.prodi
            ? String(resourceGuide.prodi.id)
            : "",
        konten: resourceGuide.konten,
    })

    const [isDirty, setIsDirty] = useState(false)

    const [showLeaveDialog, setShowLeaveDialog] =
        useState(false)

    const [pendingUrl, setPendingUrl] =
        useState<string | null>(null)

    const editor = useEditor({
        extensions: [
            StarterKit.configure({
                link: false,
            }),

            Underline,
            Highlight,
            TextStyle,
            Color,
            CustomImage,

            LinkExtension.configure({
                openOnClick: false,
                autolink: true,
                defaultProtocol: "https",
            }),

            Placeholder.configure({
                placeholder: "Tulis resource guide di sini...",
            }),

            TextAlign.configure({
                types: ["heading", "paragraph"],
            }),
        ],

        editorProps: {
            handleClick(view, pos) {

                const node =
                    view.state.doc.nodeAt(pos)

                if (node?.type.name === "image") {

                    setImageForm({
                        src: node.attrs.src,
                        alt: node.attrs.alt || "",
                        title: node.attrs.title || "",
                        align: node.attrs.align || "center",
                        size: node.attrs.size || "large",
                    })

                    setShowImageSetting(true)

                    return true
                }

                return false
            },
        },

        content: resourceGuide.konten,
    })

    useEffect(() => {

        if (!editor) {
return
}

        const checkChanges = () => {

            const currentContent =
                editor.getHTML()

            const changed =
                prodiId !== initialData.current.prodiId ||
                currentContent !== initialData.current.konten

            setIsDirty(changed)
        }

        checkChanges()

        editor.on("update", checkChanges)

        return () => {
            editor.off("update", checkChanges)
        }

    }, [
        editor,
        prodiId,
    ])

    useEffect(() => {

        const beforeUnload = (
            e: BeforeUnloadEvent
        ) => {

            if (!isDirty) {
return
}

            e.preventDefault()

            e.returnValue = ""
        }

        window.addEventListener(
            "beforeunload",
            beforeUnload
        )

        return () => {
            window.removeEventListener(
                "beforeunload",
                beforeUnload
            )
        }

    }, [isDirty])

    useEffect(() => {

        const handlePopState = () => {

            if (!isDirty) {
return
}

            window.history.pushState(
                null,
                "",
                window.location.href
            )

            setPendingUrl(document.referrer || "/resource-guide")

            setShowLeaveDialog(true)
        }

        window.history.pushState(
            null,
            "",
            window.location.href
        )

        window.addEventListener(
            "popstate",
            handlePopState
        )

        return () => {
            window.removeEventListener(
                "popstate",
                handlePopState
            )
        }

    }, [isDirty])

    const confirmLeave = (
        url: string
    ) => {

        if (!isDirty) {
            router.visit(url)

            return
        }

        setPendingUrl(url)

        setShowLeaveDialog(true)
    }

    const getNow = () =>
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

    const handleSubmit = () => {

        if (!editor) {
return
}

        if (!prodiId) {
            toast("Prodi wajib dipilih")

            return
        }

        const html = editor.getHTML()

        if (html === "<p></p>") {
            toast("Konten wajib diisi")

            return
        }

        router.put(
            `/resource-guide/${resourceGuide.id}`,
            {
                prodi_id: prodiId,
                konten: html,
            },
            {
                preserveScroll: true,

                onSuccess: () => {

                    toast(
                        "Alhamdulillah, resource guide berhasil diperbarui",
                        {
                            description: getNow(),
                        }
                    )

                    setIsDirty(false)

                    router.visit("/resource-guide")
                },

                onError: () => {
                    toast(
                        "Astaghfirullah, terjadi kesalahan"
                    )
                },
            }
        )
    }

    return (
        <>
            <Head title="Edit Resource Guide" />

            <div className="p-6 space-y-6">

                {/* HEADER */}
                <div className="flex justify-between">

                    <Heading
                        title="Edit Resource Guide"
                        description="Perbarui resource guide program studi."
                    />

                    <Button
                        variant="outline"
                        onClick={() =>
                            confirmLeave("/resource-guide")
                        }
                    >
                        Kembali
                    </Button>
                </div>

                {/* GRID */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 items-start">

                    {/* ========================= */}
                    {/* EDITOR */}
                    {/* ========================= */}
                    <div className="lg:col-span-2 space-y-4">

                        <div className="bg-muted/50 border rounded-lg p-4">

                            <Toolbar
                                editor={editor}
                                onImageClick={() =>
                                    setShowImageModal(true)
                                }
                                onLinkClick={() => {

                                    const previousUrl =
                                        editor
                                            ?.getAttributes("link")
                                            ?.href || ""

                                    const selectedText =
                                        editor
                                            ?.state.doc.textBetween(
                                                editor.state.selection.from,
                                                editor.state.selection.to,
                                                " "
                                            ) || ""

                                    setLinkForm({
                                        url: previousUrl,
                                        text: selectedText,
                                    })

                                    setShowLinkModal(true)
                                }}
                            />

                            <div
                                className="
                                    min-h-[700px]
                                    rounded-xl
                                    border
                                    bg-background
                                    p-6
                                "
                            >

                                <EditorContent
                                    editor={editor}
                                    className="
                                        tiptap
                                        prose
                                        dark:prose-invert
                                        max-w-none

                                        [&_.ProseMirror]:min-h-[650px]
                                        [&_.ProseMirror]:outline-none

                                        [&_.ProseMirror_h1]:text-4xl
                                        [&_.ProseMirror_h1]:font-black

                                        [&_.ProseMirror_h2]:text-3xl
                                        [&_.ProseMirror_h2]:font-bold

                                        [&_.ProseMirror_p]:leading-8

                                        [&_.ProseMirror_ul]:list-disc
                                        [&_.ProseMirror_ul]:ml-6

                                        [&_.ProseMirror_ol]:list-decimal
                                        [&_.ProseMirror_ol]:ml-6

                                        [&_.ProseMirror_blockquote]:border-l-4
                                        [&_.ProseMirror_blockquote]:pl-4
                                        [&_.ProseMirror_blockquote]:italic

                                        [&_.ProseMirror_img]:my-4
                                        [&_.ProseMirror_img]:rounded-none

                                        /* LINK STYLE */
                                        [&_.ProseMirror_a]:text-primary
                                        [&_.ProseMirror_a]:underline
                                        [&_.ProseMirror_a]:underline-offset-4
                                        [&_.ProseMirror_a]:font-medium
                                        [&_.ProseMirror_a]:transition-colors
                                        [&_.ProseMirror_a:hover]:opacity-80

                                        [&_.ProseMirror_p.is-editor-empty:first-child::before]:content-[attr(data-placeholder)]
                                        [&_.ProseMirror_p.is-editor-empty:first-child::before]:text-muted-foreground
                                        [&_.ProseMirror_p.is-editor-empty:first-child::before]:pointer-events-none
                                        [&_.ProseMirror_p.is-editor-empty:first-child::before]:float-left
                                        [&_.ProseMirror_p.is-editor-empty:first-child::before]:h-0
                                    "
                                />

                                <ImageModal
                                    open={showImageModal}
                                    onClose={() =>
                                        setShowImageModal(false)
                                    }
                                    uploadUrl="/resource-guide/upload-image"
                                    onInsert={(url) => {

                                        editor
                                            ?.chain()
                                            .focus()
                                            .setImage({
                                                src: url,
                                                alt: "",
                                                title: "",
                                                align: "center",
                                                size: "large",
                                            })
                                            .run()

                                        setImageForm({
                                            src: url,
                                            alt: "",
                                            title: "",
                                            align: "center",
                                            size: "large",
                                        })

                                        setShowImageSetting(true)
                                    }}
                                />

                                <LinkModal
                                    open={showLinkModal}
                                    onClose={() =>
                                        setShowLinkModal(false)
                                    }
                                    defaultUrl={linkForm.url}
                                    defaultText={linkForm.text}
                                    onRemove={() => {

                                        editor
                                            ?.chain()
                                            .focus()
                                            .unsetLink()
                                            .run()
                                    }}
                                    onInsert={(url, text) => {

                                        if (
                                            editor?.state.selection.empty &&
                                            text
                                        ) {

                                            editor
                                                ?.chain()
                                                .focus()
                                                .insertContent(
                                                    `<a href="${url}">${text}</a>`
                                                )
                                                .run()

                                        } else {

                                            editor
                                                ?.chain()
                                                .focus()
                                                .setLink({
                                                    href: url,
                                                })
                                                .run()
                                        }
                                    }}
                                />

                                <Dialog
                                    open={showImageSetting}
                                    onOpenChange={setShowImageSetting}
                                >
                                    <DialogContent className="sm:max-w-md">

                                        <DialogHeader>
                                            <DialogTitle>
                                                Pengaturan Gambar
                                            </DialogTitle>
                                        </DialogHeader>

                                        <div className="space-y-5">

                                            {/* ALT */}
                                            <div className="space-y-2">
                                                <Label>Teks Alt</Label>

                                                <Input
                                                    value={imageForm.alt}
                                                    onChange={(e) =>
                                                        setImageForm({
                                                            ...imageForm,
                                                            alt: e.target.value,
                                                        })
                                                    }
                                                />
                                            </div>

                                            {/* TITLE */}
                                            <div className="space-y-2">
                                                <Label>Teks Judul</Label>

                                                <Input
                                                    value={imageForm.title}
                                                    onChange={(e) =>
                                                        setImageForm({
                                                            ...imageForm,
                                                            title: e.target.value,
                                                        })
                                                    }
                                                />
                                            </div>

                                            {/* POSISI */}
                                            <div className="space-y-2">

                                                <Label>Posisi</Label>

                                                <div className="flex gap-2">

                                                    {[
                                                        {
                                                            label: "Kiri",
                                                            value: "left",
                                                        },

                                                        {
                                                            label: "Tengah",
                                                            value: "center",
                                                        },

                                                        {
                                                            label: "Kanan",
                                                            value: "right",
                                                        },
                                                    ].map((item) => (

                                                        <Button
                                                            key={item.value}
                                                            type="button"
                                                            variant={
                                                                imageForm.align === item.value
                                                                    ? "default"
                                                                    : "outline"
                                                            }
                                                            onClick={() =>
                                                                setImageForm({
                                                                    ...imageForm,
                                                                    align: item.value,
                                                                })
                                                            }
                                                        >
                                                            {item.label}
                                                        </Button>
                                                    ))}
                                                </div>
                                            </div>

                                            {/* UKURAN */}
                                            <div className="space-y-2">

                                                <Label>Ukuran</Label>

                                                <div className="grid grid-cols-2 gap-2">

                                                    {[
                                                        {
                                                            label: "Kecil",
                                                            value: "small",
                                                        },

                                                        {
                                                            label: "Sedang",
                                                            value: "medium",
                                                        },

                                                        {
                                                            label: "Besar",
                                                            value: "large",
                                                        },

                                                        {
                                                            label: "Full",
                                                            value: "full",
                                                        },
                                                    ].map((item) => (

                                                        <Button
                                                            key={item.value}
                                                            type="button"
                                                            variant={
                                                                imageForm.size === item.value
                                                                    ? "default"
                                                                    : "outline"
                                                            }
                                                            onClick={() =>
                                                                setImageForm({
                                                                    ...imageForm,
                                                                    size: item.value,
                                                                })
                                                            }
                                                        >
                                                            {item.label}
                                                        </Button>
                                                    ))}
                                                </div>
                                            </div>

                                            <Button
                                                className="w-full"
                                                onClick={() => {

                                                    editor
                                                        ?.chain()
                                                        .focus()
                                                        .updateAttributes("image", {
                                                            alt: imageForm.alt,
                                                            title: imageForm.title,
                                                            align: imageForm.align,
                                                            size: imageForm.size,
                                                        })
                                                        .run()

                                                    setShowImageSetting(false)
                                                }}
                                            >
                                                Simpan Pengaturan
                                            </Button>
                                        </div>
                                    </DialogContent>
                                </Dialog>
                            </div>
                        </div>
                    </div>

                    {/* ========================= */}
                    {/* SIDEBAR */}
                    {/* ========================= */}
                    <div className="space-y-4 lg:sticky lg:top-6">

                        <div className="bg-muted/50 border rounded-lg p-4 space-y-4">

                            <h3 className="font-semibold text-base">
                                Informasi Resource Guide
                            </h3>

                            <Separator />

                            {/* PRODI */}
                            <div className="space-y-2">
                                <Label>
                                    Program Studi
                                </Label>

                                <Select
                                    value={prodiId}
                                    onValueChange={setProdiId}
                                >
                                    <SelectTrigger className="w-full">
                                        <SelectValue placeholder="Pilih prodi..." />
                                    </SelectTrigger>

                                    <SelectContent align="start">
                                        {prodis.map((item) => (
                                            <SelectItem
                                                key={item.id}
                                                value={String(item.id)}
                                            >
                                                {item.prodi}
                                                {item.fakultas
                                                    ? ` — ${item.fakultas.fakultas}`
                                                    : ""}
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>

                            {/* BUTTON */}
                            <Button
                                onClick={handleSubmit}
                                className="w-full gap-2"
                            >
                                <Save className="h-4 w-4" />

                                Update Resource Guide
                            </Button>
                        </div>
                    </div>
                </div>
            </div>

            {/* Popup Dialog */}
            <AlertDialog
                open={showLeaveDialog}
                onOpenChange={setShowLeaveDialog}
            >

                <AlertDialogContent size="sm">

                    <AlertDialogHeader>

                        <AlertDialogTitle>
                            Perubahan Belum Disimpan
                        </AlertDialogTitle>

                        <AlertDialogDescription>
                            Jika keluar sekarang,
                            perubahan resource guide akan hilang.
                        </AlertDialogDescription>

                    </AlertDialogHeader>

                    <AlertDialogFooter>

                        <AlertDialogCancel>
                            Tetap di Halaman
                        </AlertDialogCancel>

                        <AlertDialogAction
                            onClick={() => {

                                setShowLeaveDialog(false)

                                setIsDirty(false)

                                if (pendingUrl) {
                                    router.visit(pendingUrl)
                                }
                            }}
                        >
                            Keluar Halaman
                        </AlertDialogAction>

                    </AlertDialogFooter>

                </AlertDialogContent>

            </AlertDialog>
        </>
    )
}


EditResourceGuide.layout = {
    breadcrumbs: [
        {
            title: "Resource Guide",
            href: "/resource-guide",
        },
        {
            title: "Edit Resource Guide",
            href: "/resource-guide",
        },
    ],
}
