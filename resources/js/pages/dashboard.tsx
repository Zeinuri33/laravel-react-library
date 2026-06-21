import { Head } from '@inertiajs/react';
import { dashboard } from '@/routes';
import { BookOpen, BookMarked, Users, MessageCircleReply, ArrowUpRight, Library, TrendingUp } from 'lucide-react';

export default function Dashboard() {
    const stats = [
        {
            title: 'Total E-Book',
            value: '—',
            icon: BookMarked,
            color: 'from-emerald-500/20 to-emerald-600/10',
            iconColor: 'text-emerald-600 dark:text-emerald-400',
            bgIcon: 'bg-emerald-100 dark:bg-emerald-900/30',
        },
        {
            title: 'Dokumentasi',
            value: '—',
            icon: BookOpen,
            color: 'from-blue-500/20 to-blue-600/10',
            iconColor: 'text-blue-600 dark:text-blue-400',
            bgIcon: 'bg-blue-100 dark:bg-blue-900/30',
        },
        {
            title: 'Pengguna',
            value: '—',
            icon: Users,
            color: 'from-violet-500/20 to-violet-600/10',
            iconColor: 'text-violet-600 dark:text-violet-400',
            bgIcon: 'bg-violet-100 dark:bg-violet-900/30',
        },
        {
            title: 'Usulan Masuk',
            value: '—',
            icon: MessageCircleReply,
            color: 'from-amber-500/20 to-amber-600/10',
            iconColor: 'text-amber-600 dark:text-amber-400',
            bgIcon: 'bg-amber-100 dark:bg-amber-900/30',
        },
    ];

    return (
        <>
            <Head title="Dashboard" />
            <div className="flex h-full flex-1 flex-col gap-6 overflow-x-auto p-6">
                {/* Header */}
                <div>
                    <h1 className="text-2xl font-bold tracking-tight">Dashboard</h1>
                    <p className="text-sm text-muted-foreground mt-1">
                        Selamat datang di panel administrasi Perpustakaan Ibrahimy
                    </p>
                </div>

                {/* Stats Grid */}
                <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-4">
                    {stats.map((stat) => {
                        const Icon = stat.icon;
                        return (
                            <div
                                key={stat.title}
                                className="group relative overflow-hidden rounded-xl border bg-card p-5 shadow-card transition-all duration-300 hover:shadow-elevated hover:-translate-y-0.5"
                            >
                                {/* Background gradient */}
                                <div className={`absolute inset-0 bg-gradient-to-br ${stat.color} opacity-60`} />

                                <div className="relative z-10 flex items-start justify-between">
                                    <div className="space-y-2">
                                        <p className="text-sm font-medium text-muted-foreground">
                                            {stat.title}
                                        </p>
                                        <p className="text-3xl font-bold tracking-tight">
                                            {stat.value}
                                        </p>
                                    </div>

                                    <div className={`rounded-xl p-3 ${stat.bgIcon} ${stat.iconColor} transition-transform duration-300 group-hover:scale-110 group-hover:-rotate-3`}>
                                        <Icon className="h-5 w-5" />
                                    </div>
                                </div>

                                {/* Trend indicator */}
                                <div className="relative z-10 mt-4 flex items-center gap-1.5 text-xs text-muted-foreground">
                                    <TrendingUp className="h-3.5 w-3.5 text-emerald-500" />
                                    <span>Data real-time</span>
                                </div>
                            </div>
                        );
                    })}
                </div>

                {/* Quick Links & Activity */}
                <div className="grid gap-6 lg:grid-cols-3">
                    {/* Quick Actions */}
                    <div className="lg:col-span-1 space-y-4">
                        <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider">
                            AKSI CEPAT
                        </h2>
                        <div className="space-y-3">
                            {[
                                { label: 'Tambah E-Book', href: '/list-ebooks/create', icon: BookMarked, desc: 'Tambah koleksi digital baru' },
                                { label: 'Buat Dokumentasi', href: '/dokumentasi/create', icon: BookOpen, desc: 'Tulis panduan layanan' },
                                { label: 'Lihat Usulan', href: '/usulan-list', icon: MessageCircleReply, desc: 'Cek pesan dari pengunjung' },
                                { label: 'Kelola Pengguna', href: '/users', icon: Users, desc: 'Atur hak akses pengguna' },
                            ].map((item) => {
                                const Icon = item.icon;
                                return (
                                    <a
                                        key={item.label}
                                        href={item.href}
                                        className="group flex items-center gap-4 rounded-xl border bg-card p-4 shadow-soft transition-all duration-200 hover:shadow-card hover:-translate-y-0.5 hover:border-primary/20"
                                    >
                                        <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary transition-colors group-hover:bg-primary/20">
                                            <Icon className="h-5 w-5" />
                                        </div>
                                        <div className="flex-1 min-w-0">
                                            <p className="text-sm font-medium truncate">{item.label}</p>
                                            <p className="text-xs text-muted-foreground truncate">{item.desc}</p>
                                        </div>
                                        <ArrowUpRight className="h-4 w-4 text-muted-foreground opacity-0 -translate-x-2 transition-all duration-200 group-hover:opacity-100 group-hover:translate-x-0" />
                                    </a>
                                );
                            })}
                        </div>
                    </div>

                    {/* Info Panel */}
                    <div className="lg:col-span-2 space-y-4">
                        <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider">
                            INFORMASI
                        </h2>
                        <div className="rounded-xl border bg-card p-6 shadow-soft">
                            <div className="flex items-start gap-4">
                                <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-2xl bg-gradient-to-br from-emerald-500 to-emerald-600 text-white shadow-lg">
                                    <Library className="h-7 w-7" />
                                </div>
                                <div className="space-y-2">
                                    <h3 className="font-semibold text-lg">
                                        Digital Library Ibrahimy
                                    </h3>
                                    <p className="text-sm text-muted-foreground leading-relaxed">
                                        Selamat datang di sistem administrasi Perpustakaan Ibrahimy. 
                                        Kelola koleksi e-book, dokumentasi layanan, data universitas, 
                                        dan tanggapi usulan dari pengunjung website.
                                    </p>
                                    <div className="flex flex-wrap gap-2 pt-2">
                                        <span className="inline-flex items-center gap-1 rounded-full border bg-emerald-50 px-3 py-1 text-xs font-medium text-emerald-700 dark:bg-emerald-950/30 dark:text-emerald-400 dark:border-emerald-800">
                                            <span className="h-1.5 w-1.5 rounded-full bg-emerald-500 animate-pulse" />
                                            Sistem Aktif
                                        </span>
                                        <span className="inline-flex items-center gap-1 rounded-full border bg-muted px-3 py-1 text-xs font-medium text-muted-foreground">
                                            v1.0.0
                                        </span>
                                    </div>
                                </div>
                            </div>

                            {/* Divider */}
                            <div className="my-6 border-t" />

                            <div className="grid gap-4 sm:grid-cols-2">
                                {[
                                    { label: 'Website', value: 'www.digilib.ibrahimy.ac.id' },
                                    { label: 'OPAC', value: 'opac.lib.ibrahimy.ac.id' },
                                    { label: 'Repository', value: 'repository.ibrahimy.ac.id' },
                                    { label: 'Email', value: 'library@ibrahimy.ac.id' },
                                ].map((info) => (
                                    <div key={info.label} className="space-y-0.5">
                                        <p className="text-xs text-muted-foreground">{info.label}</p>
                                        <p className="text-sm font-medium truncate">{info.value}</p>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

Dashboard.layout = {
    breadcrumbs: [
        {
            title: 'Beranda',
            href: dashboard(),
        },
    ],
};
