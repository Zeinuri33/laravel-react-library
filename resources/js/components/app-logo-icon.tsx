import type { SVGAttributes } from 'react';

export default function AppLogoIcon(props: SVGAttributes<SVGElement>) {
    return (
        <svg {...props} viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path
                d="M4 6C4 4.89543 4.89543 4 6 4H11V20H6C4.89543 20 4 19.1046 4 18V6Z"
                fill="currentColor"
            />
            <path
                d="M13 4H18C19.1046 4 20 4.89543 20 6V18C20 19.1046 19.1046 20 18 20H13V4Z"
                fill="currentColor"
                opacity="0.5"
            />
        </svg>
    );
}
