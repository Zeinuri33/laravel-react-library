import { Link, usePage } from '@inertiajs/react'
import {
    BookOpen,
    FolderGit2,
    LayoutGrid,
    Users,
    GraduationCap,
    FileSearch,
    Notebook,
    MessageCircleReply,
    BookHeadphones,
    MapPin
 } from 'lucide-react'
import AppLogo from '@/components/app-logo'
import { NavFooter } from '@/components/nav-footer'
import { NavMain } from '@/components/nav-main'
import { NavUser } from '@/components/nav-user'
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarHeader,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
} from '@/components/ui/sidebar'
import { dashboard } from '@/routes'
import type { NavItem } from '@/types'

const footerNavItems: NavItem[] = [
    {
        title: 'Repository',
        href: 'https://github.com/zeinuri33/digilib',
        icon: FolderGit2,
    },
    {
        title: 'Website',
        href: '/',
        icon: BookOpen,
    },
]

export function AppSidebar() {

    const { auth } = usePage().props as any
    const permissions = auth?.permissions ?? []

    const can = (perm: string) => permissions.includes(perm)


    // children
    const userChildren = [
        ...(can('lihat-user') ? [{ title: 'List Pengguna', href: '/users' }] : []),
        ...(can('lihat-role') ? [{ title: 'Role', href: '/roles' }] : []),
        ...(can('edit-user') ? [{ title: 'Akses', href: '/permissions' }] : []),
    ]
    const universitasChildren = [
        ...(can('lihat-fakultas') ? [{ title: 'Fakultas', href: '/fakultas' }] : []),
        ...(can('lihat-prodi') ? [{ title: 'Prodi', href: '/prodi' }] : []),
        ...(can('lihat-dosen') ? [{ title: 'Dosen', href: '/dosen' }] : []),
        ...(can('lihat-mahasiswa') ? [{ title: 'Mahasiswa', href: '/mahasiswa' }] : []),
    ]

    const plagiasiChildren = [
        ...(can('lihat-plagiasi_ta') ? [{ title: 'Tugas Akhir', href: '/cekplagiasi-ta' }] : []),
        ...(can('lihat-plagiasi_nonta') ? [{ title: 'Non Tugas Akhir', href: '/cekplagiasi-nonta' }] : []),
    ]

    const ebookChildren = [
        ...(can('lihat-ebook') ? [{ title: 'E-Book', href: '/list-ebooks' }] : []),
        ...(can('lihat-klasifikasi_ebook') ? [{ title: 'Klasifikasi', href: '/klasifikasi-ebooks' }] : []),                        ...(can('lihat-titik_ebook') ? [{ title: 'Zona Baca', href: '/titik-ebooks' }] : []),
        // ...(can('lihat-ebook_user') ? [{ title: 'User Ebook', href: '/ebook-users' }] : []),
    ]

    const groups = [
        {
            label: "Dashboard",
            items: [
                {
                    title: 'Beranda',
                    href: dashboard(),
                    icon: LayoutGrid,
                },
            ]
        },
        {
            label: "Layanan",
            items: [

                {
                    title: 'Panduan',
                    href: "/dokumentasi",
                    icon: BookOpen,
                },
                {
                    title: 'Usulan',
                    href: "/usulan-list",
                    icon: MessageCircleReply,
                },
                ...(ebookChildren.length > 0
                    ? [{
                        title: 'Zona Baca',
                        icon: MapPin,
                        children: ebookChildren,
                    }]
                    : []),
            ]
        },
        {
            label: "Master",
            items: [
                ...(userChildren.length > 0
                    ? [{
                        title: 'Pengguna',
                        icon: Users,
                        children: userChildren,
                    }]
                    : []),



                ...(universitasChildren.length > 0
                    ? [{
                        title: 'Universitas',
                        icon: GraduationCap,
                        children: universitasChildren,
                    }]
                    : []),

            ]
        },

    ]

    return (
        <Sidebar collapsible="icon" variant="inset">
            <SidebarHeader className="border-b border-sidebar-border/20 bg-gradient-to-b from-sidebar-accent/30 to-transparent">
                <SidebarMenu>
                    <SidebarMenuItem>
                        <SidebarMenuButton size="lg" asChild className="group-data-[collapsible=icon]:p-1.5">
                            <Link href={dashboard()} prefetch>
                                <AppLogo />
                            </Link>
                        </SidebarMenuButton>
                    </SidebarMenuItem>
                </SidebarMenu>
            </SidebarHeader>

            <SidebarContent className="py-2 gap-0">
                {groups.map((group) => (
                    group.items.length > 0 && (
                        <NavMain
                            key={group.label}
                            items={group.items}
                            label={group.label}
                        />
                    )
                ))}
            </SidebarContent>

            <SidebarFooter className="border-t border-sidebar-border/20">
                <NavFooter items={footerNavItems} className="mt-auto" />
                <NavUser />
            </SidebarFooter>
        </Sidebar>
    )
}
