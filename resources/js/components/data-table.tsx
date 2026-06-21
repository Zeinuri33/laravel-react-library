"use client"

import * as React from "react"
import {
  Pagination,
  PaginationContent,
  PaginationEllipsis,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
} from "@/components/ui/pagination"

import { Field, FieldLabel } from "@/components/ui/field"
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import {
  ColumnDef,
  ColumnFiltersState,
  SortingState,
  VisibilityState,
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  useReactTable,
  getSortedRowModel,
  getPaginationRowModel,
} from "@tanstack/react-table"

import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

import { Button } from "@/components/ui/button"
import {
  DropdownMenu,
  DropdownMenuCheckboxItem,
  DropdownMenuContent,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

import { Search, X, Columns3 } from "lucide-react"

interface DataTableProps<TData, TValue> {
  columns: ColumnDef<TData, TValue>[]
  data: TData[]
}

export function DataTable<TData, TValue>({
  columns,
  data,
}: DataTableProps<TData, TValue>) {
  const [sorting, setSorting] = React.useState<SortingState>([])
  const [columnFilters, setColumnFilters] = React.useState<ColumnFiltersState>(
    []
  )

  const [columnVisibility, setColumnVisibility] =
    React.useState<VisibilityState>({})
  const [rowSelection, setRowSelection] = React.useState({})

  // Debounced search
  const [searchValue, setSearchValue] = React.useState("")
  const debounceRef = React.useRef<ReturnType<typeof setTimeout> | null>(null)

  const handleSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value
    setSearchValue(value)
    if (debounceRef.current) clearTimeout(debounceRef.current)
    debounceRef.current = setTimeout(() => {
      table.setGlobalFilter(value)
    }, 250)
  }

  const clearSearch = () => {
    setSearchValue("")
    if (debounceRef.current) clearTimeout(debounceRef.current)
    table.setGlobalFilter("")
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Escape") {
      clearSearch()
    }
  }

  // Focus search on Ctrl+K or ⌘K
  const searchInputRef = React.useRef<HTMLInputElement>(null)

  React.useEffect(() => {
    const handleGlobalKeyDown = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key === "k") {
        e.preventDefault()
        searchInputRef.current?.focus()
      }
    }
    document.addEventListener("keydown", handleGlobalKeyDown)
    return () => document.removeEventListener("keydown", handleGlobalKeyDown)
  }, [])

  const isMac = typeof navigator !== "undefined" && /Mac/i.test(navigator.userAgent)

  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    onSortingChange: setSorting,
    getSortedRowModel: getSortedRowModel(),
    onColumnFiltersChange: setColumnFilters,
    getFilteredRowModel: getFilteredRowModel(),
    onColumnVisibilityChange: setColumnVisibility,
    onRowSelectionChange: setRowSelection,
    initialState: {
      pagination: { pageSize: 10 },
    },
    state: {
      sorting,
      columnFilters,
      columnVisibility,
      rowSelection,
    },
  })


const pageCount = table.getPageCount()
const currentPage = table.getState().pagination.pageIndex

const generatePages = () => {
  const pages: (number | "...")[] = []

  if (pageCount <= 5) {
    return Array.from({ length: pageCount }, (_, i) => i)
  }

  if (currentPage < 3) {
    pages.push(0, 1, 2, 3, "...", pageCount - 1)
  } else if (currentPage > pageCount - 4) {
    pages.push(0, "...", pageCount - 4, pageCount - 3, pageCount - 2, pageCount - 1)
  } else {
    pages.push(
      0,
      "...",
      currentPage - 1,
      currentPage,
      currentPage + 1,
      "...",
      pageCount - 1
    )
  }

  return pages
}

