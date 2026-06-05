import { Link } from '@inertiajs/react';
import AppLogoIcon from '@/components/app-logo-icon';
import { home } from '@/routes';
import type { AuthLayoutProps } from '@/types';

export default function AuthSimpleLayout({
    children,
    title,
    description,
}: AuthLayoutProps) {
    return (
        <div className="flex min-h-svh flex-col items-center justify-center gap-6 bg-background p-6 md:p-10">
            <div className="w-full max-w-sm">
                <div className="flex flex-col gap-8">
                    <div className="flex flex-col items-center">
                        <Link
                            href={home()}
                            className="flex flex-col items-center gap-2 font-medium"
                        >
                            <div className="flex h-36 w-36 items-center justify-center rounded-md">
                                {/* Logo Light */}
                                <img
                                    src="/kubah.png"
                                    alt="Kubah"
                                    className="h-28 w-auto object-contain dark:hidden"
                                />

                                {/* Logo Dark */}
                                <img
                                    src="/kubah-putih.png"
                                    alt="Kubah Dark"
                                    className="hidden h-28 w-auto object-contain dark:block"
                                />
                            </div>

                            <span className="sr-only">{title}</span>
                        </Link>

                        <div className="space-y-2 text-center">
                            <h1 className="text-xl font-medium">{title}</h1>
                            <p className="text-center text-sm text-muted-foreground">
                                {description}
                            </p>
                        </div>
                    </div>
                    {children}
                </div>
            </div>
        </div>
    );
}
