"use client"
import AdminShell from '../components/AdminShell'
import Link from 'next/link'
import { useEffect, useState } from 'react'
import { fetchFromApi } from '../../lib/api'
import { useToasts } from '../components/ToastProvider'

export default function StopsPage() {
  const [stops, setStops] = useState<any[]>([])
  const [loading, setLoading] = useState(false)
  const { showToast } = useToasts()

  async function load() {
    setLoading(true)
    try {
      const data = await fetchFromApi('/stops')
      setStops(data)
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
          <h2>Stops</h2>
          <p>List and manage route stops.</p>
        </div>
        <div>
          <Link href="/stops/new"><button style={{ padding: '8px 12px', marginRight: 8 }}>New Stop</button></Link>
          <button onClick={load} style={{ padding: '8px 12px' }}>{loading ? 'Refreshing...' : 'Refresh'}</button>
        </div>
      </div>
      <div style={{ marginTop: '1.5rem' }}>
        {loading && stops.length === 0 ? (
          <p>Loading...</p>
        ) : stops.length === 0 ? (
          <p>No stops found.</p>
        ) : (
          <div style={{ display: 'grid', gap: '1rem' }}>
            {stops.map((stop: any) => (
              <div key={stop.id} style={{ padding: '1rem', border: '1px solid #e5e7eb', borderRadius: 16 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <h3 style={{ margin: '0 0 0.5rem' }}>{stop.name || `Stop ${stop.id}`}</h3>
                  <div>
                    <Link href={`/stops/${stop.id}/edit`}><button style={{ marginRight: 8 }}>Edit</button></Link>
                  </div>
                </div>
                <p style={{ margin: '0.25rem 0' }}>Route: {stop.routeId || 'Unassigned'}</p>
                <p style={{ margin: '0.25rem 0' }}>Location: {stop.location || 'N/A'}</p>
                <p style={{ margin: '0.25rem 0' }}>Order: {stop.sequence ?? 'N/A'}</p>
              </div>
            ))}
          </div>
        )}
      </div>
    </AdminShell>
  )
}
