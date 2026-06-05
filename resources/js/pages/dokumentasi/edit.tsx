"use client"

import { Head, router, usePage, Link } from "@inertiajs/react"

import { useEditor, EditorContent } from "@tiptap/react"

import StarterKit from "@tiptap/starter-kit"
import Underline from "@tiptap/extension-underline"
import TextAlign from "@tiptap/extension-text-align"
import Highlight from "@tiptap/extension-highlight"
import { CustomImage } from "@/components/editor/custom-image"
import LinkExtension from "@tiptap/extension-link"
import { TextStyle } from "@tiptap/extension-text-style"
import Color from "@tiptap/extension-color"
import Placeholder from "@tiptap/extension-placeholder"
import KategoriCombobox from "@/components/ui/kategori-combobox"
import LinkModal from "@/components/editor/link-modal"


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

import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog"

import { useEffect, useState } from "react"

import Heading from "@/components/heading"
import ImageModal from "@/components/editor/image-modal"

import { toast } from "sonner"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"

import { Separator } from "@/components/ui/separator"

import { useRef } from "react"

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

interface Kategori {
    id: number
    kategori: string
}

interface Dokumentasi {
    id: number
    judul: string
    konten: string

    kategori: {
        id: number
        kategori: string
    }
}

interface Props {
    kategori: Kategori[]
    dokumentasi: Dokumentasi
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

    if (!editor) return null

    // const addLink = () => {
    //     const url = window.prompt("Masukkan URL")

    //     if (url) {
    //         editor.chain().focus().setLink({ href: url }).run()
    //     }
    // }

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

export default function EditDokumentasi() {

    const {
        kategori,
        dokumentasi,
    } = usePage().props as unknown as Props

    const [judul, setJudul] = useState(
        dokumentasi.judul
    )

    const [kategoriInput, setKategoriInput] =
        useState(
            dokumentasi.kategori.kategori
        )

    const selectedKategori = kategori.find(
        (item) =>
            item.kategori.toLowerCase() ===
            kategoriInput.toLowerCase()
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
        judul: dokumentasi.judul,
        kategori: dokumentasi.kategori.kategori,
        konten: dokumentasi.konten,
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
                placeholder: "Tulis dokumentasi di sini...",
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

        content: dokumentasi.konten,
    })

    useEffect(() => {

        if (!editor) return

        const checkChanges = () => {

            const currentContent =
                editor.getHTML()

            const changed =
                judul !== initialData.current.judul ||
                kategoriInput !== initialData.current.kategori ||
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
        judul,
        kategoriInput,
    ])

    useEffect(() => {

        const beforeUnload = (
            e: BeforeUnloadEvent
        ) => {

            if (!isDirty) return

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

            if (!isDirty) return

            window.history.pushState(
                null,
                "",
                window.location.href
            )

            setPendingUrl(document.referrer || "/dokumentasi")

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

        if (!editor) return

        if (!kategoriInput.trim()) {
            toast("Kategori wajib diisi")
            return
        }

        if (!judul.trim()) {
            toast("Judul wajib diisi")
            return
        }

        const html = editor.getHTML()

        if (html === "<p></p>") {
            toast("Konten wajib diisi")
            return
        }

        router.put(
            `/dokumentasi/${dokumentasi.id}`,
            {
                kategori: kategoriInput,
                judul,
                konten: html,
            },
            {
                preserveScroll: true,

                onSuccess: () => {

                    toast(
                        "Alhamdulillah, dokumentasi berhasil diperbarui",
                        {
                            description: getNow(),
                        }
                    )

                    setIsDirty(false)

                    router.visit("/dokumentasi")
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
            <Head title="Edit Dokumentasi" />

            <div className="p-6 space-y-6">

                {/* HEADER */}
                <div className="flex justify-between">

                    <Heading
                        title="Edit Dokumentasi"
                        description="Perbarui dokumentasi website."
                    />

                    <Button
                        variant="outline"
                        onClick={() =>
                            confirmLeave("/dokumentasi")
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
                                />`

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
                                Informasi Dokumentasi
                            </h3>

                            <Separator />

                            {/* JUDUL */}
                            <div>
                                <Label className="pb-2">
                                    Judul Dokumentasi
                                </Label>

                                <Input
                                    value={judul}
                                    onChange={(e) =>
                                        setJudul(e.target.value)
                                    }
                                    placeholder="Masukkan judul dokumentasi..."
                                />
                            </div>

                            <KategoriCombobox
                                kategori={kategori}
                                value={kategoriInput}
                                onChange={setKategoriInput}
                            />

                            {/* BUTTON */}
                            <Button
                                onClick={handleSubmit}
                                className="w-full gap-2"
                            >
                                <Save className="h-4 w-4" />

                                Update Dokumentasi
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
                            perubahan dokumentasi akan hilang.
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


EditDokumentasi.layout = {
    breadcrumbs: [
        {
            title: "Dokumentasi",
            href: `/dokumentasi`,
        },
        {
            title: "Edit Dokumentasi",
            href: `/dokumentasi`,
        },
    ],
}