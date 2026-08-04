"use client"

import { Head, router } from "@inertiajs/react"
import {
    BookMarked,
    CheckCircle2,
    CircleDashed,
    Plus,
} from "lucide-react"

import { DataTable } from "@/components/data-table"
import Heading from "@/components/heading"
import { Button } from "@/components/ui/button"

import { columns } from "./columns"
import type { ResourceGuide } from "./columns"

interface Props {
    resourceGuides: ResourceGuide[]
    totalProdi: number
}

export default function ResourceGuidePage({
    resourceGuides,
    totalProdi,
}: Props) {

    const handleEdit = (
        item: ResourceGuide
    ) => {
        router.visit(
            `/resource-guide/${item.id}/edit`
        )
    }

    const progress = totalProdi > 0
        ? Math.round(
            (resourceGuides.length / totalProdi) * 100
        )
        : 0

    return (
        <>
            <Head title="Resource Guide" />

            <div className="p-6 space-y-4">

                {/* Header */}
                <div className="flex items-center justify-between">

                    <Heading
                        variant="small"
                        title="Resource Guide"
                        description="Panduan sumber daya untuk setiap program studi."
                    />

                    <Button
                        onClick={() =>
                            router.visit(
                                "/resource-guide/create"
                            )
                        }
                        className="gap-2"
                    >
                        <Plus className="h-4 w-4" />

                        Tambah Resource Guide
                    </Button>
                </div>

                {/* Progress */}
                <div className="flex flex-col gap-3 sm:flex-row sm:items-center rounded-xl border bg-card p-4 shadow-sm">

                    <div className="flex items-center gap-3">
                        <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary">
                            <BookMarked className="h-5 w-5" />
                        </div>

                        <div>
                            <p className="text-sm font-semibold">
                                Kelengkapan Resource Guide
                            </p>

                            <p className="text-xs text-muted-foreground">
                                {resourceGuides.length} dari{" "}
                                {totalProdi} prodi sudah memiliki
                                resource guide
                            </p>
                        </div>
                    </div>

                    <div className="flex flex-1 items-center gap-3 sm:justify-end">
                        <div className="h-2 w-full max-w-xs overflow-hidden rounded-full bg-muted">
                            <div
                                className="h-full rounded-full bg-primary transition-all duration-500"
                                style={{
                                    width: `${progress}%`,
                                }}
                            />
                        </div>

                        <span className="text-sm font-semibold text-muted-foreground tabular-nums">
                            {progress}%
                        </span>

                        {progress === 100 ? (
                            <CheckCircle2 className="h-5 w-5 text-emerald-500" />
                        ) : (
                            <CircleDashed className="h-5 w-5 text-muted-foreground/50" />
                        )}
                    </div>
                </div>

                {/* Table */}
                <DataTable
                    columns={columns(handleEdit)}
                    data={resourceGuides}
                />
            </div>
        </>
    )
}

ResourceGuidePage.layout = {
    breadcrumbs: [
        {
            title: "Resource Guide",
            href: "/resource-guide",
        },
    ],
}
