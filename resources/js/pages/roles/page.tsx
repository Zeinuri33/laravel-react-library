"use client"

import { useState } from "react"
import { Head } from '@inertiajs/react'
import { columns, Role } from "./columns"
import { DataTable } from "@/components/data-table"
import Heading from '@/components/heading'
import CreateRoleModal from "./create"
import EditRoleModal from "./edit"

export default function Roles({ roles }: { roles: Role[] }) {

  const [openEdit, setOpenEdit] = useState(false)
  const [selectedRole, setSelectedRole] = useState<Role | null>(null)

  const handleEdit = (role: Role) => {
    setSelectedRole(role)
    setOpenEdit(true)
  }

  return (
    <>
      <Head title="Role" />

      <div className="p-6 space-y-4">

        {/* Header */}
        <div className="flex items-center justify-between">
          <Heading
            variant="small"
            title="Data Role"
            description="daftar role dan permission."
          />

          <CreateRoleModal />
        </div>

        {/* Table */}
        <DataTable 
          columns={columns(handleEdit)} 
          data={roles} 
        />

        {/* Modal Edit */}
        {selectedRole && (
          <EditRoleModal
            open={openEdit}
            setOpen={setOpenEdit}
            role={selectedRole}
          />
        )}

      </div>
    </>
  )
}

Roles.layout = {
  breadcrumbs: [
    {
      title: 'Role',
      href: '/roles',
    },
  ],
}