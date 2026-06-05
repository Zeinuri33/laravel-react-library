"use client";

import {
    Facebook,
    Instagram,
    Mail,
    Youtube,
} from "lucide-react";

interface FooterProps {
    tc: any;
}

export default function Footer({ tc }: FooterProps) {
    return (
        <footer
            className={`border-t transition-colors duration-300 ${tc.footerBg} ${tc.footerBorder}`}
        >
            <div className="mx-auto max-w-6xl px-6 py-16">
                <div className="grid gap-12 md:grid-cols-2">
                    {/* LEFT */}
                    <div>
                        <h2
                            className={`bg-gradient-to-r bg-clip-text text-xl font-bold text-transparent ${tc.textGradient}`}
                        >
                            Ibrahimy Digital Library
                        </h2>

                        <p className="mt-4 max-w-md text-gray-600 dark:text-gray-400">
                            Digilib Perpustakaan Ibrahimy menyediakan akses
                            mudah dan cepat ke berbagai koleksi digital untuk
                            mendukung kegiatan belajar dan penelitian.
                        </p>

                        {/* SOCIAL */}
                        <div className="mt-6 flex gap-3">
                            {[
                                {
                                    icon: Facebook,
                                    href: "https://www.facebook.com/perpustakaan.ibrahimy.1",
                                },
                                {
                                    icon: Instagram,
                                    href: "https://instagram.com/ibrahimy.library",
                                },
                                {
                                    icon: Youtube,
                                    href: "https://youtube.com/@PerpustakaanIbrahimy",
                                },
                                {
                                    icon: Mail,
                                    href: "mailto:library@ibrahimy.ac.id",
                                },
                            ].map((item, i) => {
                                const Icon = item.icon;

                                return (
                                <a
                                    key={i}
                                    href={item.href}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className={`
                                        group flex h-11 w-11 items-center justify-center rounded-2xl
                                        border transition-all duration-300 hover:scale-110
                                        ${tc.socialBorder}
                                        ${tc.bgSoft}
                                        ${tc.socialHover}
                                    `}
                                >
                                    <Icon
                                        className={`
                                            h-5 w-5 transition-all duration-300
                                            ${tc.text}
                                            group-hover:scale-110
                                        `}
                                    />
                                </a>
                                );
                            })}
                        </div>
                    </div>

                    {/* RIGHT MENU */}
                    <div className="grid grid-cols-2 gap-8 sm:grid-cols-3">
                        {/* LAYANAN */}
                        <div className="hidden md:block">
                            <h3
                                className={`mb-4 text-lg font-bold ${tc.text}`}
                            >
                                Layanan
                            </h3>

                            <ul className="space-y-2 text-gray-600 dark:text-gray-400">
                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="https://repository.ibrahimy.ac.id/"
                                    >
                                        Repository
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="https://opac.lib.ibrahimy.ac.id/"
                                    >
                                        OPAC
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="https://ibrahimy.perpustakaan.co.id/"
                                    >
                                        E-Book
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="https://imjiss.ibrahimy.ac.id/"
                                    >
                                        Jurnal
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="#"
                                    >
                                        Ibrahimy AI
                                    </a>
                                </li>
                            </ul>
                        </div>

                        {/* TENTANG */}
                        <div className="hidden md:block">
                            <h3
                                className={`mb-4 text-lg font-bold ${tc.text}`}
                            >
                                Tentang
                            </h3>

                            <ul className="space-y-2 text-gray-600 dark:text-gray-400">
                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="https://www.lib.ibrahimy.ac.id/sejarah"
                                    >
                                        Profil
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="https://www.lib.ibrahimy.ac.id/berita"
                                    >
                                        Berita
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="#kontak"
                                    >
                                        Kontak
                                    </a>
                                </li>
                            </ul>
                        </div>

                        {/* BANTUAN */}
                        <div className="hidden md:block">
                            <h3
                                className={`mb-4 text-lg font-bold ${tc.text}`}
                            >
                                Bantuan
                            </h3>

                            <ul className="space-y-2 text-gray-600 dark:text-gray-400">
                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="#"
                                    >
                                        FAQ
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="#"
                                    >
                                        Panduan
                                    </a>
                                </li>

                                <li>
                                    <a
                                        className={`transition-colors duration-300 ${tc.linkHover}`}
                                        href="#"
                                    >
                                        Kebijakan
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                {/* BOTTOM */}
                <div
                    className={`mt-12 flex flex-col items-center justify-between border-t pt-6 text-sm text-gray-500 dark:text-gray-400 sm:flex-row ${tc.footerBorder}`}
                >
                    <p>
                        © {new Date().getFullYear()} Digilib Ibrahimy.
                        All rights reserved.
                    </p>

                    <p className="mt-2 sm:mt-0">
                        Developed by{" "}
                        <span className={`font-medium ${tc.textPrimary}`}>
                            @Zeinuri
                        </span>
                    </p>
                </div>
            </div>
        </footer>
    );
}