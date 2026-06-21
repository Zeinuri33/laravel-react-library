"use client"

import * as React from "react"
import { motion, AnimatePresence } from "framer-motion"
import { ChevronsUpDown, ChevronUp, ChevronDown } from "lucide-react"
import type { Column } from "@tanstack/react-table"
import { Button } from "@/components/ui/button"
import { cn } from "@/lib/utils"

interface DataTableSortHeaderProps<TData, TValue> {
  column: Column<TData, TValue>
  children: React.ReactNode
  className?: string
}

export function DataTableSortHeader<TData, TValue>({
  column,
  children,
  className,
}: DataTableSortHeaderProps<TData, TValue>) {
  const isSorted = column.getIsSorted()

  const handleClick = () => {
    column.toggleSorting(isSorted === "asc")
  }

  return (
    <Button
      variant="ghost"
      onClick={handleClick}
      className={cn(
        "group relative gap-1.5 font-semibold",
        isSorted && "text-foreground",
        className
      )}
    >
      <span>{children}</span>

      {/* Animated sort icon */}
      <span className="relative inline-flex h-4 w-4 items-center justify-center">
        <AnimatePresence mode="wait">
          {isSorted === "asc" && (
            <motion.span
              key="asc"
              initial={{ opacity: 0, scale: 0.5, rotate: -90 }}
              animate={{ opacity: 1, scale: 1, rotate: 0 }}
              exit={{ opacity: 0, scale: 0.5, rotate: 90 }}
              transition={{ duration: 0.2, ease: "easeInOut" }}
              className="absolute"
            >
              <ChevronUp className="h-4 w-4 text-primary" />
            </motion.span>
          )}
          {isSorted === "desc" && (
            <motion.span
              key="desc"
              initial={{ opacity: 0, scale: 0.5, rotate: 90 }}
              animate={{ opacity: 1, scale: 1, rotate: 0 }}
              exit={{ opacity: 0, scale: 0.5, rotate: -90 }}
              transition={{ duration: 0.2, ease: "easeInOut" }}
              className="absolute"
            >
              <ChevronDown className="h-4 w-4 text-primary" />
            </motion.span>
          )}
          {!isSorted && (
            <motion.span
              key="none"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              transition={{ duration: 0.15 }}
              className="absolute"
            >
              <ChevronsUpDown className="h-4 w-4 text-muted-foreground/50 group-hover:text-muted-foreground transition-colors duration-150" />
            </motion.span>
          )}
        </AnimatePresence>
      </span>
    </Button>
  )
}
