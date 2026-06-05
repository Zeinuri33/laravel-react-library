import "@tiptap/extension-image"

declare module "@tiptap/extension-image" {

    interface ImageOptions {
        inline?: boolean
        allowBase64?: boolean
        HTMLAttributes?: Record<string, any>
    }

    interface SetImageOptions {
        src: string
        alt?: string
        title?: string

        align?: "left" | "center" | "right"

        size?:
            | "small"
            | "medium"
            | "large"
            | "full"
    }
}