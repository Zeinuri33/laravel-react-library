import React, { createContext, useContext, useState, useEffect } from 'react';

interface ThemeContextType {
    themeAccent: string;
    setThemeAccent: (theme: string) => void;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export function ThemeProvider({ children }: { children: React.ReactNode }) {
    const [themeAccent, setThemeAccentState] = useState<string>('emerald');
    useEffect(() => {
        const savedTheme = localStorage.getItem('theme_accent');
        if (savedTheme) {
            setThemeAccentState(savedTheme);
        }
    }, []);
    const setThemeAccent = (theme: string) => {
        setThemeAccentState(theme);
        localStorage.setItem('theme_accent', theme);
    };
    return (
        <ThemeContext.Provider value={{ themeAccent, setThemeAccent }}>
            {children}
        </ThemeContext.Provider>
    );
}
export function useTheme() {
    const context = useContext(ThemeContext);
    if (!context) {
        throw new Error('useTheme must be used within a ThemeProvider');
    }
    return context;
}