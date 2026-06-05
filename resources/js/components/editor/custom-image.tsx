import Image from "@tiptap/extension-image"

export const CustomImage = Image.extend({
    addAttributes() {
        return {
            ...this.parent?.(),

            alt: {
                default: null,
            },

            title: {
                default: null,
            },

            align: {
                default: "center",
                renderHTML: (attributes) => {
                    return {
                        class:
                            attributes.align === "left"
                                ? "mr-auto"
                                : attributes.align === "right"
                                  ? "ml-auto"
                                  : "mx-auto",
                    }
                },
            },

            size: {
                default: "large",

                renderHTML: (attributes) => {
                    let sizeClass = ""

                    switch (attributes.size) {
                        case "small":
                            sizeClass = "w-1/4"
                            break

                        case "medium":
                            sizeClass = "w-1/2"
                            break

                        case "large":
                            sizeClass = "w-3/4"
                            break

                        case "full":
                            sizeClass = "w-full"
                            break

                        default:
                            sizeClass = "w-3/4"
                    }

                    return {
                        class: sizeClass,
                    }
                },
            },
        }
    },

    renderHTML({ HTMLAttributes }) {
        return [
            "img",
            {
                ...HTMLAttributes,
                class: `
                    my-4
                    block
                    ${HTMLAttributes.class || ""}
                `,
            },
        ]
    },
})