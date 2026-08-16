import Link from 'next/link'
import type { ReactNode } from 'react'
import AuthStatus from './AuthStatus'

interface AdminShellProps {
  children: ReactNode
}

export default function AdminShell({ children }: AdminShellProps) {
  return (
    <div style={{ padding: '2rem', minHeight: '100vh', background: '#f3f4f6' }}>
      <header style={{ marginBottom: '2rem' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', maxWidth: 1200, margin: '0 auto' }}>
          <div>
            <p style={{ margin: 0, color: '#374151', fontSize: '0.9rem' }}>Himachal Transit · Admin Dashboard</p>
            <h1 style={{ margin: '0.25rem 0 0', fontSize: '1.75rem' }}>Admin Console</h1>
          </div>
          <nav style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
            <Link href="/">Home</Link>
            <Link href="/buses">Buses</Link>
            <Link href="/routes">Routes</Link>
            <Link href="/stops">Stops</Link>
            <Link href="/assignments">Assignments</Link>
            <AuthStatus />
          </nav>
        </div>
      </header>
      <section style={{ maxWidth: 1200, margin: '0 auto', background: 'white', borderRadius: 24, padding: '1.5rem', boxShadow: '0 5px 20px rgba(15, 23, 42, 0.08)' }}>
        {children}
      </section>
    </div>
  )
}
