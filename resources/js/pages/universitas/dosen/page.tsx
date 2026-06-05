"use client"

import { useState } from "react"
import { Head } from "@inertiajs/react"
import { columns, Dosen } from "./columns"
import { DataTable } from "@/components/data-table"
import Heading from "@/components/heading"
import CreateDosenModal from "./create"
import EditDosenModal from "./edit"

// ==============================
// TYPE PRODI (buat dropdown)
// ==============================
type Prodi = {
  id: number
  prodi: string
  fakultas?: {
    id: number
    fakultas: string
  }
}

export default function DosenPage({
  dosens,
  prodis,
}: {
  dosens: Dosen[]
  prodis: Prodi[]
}) {
  const [openEdit, setOpenEdit] = useState(false)
  const [selectedDosen, setSelectedDosen] = useState<Dosen | null>(null)

  const handleEdit = (item: Dosen) => {
    setSelectedDosen(item)
    setOpenEdit(true)
  }

  return (
    <>
      <Head title="Dosen" />

      <div className="p-6 space-y-4">

        {/* Header */}
        <div className="flex items-center justify-between">
          <Heading
            variant="small"
            title="Data Dosen"
            description="Daftar dosen berdasarkan program studi."
          />

          <CreateDosenModal prodis={prodis} />
        </div>

        {/* Table */}
        <DataTable
          columns={columns(handleEdit)}
          data={dosens}
        />

        {/* Modal Edit */}
        {selectedDosen && (
          <EditDosenModal
            open={openEdit}
            setOpen={setOpenEdit}
            dosen={selectedDosen}
            prodis={prodis}
          />
        )}
      </div>
    </>
  )
}

DosenPage.layout = {
  breadcrumbs: [
    {
      title: "Dosen",
      href: "/dosen",
    },
  ],
}