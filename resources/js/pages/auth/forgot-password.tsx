// Components
import { Form, Head } from '@inertiajs/react'
import { LoaderCircle } from 'lucide-react'
import InputError from '@/components/input-error'
import TextLink from '@/components/text-link'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { login } from '@/routes'
import { email } from '@/routes/password'
import { useTheme } from '@/context/ThemeContext'

export default function ForgotPassword({
    status,
}: {
    status?: string
}) {
    const { themeAccent } = useTheme()

    const themeStyles = {
        emerald: {
            border: 'focus:border-emerald-500',
            ring: 'focus:ring-emerald-500/20 dark:focus:ring-emerald-500/30',

            grid:
                'bg-[linear-gradient(to_right,rgba(16,185,129,0.08)_1px,transparent_1px),linear-gradient(to_bottom,rgba(16,185,129,0.08)_1px,transparent_1px)] dark:bg-[linear-gradient(to_right,rgba(16,185,129,0.06)_1px,transparent_1px),linear-gradient(to_bottom,rgba(16,185,129,0.06)_1px,transparent_1px)]',

            glowTop: 'bg-emerald-500/20 dark:bg-emerald-500/10',
            glowBottom: 'bg-emerald-400/10 dark:bg-emerald-400/10',

            button:
                'bg-emerald-500 hover:bg-emerald-400 shadow-emerald-500/20 hover:shadow-emerald-500/30',

            text: 'text-emerald-500 hover:text-emerald-400',

            card:
                'border-emerald-500/10 shadow-emerald-500/5',
        },

        red: {
            border: 'focus:border-red-500',
            ring: 'focus:ring-red-500/20 dark:focus:ring-red-500/30',

            grid:
                'bg-[linear-gradient(to_right,rgba(239,68,68,0.08)_1px,transparent_1px),linear-gradient(to_bottom,rgba(239,68,68,0.08)_1px,transparent_1px)] dark:bg-[linear-gradient(to_right,rgba(239,68,68,0.06)_1px,transparent_1px),linear-gradient(to_bottom,rgba(239,68,68,0.06)_1px,transparent_1px)]',

            glowTop: 'bg-red-500/20 dark:bg-red-500/10',
            glowBottom: 'bg-red-400/10 dark:bg-red-400/10',

            button:
                'bg-red-500 hover:bg-red-400 shadow-red-500/20 hover:shadow-red-500/30',

            text: 'text-red-500 hover:text-red-400',

            card:
                'border-red-500/10 shadow-red-500/5',
        },

        indigo: {
            border: 'focus:border-indigo-500',
            ring: 'focus:ring-indigo-500/20 dark:focus:ring-indigo-500/30',

            grid:
                'bg-[linear-gradient(to_right,rgba(99,102,241,0.08)_1px,transparent_1px),linear-gradient(to_bottom,rgba(99,102,241,0.08)_1px,transparent_1px)] dark:bg-[linear-gradient(to_right,rgba(99,102,241,0.06)_1px,transparent_1px),linear-gradient(to_bottom,rgba(99,102,241,0.06)_1px,transparent_1px)]',

            glowTop: 'bg-indigo-500/20 dark:bg-indigo-500/10',
            glowBottom: 'bg-indigo-400/10 dark:bg-indigo-400/10',

            button:
                'bg-indigo-500 hover:bg-indigo-400 shadow-indigo-500/20 hover:shadow-indigo-500/30',

            text: 'text-indigo-500 hover:text-indigo-400',

            card:
                'border-indigo-500/10 shadow-indigo-500/5',
        },
    }

    const tc =
        themeStyles[
            themeAccent as keyof typeof themeStyles
        ]

    return (
        <>
            <Head title="Forgot password" />

            {/* Background Grid + Glow */}
            <div className="pointer-events-none absolute inset-0 overflow-hidden">
                {/* Grid */}
                <div
                    className={`
                        absolute inset-0
                        bg-[size:40px_40px]
                        ${tc.grid}
                    `}
                />

                {/* Glow Top */}
                <div
                    className={`
                        absolute left-1/2 top-0
                        h-[350px] w-[350px]
                        -translate-x-1/2
                        rounded-full blur-3xl
                        ${tc.glowTop}
                    `}
                />

                {/* Glow Bottom */}
                <div
                    className={`
                        absolute bottom-0 right-0
                        h-[250px] w-[250px]
                        rounded-full blur-3xl
                        ${tc.glowBottom}
                    `}
                />
            </div>

            <div className="relative z-10">
                {/* Status */}
                {status && (
                    <div className="mb-6 flex items-center rounded-lg border border-green-200 bg-green-50 p-4 text-sm font-medium text-green-700 dark:border-green-900/50 dark:bg-green-900/20 dark:text-green-400">
                        <svg
                            className="mr-2 h-4 w-4 flex-shrink-0"
                            fill="currentColor"
                            viewBox="0 0 20 20"
                        >
                            <path
                                fillRule="evenodd"
                                d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                clipRule="evenodd"
                            />
                        </svg>

                        {status}
                    </div>
                )}

                <Form
                    {...email.form()}
                    className={`
                        relative
                        flex flex-col gap-6
                        rounded-2xl
                        border
                        bg-background/80
                        p-6
                        shadow-2xl
                        backdrop-blur-xl
                        animate-in fade-in slide-in-from-bottom-4 duration-500
                        ${tc.card}
                    `}
                >
                    {({ processing, errors }) => (
                        <>
                            <div className="grid gap-5">
                                {/* Email */}
                                <div className="space-y-2">
                                    <Label
                                        htmlFor="email"
                                        className="text-foreground/90"
                                    >
                                        Alamat Email
                                    </Label>

                                    <Input
                                        id="email"
                                        type="email"
                                        name="email"
                                        autoComplete="off"
                                        autoFocus
                                        placeholder="email@example.com"
                                        className={`
                                            bg-background/70
                                            transition-all duration-200
                                            ${tc.border}
                                            ${tc.ring}
                                        `}
                                    />

                                    <InputError message={errors.email} />
                                </div>

                                {/* Submit */}
                                <Button
                                    type="submit"
                                    className={`
                                        mt-2 w-full
                                        font-semibold text-white
                                        shadow-lg
                                        transition-all
                                        active:scale-[0.98]
                                        ${tc.button}
                                    `}
                                    disabled={processing}
                                    data-test="email-password-reset-link-button"
                                >
                                    {processing && (
                                        <LoaderCircle className="mr-2 h-4 w-4 animate-spin" />
                                    )}

                                    Tautan setel ulang kata sandi email
                                </Button>
                            </div>

                            {/* Back Login */}
                            <div className="text-center text-sm text-muted-foreground">
                                <span>Atau, kembali ke halaman </span>

                                <TextLink
                                    href={login()}
                                    className={`
                                        font-medium transition-colors
                                        hover:underline
                                        ${tc.text}
                                    `}
                                >
                                    log in
                                </TextLink>
                            </div>
                        </>
                    )}
                </Form>
            </div>
        </>
    )
}

ForgotPassword.layout = {
    title: 'Lupa Password',
    description:
        'Masukkan email Anda untuk menerima tautan pengaturan ulang kata sandi, atau menghubungi bagian IT Perpustakaan.',
}