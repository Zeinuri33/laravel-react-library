import { Moon, Sun } from "lucide-react";
import { useAppearance } from "@/hooks/use-appearance";
import { useEffect, useState } from "react";

export default function AppearanceToggleIcon() {
    const { appearance, updateAppearance } = useAppearance();
    const [isDark, setIsDark] = useState(false);

    useEffect(() => {
        const dark =
            appearance === "dark" ||
            (appearance === "system" &&
                window.matchMedia("(prefers-color-scheme: dark)").matches);

        setIsDark(dark);
    }, [appearance]);

    const toggle = () => {
        updateAppearance(isDark ? "light" : "dark");
    };

    return (
        <button
            onClick={toggle}
            className="p-2 rounded-lg hover:bg-neutral-200/60 dark:hover:bg-neutral-700/60 transition"
        >
            {isDark ? (
                <Sun className="h-5 w-5" />
            ) : (
                <Moon className="h-5 w-5" />
            )}
        </button>
    );
}