const pages = generatePages()

  return (
    <div>
      {/* Search & Controls Bar */}
      <div className="flex flex-col gap-3 sm:flex-row sm:items-center py-4">
        {/* Search — dengan keyboard shortcut, clear button */}
        <div className="relative flex-1 max-w-md group">
          <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground pointer-events-none transition-colors duration-200 group-focus-within:text-primary" />
          <input
            ref={searchInputRef}
            placeholder="Cari di sini..."
            value={searchValue}
            onChange={handleSearchChange}
            onKeyDown={handleKeyDown}
            className="h-9 w-full rounded-lg border border-input bg-background/50 pl-9 pr-20 text-sm shadow-xs transition-all duration-200 placeholder:text-muted-foreground focus:border-primary/50 focus:ring-[3px] focus:ring-primary/10 focus:outline-none focus:bg-background"
          />
          {/* Clear button */}
          {searchValue && (
            <button
              onClick={clearSearch}
              className="absolute right-9 top-1/2 -translate-y-1/2 flex items-center justify-center h-5 w-5 rounded-full text-muted-foreground hover:text-foreground hover:bg-accent transition-colors duration-150"
            >
              <X className="h-3 w-3" />
            </button>
          )}
          {/* Keyboard shortcut hint */}
          <div className="absolute right-2.5 top-1/2 -translate-y-1/2 flex items-center gap-0.5 pointer-events-none">
            {!searchValue && (
              <kbd className="hidden sm:inline-flex h-5 items-center gap-0.5 rounded border bg-muted/50 px-1.5 text-[10px] font-medium text-muted-foreground/60">
                <span>{isMac ? "⌘" : "Ctrl+"}</span>
                <span>K</span>
              </kbd>
            )}
          </div>
        </div>

        <div className="flex items-center gap-2 ml-auto">
          {/* Row count badge */}
          <div className="hidden sm:flex items-center gap-1.5 rounded-lg border bg-gradient-to-b from-muted/30 to-muted/10 px-3 py-1.5 text-xs text-muted-foreground shadow-xs">
            <span className="font-semibold text-foreground">{table.getFilteredRowModel().rows.length}</span>
            <span>data</span>
          </div>

          {/* Column toggle */}
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="outline" size="sm" className="gap-1.5">
                <Columns3 className="h-3.5 w-3.5" />
                <span className="text-xs">Kolom</span>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-48">
              <div className="px-2 py-1.5 text-xs font-medium text-muted-foreground border-b border-border/50 mb-1">
                Tampilkan kolom
              </div>
              {table
                .getAllColumns()
                .filter(
                  (column) => column.getCanHide()
                )
                .map((column) => {
                  return (
                    <DropdownMenuCheckboxItem
                      key={column.id}
                      className="capitalize text-sm"
                      checked={column.getIsVisible()}
                      onCheckedChange={(value) =>
                        column.toggleVisibility(!!value)
                      }
                    >
                      {column.id}
                    </DropdownMenuCheckboxItem>
                  )
                })}
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </div>

      {/* Table */}
      <div className="overflow-hidden rounded-lg border border-border/60 bg-card shadow-sm">
        <Table>
          <TableHeader className="bg-gradient-to-b from-muted/60 to-muted/30">
            {table.getHeaderGroups().map((headerGroup) => (
              <TableRow key={headerGroup.id} className="hover:bg-transparent even:bg-transparent">
                {headerGroup.headers.map((header) => {
                  return (
                    <TableHead key={header.id} className="h-11 text-xs font-semibold uppercase tracking-wider text-muted-foreground/80">
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext()
                          )}
                    </TableHead>
                  )
                })}
              </TableRow>
            ))}
          </TableHeader>
          <TableBody>
            {table.getRowModel().rows?.length ? (
              table.getRowModel().rows.map((row, rowIndex) => (
                <TableRow
                  key={row.id}
                  data-state={row.getIsSelected() && "selected"}
                  className="transition-all duration-150 hover:bg-accent/40 data-[state=selected]:bg-primary/5 even:bg-muted/15"
                >
                  {row.getVisibleCells().map((cell) => (
                    <TableCell key={cell.id}>
                      {flexRender(cell.column.columnDef.cell, cell.getContext())}
                    </TableCell>
                  ))}
                </TableRow>
              ))
            ) : (
              <TableRow>
                <TableCell colSpan={columns.length} className="h-40 text-center text-muted-foreground">
                  <div className="flex flex-col items-center justify-center gap-3">
                    <div className="flex h-12 w-12 items-center justify-center rounded-full bg-muted/50">
                      <Search className="h-5 w-5 opacity-40" />
                    </div>
                    <div>
                      <p className="text-sm font-medium">Data tidak ditemukan</p>
                      <p className="text-xs text-muted-foreground/70 mt-0.5">
                        Coba gunakan kata kunci pencarian yang berbeda
                      </p>
                    </div>
                  </div>
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
      
      <div className="flex items-center justify-between py-4">

        {/* KIRI: Rows per page */}
        <div className="flex justify-start">
          <Field orientation="horizontal" className="w-fit">
            <FieldLabel className="text-xs text-muted-foreground">Rows per page</FieldLabel>

            <Select
              value={String(table.getState().pagination.pageSize)}
              onValueChange={(value) => table.setPageSize(Number(value))}
            >
              <SelectTrigger className="w-20 h-8 text-xs">
                <SelectValue />
              </SelectTrigger>

              <SelectContent align="start">
                <SelectGroup>
                  <SelectItem value="10">10</SelectItem>
                  <SelectItem value="25">25</SelectItem>
                  <SelectItem value="50">50</SelectItem>
                  <SelectItem value="100">100</SelectItem>
                  <SelectItem value={String(table.getFilteredRowModel().rows.length)}>
                    Semua
                  </SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </Field>
        </div>

        {/* KANAN: Pagination */}
        <div className="flex justify-end">
          <Pagination>
            <PaginationContent>

              {/* Previous (icon only) */}
              <PaginationItem>
                <PaginationPrevious
                  onClick={() => table.previousPage()}
                  className={`p-2 hover:bg-accent rounded-lg transition-colors ${
                    !table.getCanPreviousPage()
                      ? "pointer-events-none opacity-50"
                      : ""
                  }`}
                />
              </PaginationItem>

              {/* Pages */}
              {pages.map((page, index) =>
                page === "..." ? (
                  <PaginationItem key={index}>
                    <PaginationEllipsis />
                  </PaginationItem>
                ) : (
                  <PaginationItem key={index}>
                    <PaginationLink
                      isActive={currentPage === page}
                      onClick={() => table.setPageIndex(page)}
                      className={`min-w-[32px] h-8 text-xs rounded-lg ${
                        currentPage === page
                          ? "bg-primary text-primary-foreground shadow-sm"
                          : "hover:bg-accent"
                      }`}
                    >
                      {page + 1}
                    </PaginationLink>
                  </PaginationItem>
                )
              )}

              {/* Next (icon only) */}
              <PaginationItem>
                <PaginationNext
                  onClick={() => table.nextPage()}
                  className={`p-2 hover:bg-accent rounded-lg transition-colors ${
                    !table.getCanNextPage()
                      ? "pointer-events-none opacity-50"
                      : ""
                  }`}
                />
              </PaginationItem>

            </PaginationContent>
          </Pagination>
        </div>

      </div>
    </div>
    
  )
}