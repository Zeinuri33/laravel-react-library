"use client"

import { useState } from "react"
import { Head } from "@inertiajs/react"
import { columns, Fakultas } from "./columns"
import { DataTable } from "@/components/data-table"
import Heading from "@/components/heading"
import CreateFakultasModal from "./create"
import EditFakultasModal from "./edit"

export default function FakultasPage({ fakultas }: { fakultas: Fakultas[] }) {
  const [openEdit, setOpenEdit] = useState(false)
  const [selectedFakultas, setSelectedFakultas] = useState<Fakultas | null>(null)

  const handleEdit = (item: Fakultas) => {
    setSelectedFakultas(item)
    setOpenEdit(true)
  }

  return (
    <>
      <Head title="Fakultas" />

      <div className="p-6 space-y-4">

        {/* Header */}
        <div className="flex items-center justify-between">
          <Heading
            variant="small"
            title="Data Fakultas"
            description="Daftar fakultas dan dekan."
          />

          <CreateFakultasModal />
        </div>

        {/* Table */}
        <DataTable
          columns={columns(handleEdit)}
          data={fakultas}
        />

        {/* Modal Edit */}
        {selectedFakultas && (
          <EditFakultasModal
            open={openEdit}
            setOpen={setOpenEdit}
            fakultas={selectedFakultas}
          />
        )}
      </div>
    </>
  )
}

FakultasPage.layout = {
  breadcrumbs: [
    {
      title: "Fakultas",
      href: "/fakultas",
    },
  ],
}