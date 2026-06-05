import { Link } from '@inertiajs/react';
import {
    SidebarGroup,
    SidebarGroupLabel,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
    useSidebar,
} from '@/components/ui/sidebar';
import { useCurrentUrl } from '@/hooks/use-current-url';
import type { NavItem } from '@/types';
import { useState, useEffect } from "react"
import { ChevronDown } from "lucide-react"
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from '@/components/ui/popover'

export function NavMain({ 
    items = [], 
    label = "Menu" 
}: { 
    items: NavItem[]
    label?: string
}) {
    const { isCurrentUrl } = useCurrentUrl()
    const [openMenu, setOpenMenu] = useState<string | null>(null)

    const { state, isMobile } = useSidebar()
    const isCollapsed = !isMobile && state === "collapsed"

    useEffect(() => {
        const activeParent = items.find(item => {
            if (item.children) {
                return item.children.some(child => isCurrentUrl(child.href!))
            }
            return false
        })

        if (activeParent) {
            setOpenMenu(activeParent.title)
        }
    }, [items])

    // 🔥 reset kalau collapse
    useEffect(() => {
        if (isCollapsed) {
            setOpenMenu(null)
        }
    }, [isCollapsed])

    const toggleMenu = (title: string) => {
        setTouchedMenu(true) // 🔥 user sudah interaksi
        setOpenMenu(openMenu === title ? null : title)
    }

    const isParentActive = (item: NavItem) => {
        if (item.href && isCurrentUrl(item.href)) return true
        if (item.children) {
            return item.children.some(child => isCurrentUrl(child.href!))
        }
        return false
    }
    const [touchedMenu, setTouchedMenu] = useState(false)

    return (
        <SidebarGroup className="px-2 py-0">
            <SidebarGroupLabel>{label}</SidebarGroupLabel>

            <SidebarMenu>
                {items.map((item) => {
                    const active = isParentActive(item)
                    const isOpen = !isCollapsed && (
                        openMenu === item.title ||
                        (!touchedMenu && active)
                    )

                    return (
                        <div key={item.title} className="relative">

                            {/* Vertical line */}
                            {item.children && isOpen && (
                                <div className="absolute left-4 top-8 bottom-0 w-px bg-border" />
                            )}

                            <SidebarMenuItem>
                                {item.children ? (
                                    isCollapsed ? (
                                        // 🔥 COLLAPSE MODE → FLYOUT
                                        <Popover>
                                            <PopoverTrigger asChild>
                                                <SidebarMenuButton isActive={active}>
                                                    {item.icon && <item.icon className="h-4 w-4" />}
                                                </SidebarMenuButton>
                                            </PopoverTrigger>

                                            <PopoverContent
                                                side="right"
                                                align="start"
                                                className="w-48 p-2"
                                            >
                                                <div className="mb-2 text-xs font-semibold text-muted-foreground">
                                                    {item.title}
                                                </div>

                                                <div className="space-y-1">
                                                    {item.children.map((child) => (
                                                        <Link
                                                            key={child.title}
                                                            href={child.href!}
                                                            className={`block rounded-md px-2 py-1 text-sm hover:bg-accent ${
                                                                isCurrentUrl(child.href!) ? "bg-accent" : ""
                                                            }`}
                                                        >
                                                            {child.title}
                                                        </Link>
                                                    ))}
                                                </div>
                                            </PopoverContent>
                                        </Popover>
                                    ) : (
                                        // 🔥 NORMAL MODE
                                        <SidebarMenuButton
                                            onClick={() => toggleMenu(item.title)}
                                            isActive={active}
                                        >
                                            {item.icon && <item.icon className="mr-2 h-4 w-4" />}
                                            <span className="flex-1 text-left">
                                                {item.title}
                                            </span>
                                            <ChevronDown
                                                className={`h-4 w-4 transition-transform ${
                                                    isOpen ? "rotate-180" : ""
                                                }`}
                                            />
                                        </SidebarMenuButton>
                                    )
                                ) : (
                                    <SidebarMenuButton
                                        asChild
                                        isActive={isCurrentUrl(item.href!)}
                                    >
                                        <Link href={item.href!}>
                                            {item.icon && <item.icon className="mr-2 h-4 w-4" />}
                                            {item.title}
                                        </Link>
                                    </SidebarMenuButton>
                                )}
                            </SidebarMenuItem>

                            {/* Submenu (smooth animation) */}
                            {item.children && !isCollapsed && (
                                <div
                                    className={`
                                        ml-6 mt-1 space-y-1 overflow-hidden
                                        transition-all duration-300 ease-in-out
                                        ${isOpen 
                                            ? "max-h-96 opacity-100 translate-y-0" 
                                            : "max-h-0 opacity-0 -translate-y-1"
                                        }
                                    `}
                                >
                                    {item.children.map((child) => (
                                        <SidebarMenuItem key={child.title}>
                                            <SidebarMenuButton
                                                asChild
                                                isActive={isCurrentUrl(child.href!)}
                                            >
                                                <Link href={child.href!}>
                                                    {child.title}
                                                </Link>
                                            </SidebarMenuButton>
                                        </SidebarMenuItem>
                                    ))}
                                </div>
                            )}

                        </div>
                    )
                })}
            </SidebarMenu>
        </SidebarGroup>
    )
}