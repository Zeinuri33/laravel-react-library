"use client";

interface PaginationProps {
    currentPage: number;
    totalItems: number;
    perPage?: number;
    onPageChange: (page: number) => void;
    currentTheme: {
        paginationActive: string;
    };
}

export default function Pagination({
    currentPage,
    totalItems,
    perPage = 10,
    onPageChange,
    currentTheme,
}: PaginationProps) {
    const totalPages = Math.ceil(totalItems / perPage);

    return (
        <div className="mt-6 flex justify-center">
            <div className="flex flex-wrap items-center gap-2">
                {/* PREV */}
                <button
                    disabled={currentPage === 1}
                    onClick={() => onPageChange(currentPage - 1)}
                    className="rounded-lg border border-slate-200/50 bg-white/60 px-3 py-1.5 text-sm text-slate-700 backdrop-blur-sm transition-all duration-200 hover:bg-slate-100 disabled:cursor-not-allowed disabled:opacity-40 dark:border-white/5 dark:bg-slate-900/60 dark:text-slate-300 dark:hover:bg-white/10"
                >
                    Prev
                </button>

                {/* PAGE NUMBER */}
                {Array.from({ length: totalPages }).map((_, i) => {
                    const page = i + 1;
                    const active = currentPage === page;

                    return (
                        <button
                            key={page}
                            onClick={() => onPageChange(page)}
                            className={`min-w-[40px] rounded-lg border px-3 py-1.5 text-sm font-medium transition-all duration-200 ${
                                active
                                    ? currentTheme.paginationActive
                                    : 'border-slate-200/50 bg-white/60 text-slate-700 backdrop-blur-sm hover:bg-slate-100 dark:border-white/5 dark:bg-slate-900/60 dark:text-slate-300 dark:hover:bg-white/10'
                            }`}
                        >
                            {page}
                        </button>
                    );
                })}

                {/* NEXT */}
                <button
                    disabled={currentPage >= totalPages}
                    onClick={() => onPageChange(currentPage + 1)}
                    className="rounded-lg border border-slate-200/50 bg-white/60 px-3 py-1.5 text-sm text-slate-700 backdrop-blur-sm transition-all duration-200 hover:bg-slate-100 disabled:cursor-not-allowed disabled:opacity-40 dark:border-white/5 dark:bg-slate-900/60 dark:text-slate-300 dark:hover:bg-white/10"
                >
                    Next
                </button>
            </div>
        </div>
    );
}