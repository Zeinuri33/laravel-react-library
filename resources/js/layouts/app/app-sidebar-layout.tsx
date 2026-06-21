import { AppContent } from '@/components/app-content';
import { AppShell } from '@/components/app-shell';
import { AppSidebar } from '@/components/app-sidebar';
import { AppSidebarHeader } from '@/components/app-sidebar-header';
import type { AppLayoutProps } from '@/types';

export default function AppSidebarLayout({
    children,
    breadcrumbs = [],
}: AppLayoutProps) {
    return (
        <AppShell variant="sidebar">
            <AppSidebar />
            <AppContent variant="sidebar" className="relative overflow-x-hidden">
                {/* Dot grid background — di belakang konten */}
                <div className="pointer-events-none absolute inset-0 -z-10 bg-dot-grid [--dot-color:oklch(0.5_0.01_260/0.15)] dark:[--dot-color:oklch(0.9_0.01_260/0.08)]" />
                <AppSidebarHeader breadcrumbs={breadcrumbs} />
                <div className="relative z-0">
                    {children}
                </div>
            </AppContent>
        </AppShell>
    );
}
