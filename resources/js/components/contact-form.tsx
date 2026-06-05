"use client"

import { motion } from "framer-motion"
import { useForm } from "@inertiajs/react"
import { toast } from "sonner"

type Props = {
    tc: {
        ring: string
        bgGradient: string
        textWhite: string
        shadow: string
    }
}

export default function ContactForm({ tc }: Props) {
    const { data, setData, post, processing, reset, errors } = useForm({
        nama: '',
        kontak: '',
        subjek: '',
        pesan: '',
    })

    const submit = (e: React.FormEvent) => {
        e.preventDefault()
        
        post('/usulan', {
            preserveScroll: true,

            onSuccess: () => {
                reset()

                toast.success('Pesan berhasil dikirim', {
                    description:
                        'Terima kasih telah menghubungi kami. Balasan akan dikirimkan melalui DM WhatsApp.',
                })
            },

            onError: () => {
                toast.error('Gagal mengirim pesan', {
                    description:
                        'Silakan periksa kembali data yang Anda masukkan.',
                })
            },
        })
    }

    return (
        <motion.div
            className="rounded-xl border border-white/40 bg-white/60 p-10 shadow-[0_20px_40px_rgb(0,0,0,0.06)] backdrop-blur-2xl dark:border-gray-800/40 dark:bg-gray-900/60"
            initial={{ opacity: 0, x: 40, scale: 0.98 }}
            whileInView={{ opacity: 1, x: 0, scale: 1 }}
            viewport={{ once: true, amount: 0.3 }}
            transition={{ duration: 0.6, ease: 'easeOut' }}
        >
            <motion.form
                onSubmit={submit}
                className="space-y-5"
                initial="hidden"
                whileInView="show"
                viewport={{ once: true }}
                variants={{
                    hidden: {},
                    show: {
                        transition: {
                            staggerChildren: 0.08,
                        },
                    },
                }}
            >
                {[
                    {
                        label: 'Nama',
                        type: 'text',
                        placeholder: 'Nama Anda',
                        name: 'nama',
                    },
                    {
                        label: 'No. WhatsApp',
                        type: 'text',
                        placeholder: '08xxxxxxxxxx',
                        name: 'kontak',
                    },
                    {
                        label: 'Subjek',
                        type: 'text',
                        placeholder: 'Topik pesan',
                        name: 'subjek',
                    },
                ].map((field, i) => (
                    <motion.div
                        key={i}
                        variants={{
                            hidden: { opacity: 0, y: 15 },
                            show: { opacity: 1, y: 0 },
                        }}
                    >
                        <label className="text-sm font-medium text-gray-700 dark:text-gray-300">
                            {field.label}
                        </label>

                        <input
                            type={field.type}
                            placeholder={field.placeholder}
                            value={data[field.name as keyof typeof data]}
                            onChange={(e) =>
                                setData(field.name as keyof typeof data, e.target.value)
                            }
                            className={`mt-2 w-full rounded-md border border-gray-200 bg-white/80 px-5 py-3.5 text-gray-900 shadow-sm transition-all duration-300 focus:border-transparent focus:outline-none focus:ring-2 dark:border-gray-700 dark:bg-gray-900/80 dark:text-white ${tc.ring}`}
                        />

                        {errors[field.name as keyof typeof errors] && (
                            <p className="mt-1 text-sm text-red-500">
                                {errors[field.name as keyof typeof errors]}
                            </p>
                        )}
                    </motion.div>
                ))}

                {/* TEXTAREA */}
                <motion.div
                    variants={{
                        hidden: { opacity: 0, y: 15 },
                        show: { opacity: 1, y: 0 },
                    }}
                >
                    <label className="text-sm font-medium text-gray-700 dark:text-gray-300">
                        Pesan
                    </label>

                    <textarea
                        rows={4}
                        placeholder="Tulis pesan Anda..."
                        value={data.pesan}
                        onChange={(e) => setData('pesan', e.target.value)}
                        className={`mt-2 w-full rounded-md border border-gray-200 bg-white/80 px-5 py-3.5 text-gray-900 shadow-sm transition-all duration-300 focus:border-transparent focus:outline-none focus:ring-2 dark:border-gray-700 dark:bg-gray-900/80 dark:text-white ${tc.ring}`}
                    />

                    {errors.pesan && (
                        <p className="mt-1 text-sm text-red-500">
                            {errors.pesan}
                        </p>
                    )}
                </motion.div>

                {/* BUTTON */}
                <motion.button
                    whileHover={{ scale: 1.02 }}
                    whileTap={{ scale: 0.98 }}
                    type="submit"
                    disabled={processing}
                    className={`inline-flex w-full cursor-pointer items-center justify-center gap-2 rounded-md px-4 py-4 text-base font-bold tracking-wide shadow-lg transition-all duration-300 hover:scale-[1.02] focus:ring-2 focus:ring-offset-2 focus:outline-none active:scale-[0.98] disabled:pointer-events-none disabled:opacity-50 ${tc.bgGradient} ${tc.textWhite} ${tc.shadow} ${tc.ring}`}
                >
                    {processing ? 'Mengirim...' : 'Kirim Pesan'}
                </motion.button>
            </motion.form>
        </motion.div>
    )
}