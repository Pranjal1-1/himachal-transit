import './globals.css'
import type { Metadata } from 'next'
import type { ReactNode } from 'react'
import { ToastProvider } from './components/ToastProvider'

export const metadata: Metadata = {
  title: 'Himachal Transit Admin',
  description: 'Admin dashboard for Himachal Transit Management',
}

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>
        <ToastProvider>{children}</ToastProvider>
      </body>
    </html>
  )
}
