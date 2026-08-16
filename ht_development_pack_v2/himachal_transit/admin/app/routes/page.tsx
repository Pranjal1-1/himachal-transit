"use client"
import AdminShell from '../components/AdminShell'
import Link from 'next/link'
import { useEffect, useState } from 'react'
import { fetchFromApi } from '../../lib/api'
import { useToasts } from '../components/ToastProvider'

export default function RoutesPage() {
  const [routes, setRoutes] = useState<any[]>([])
  const [loading, setLoading] = useState(false)
  const { showToast } = useToasts()

  async function load() {
    setLoading(true)
    try {
      const data = await fetchFromApi('/routes')
      setRoutes(data)
    } catch (e: any) {
      showToast(`Load error: ${e.message}`)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => { load() }, [])

  return (
    <AdminShell>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2>Routes</h2>
          <p>List and manage transit routes.</p>
        </div>
        <div>
          <Link href="/routes/new"><button style={{ padding: '8px 12px', marginRight: 8 }}>New Route</button></Link>
          <button onClick={load} style={{ padding: '8px 12px' }}>{loading ? 'Refreshing...' : 'Refresh'}</button>
        </div>
      </div>
      <div style={{ marginTop: '1.5rem' }}>
        {loading && routes.length === 0 ? (
          <p>Loading...</p>
        ) : routes.length === 0 ? (
          <p>No routes found.</p>
        ) : (
          <div style={{ display: 'grid', gap: '1rem' }}>
            {routes.map((route: any) => (
              <div key={route.id} style={{ padding: '1rem', border: '1px solid #e5e7eb', borderRadius: 16 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <h3 style={{ margin: '0 0 0.5rem' }}>{route.name || `Route ${route.id}`}</h3>
                  <div>
                    <Link href={`/routes/${route.id}/edit`}><button style={{ marginRight: 8 }}>Edit</button></Link>
                  </div>
                </div>
                <p style={{ margin: '0.25rem 0' }}>From: {route.origin || 'Unknown'}</p>
                <p style={{ margin: '0.25rem 0' }}>To: {route.destination || 'Unknown'}</p>
                <p style={{ margin: '0.25rem 0' }}>Distance: {route.distance ?? 'N/A'} km</p>
              </div>
            ))}
          </div>
        )}
      </div>
    </AdminShell>
  )
}
