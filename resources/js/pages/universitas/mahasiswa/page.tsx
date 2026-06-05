"use client"

import { useState } from "react"
import { Head } from "@inertiajs/react"
import { columns, Mahasiswa } from "./columns"
import { DataTable } from "./data-table"
import Heading from "@/components/heading"
import CreateMahasiswaModal from "./create"
import EditMahasiswaModal from "./edit"

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

export default function MahasiswaPage({
  mahasiswas,
  prodis,
}: {
  mahasiswas: Mahasiswa[]
  prodis: Prodi[]
}) {
  const [openEdit, setOpenEdit] = useState(false)
  const [selectedMahasiswa, setSelectedMahasiswa] = useState<Mahasiswa | null>(null)

  const handleEdit = (item: Mahasiswa) => {
    setSelectedMahasiswa(item)
    setOpenEdit(true)
  }

  return (
    <>
      <Head title="Mahasiswa" />

      <div className="p-6 space-y-4">

        {/* Header */}
        <div className="flex items-center justify-between">
          <Heading
            variant="small"
            title="Data Mahasiswa"
            description="Daftar mahasiswa berdasarkan program studi."
          />

          <CreateMahasiswaModal prodis={prodis} />
        </div>

        {/* Table */}
        <DataTable
          columns={columns(handleEdit)}
          data={mahasiswas}
        />

        {/* Modal Edit */}
        {selectedMahasiswa && (
          <EditMahasiswaModal
            open={openEdit}
            setOpen={setOpenEdit}
            mahasiswa={selectedMahasiswa}
            prodis={prodis}
          />
        )}
      </div>
    </>
  )
}

MahasiswaPage.layout = {
  breadcrumbs: [
    {
      title: "Mahasiswa",
      href: "/mahasiswa",
    },
  ],
}