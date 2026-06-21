import { Form, Head } from '@inertiajs/react'
import InputError from '@/components/input-error'
import PasswordInput from '@/components/password-input'
import TextLink from '@/components/text-link'
import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Spinner } from '@/components/ui/spinner'
import { store } from '@/routes/login'
import { request } from '@/routes/password'
import { useTheme } from '@/context/ThemeContext'

type Props = {
    status?: string
    canResetPassword: boolean
}

export default function Login({
    status,
    canResetPassword,
}: Props) {
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

            checkbox:
                'border-emerald-500/30 data-[state=checked]:bg-emerald-500',

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

            checkbox:
                'border-red-500/30 data-[state=checked]:bg-red-500',

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

            checkbox:
                'border-indigo-500/30 data-[state=checked]:bg-indigo-500',

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
            <Head title="Log in" />

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
                    {...store.form()}
                    resetOnSuccess={['password']}
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
                                {/* Username */}
                                <div className="space-y-2">
                                    <Label
                                        htmlFor="username"
                                        className="text-foreground/90"
                                    >
                                        Username
                                    </Label>

                                    <Input
                                        id="username"
                                        type="text"
                                        name="username"
                                        required
                                        autoFocus
                                        tabIndex={1}
                                        autoComplete="username"
                                        placeholder="Masukkan username Anda"
                                        className={`
                                            bg-background/70
                                            transition-all duration-200
                                            ${tc.border}
                                            ${tc.ring}
                                        `}
                                    />

                                    <InputError message={errors.username} />
                                </div>

                                {/* Password */}
                                <div className="space-y-2">
                                    <Label
                                        htmlFor="password"
                                        className="text-foreground/90"
                                    >
                                        Password
                                    </Label>

                                    <PasswordInput
                                        id="password"
                                        name="password"
                                        required
                                        tabIndex={2}
                                        autoComplete="current-password"
                                        placeholder="••••••••"
                                        className={`
                                            bg-background/70
                                            transition-all duration-200
                                            ${tc.border}
                                            ${tc.ring}
                                        `}
                                    />

                                    <InputError message={errors.password} />
                                </div>

                                {/* Remember Me */}
                                <div className="mt-1 flex items-center justify-between">
                                    <div className="flex items-center space-x-2">
                                        <Checkbox
                                            id="remember"
                                            name="remember"
                                            tabIndex={3}
                                            className={`
                                                rounded-[4px]
                                                ${tc.checkbox}
                                            `}
                                        />

                                        <Label
                                            htmlFor="remember"
                                            className="cursor-pointer text-sm font-medium leading-none text-muted-foreground"
                                        >
                                            Remember me
                                        </Label>
                                    </div>

                                    {canResetPassword && (
                                        <TextLink
                                            href={request()}
                                            className={`
                                                text-sm font-medium
                                                transition-colors
                                                hover:underline
                                                ${tc.text}
                                            `}
                                            tabIndex={5}
                                        >
                                            Lupa Password?
                                        </TextLink>
                                    )}
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
                                    tabIndex={4}
                                    disabled={processing}
                                    data-test="login-button"
                                >
                                    {processing ? (
                                        <>
                                            <Spinner className="mr-2 h-4 w-4 animate-spin" />
                                            Memproses...
                                        </>
                                    ) : (
                                        'Log in'
                                    )}
                                </Button>
                            </div>

                            {/* Register */}
                            {/* {canRegister && (
                                <div className="mt-4 flex flex-col items-center gap-4">
                                    <div className="relative w-full">
                                        <div className="absolute inset-0 flex items-center">
                                            <span className="w-full border-t border-muted/60" />
                                        </div>

                                        <div className="relative flex justify-center text-xs uppercase">
                                            <span className="bg-background px-2 text-muted-foreground">
                                                Atau
                                            </span>
                                        </div>
                                    </div>

                                    <div className="text-center text-sm text-muted-foreground">
                                        Belum punya akun?{' '}
                                        <TextLink
                                            href={register()}
                                            tabIndex={5}
                                            className="font-semibold hover:underline"
                                        >
                                            Daftar sekarang
                                        </TextLink>
                                    </div>
                                </div>
                            )} */}
                        </>
                    )}
                </Form>
            </div>
        </>
    )
}

Login.layout = {
    title: 'Selamat Datang Kembali',
    description:
        'Silahkan masukkan username dan password Anda untuk melanjutkan.',
}