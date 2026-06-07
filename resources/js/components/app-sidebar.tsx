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
        href: 'https://github.com/laravel/react-starter-kit',
        icon: FolderGit2,
    },
    {
        title: 'Documentation',
        href: 'https://laravel.com/docs/starter-kits#react',
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
        ...(can('lihat-klasifikasi_ebook') ? [{ title: 'Klasifikasi', href: '/klasifikasi-ebooks' }] : []),
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
                        title: 'Titik Baca',
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
            <SidebarHeader>
                <SidebarMenu>
                    <SidebarMenuItem>
                        <SidebarMenuButton size="lg" asChild>
                            <Link href={dashboard()} prefetch>
                                <AppLogo />
                            </Link>
                        </SidebarMenuButton>
                    </SidebarMenuItem>
                </SidebarMenu>
            </SidebarHeader>

            <SidebarContent>
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

            <SidebarFooter>
                <NavFooter items={footerNavItems} className="mt-auto" />
                <NavUser />
            </SidebarFooter>
        </Sidebar>
    )
}
