import { AppContent } from '@/components/app-content';
import { AppHeader } from '@/components/app-header';
import { AppShell } from '@/components/app-shell';
import type { AppLayoutProps } from '@/types';

export default function AppHeaderLayout({
    children,
    breadcrumbs,
}: AppLayoutProps) {
    return (
        <AppShell variant="header">
            {/* Dot grid background — di belakang konten */}
            <div className="pointer-events-none fixed inset-0 -z-10 bg-dot-grid [--dot-color:oklch(0.5_0.01_260/0.15)] dark:[--dot-color:oklch(0.9_0.01_260/0.08)]" />
            <AppHeader breadcrumbs={breadcrumbs} />
            <AppContent variant="header">
                <div className="relative z-0">
                    {children}
                </div>
            </AppContent>
        </AppShell>
    );
}
