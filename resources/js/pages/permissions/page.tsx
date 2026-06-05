"use client"

import { useState } from "react"
import { Head } from "@inertiajs/react"
import { columns, Permission } from "./columns"
import { DataTable } from "@/components/data-table"
import Heading from "@/components/heading"
import CreatePermissionModal from "./create"
import EditPermissionModal from "./edit"

export default function Permissions({ permissions }: { permissions: Permission[] }) {
  const [openEdit, setOpenEdit] = useState(false)
  const [selectedPermission, setSelectedPermission] = useState<Permission | null>(null)

  const handleEdit = (permission: Permission) => {
    setSelectedPermission(permission)
    setOpenEdit(true)
  }

  return (
    <>
      <Head title="Permission" />

      <div className="p-6 space-y-4">

        {/* Header */}
        <div className="flex items-center justify-between">
          <Heading
            variant="small"
            title="Data Permission"
            description="daftar permission sistem."
          />

          <CreatePermissionModal />
        </div>

        {/* Table */}
        <DataTable
          columns={columns(handleEdit)}
          data={permissions}
        />

        {/* Modal Edit */}
        {selectedPermission && (
          <EditPermissionModal
            open={openEdit}
            setOpen={setOpenEdit}
            permission={selectedPermission}
          />
        )}
      </div>
    </>
  )
}

Permissions.layout = {
  breadcrumbs: [
    {
      title: "Permission",
      href: "/permissions",
    },
  ],
}