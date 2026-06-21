export default function Heading({
    title,
    description,
    variant = 'default',
}: {
    title: string;
    description?: string;
    variant?: 'default' | 'small';
}) {
    return (
        <header className={variant === 'small' ? 'space-y-0.5' : 'mb-8 space-y-1'}>
            <h2
                className={
                    variant === 'small'
                        ? 'text-base font-semibold tracking-tight text-foreground'
                        : 'text-2xl font-bold tracking-tight text-foreground'
                }
            >
                {title}
            </h2>
            {description && (
                <p className="text-sm text-muted-foreground/80 leading-relaxed">
                    {description}
                </p>
            )}
        </header>
    );
}
