"use client"

import { useState } from "react"
import { Head } from "@inertiajs/react"
import { columns, Prodi } from "./columns"
import { DataTable } from "@/components/data-table"
import Heading from "@/components/heading"
import CreateProdiModal from "./create"
import EditProdiModal from "./edit"

// ==============================
// TYPE FAKULTAS (buat dropdown)
// ==============================
type Fakultas = {
  id: number
  fakultas: string
}

export default function ProdiPage({
  prodis,
  fakultas,
}: {
  prodis: Prodi[]
  fakultas: Fakultas[]
}) {
  const [openEdit, setOpenEdit] = useState(false)
  const [selectedProdi, setSelectedProdi] = useState<Prodi | null>(null)

  const handleEdit = (item: Prodi) => {
    setSelectedProdi(item)
    setOpenEdit(true)
  }

  return (
    <>
      <Head title="Prodi" />

      <div className="p-6 space-y-4">

        {/* Header */}
        <div className="flex items-center justify-between">
          <Heading
            variant="small"
            title="Data Prodi"
            description="Daftar program studi dan fakultas."
          />

          <CreateProdiModal fakultas={fakultas} />
        </div>

        {/* Table */}
        <DataTable
          columns={columns(handleEdit)}
          data={prodis}
        />

        {/* Modal Edit */}
        {selectedProdi && (
          <EditProdiModal
            open={openEdit}
            setOpen={setOpenEdit}
            prodi={selectedProdi}
            fakultas={fakultas}
          />
        )}
      </div>
    </>
  )
}

ProdiPage.layout = {
  breadcrumbs: [
    {
      title: "Prodi",
      href: "/prodi",
    },
  ],
}