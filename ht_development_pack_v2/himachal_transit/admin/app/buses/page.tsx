"use client"
import AdminShell from '../components/AdminShell'
import Link from 'next/link'
import { useEffect, useState } from 'react'
import { fetchFromApi } from '../../lib/api'
import { useToasts } from '../components/ToastProvider'

export default function BusesPage() {
  const [buses, setBuses] = useState<any[]>([])
  const [loading, setLoading] = useState(false)
  const { showToast } = useToasts()

  async function load() {
    setLoading(true)
    try {
      const data = await fetchFromApi('/buses')
      setBuses(data)
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
          <h2>Buses</h2>
          <p>List and manage the transit fleet.</p>
        </div>
        <div>
          <Link href="/buses/new"><button style={{ padding: '8px 12px', marginRight: 8 }}>New Bus</button></Link>
          <button onClick={load} style={{ padding: '8px 12px' }}>{loading ? 'Refreshing...' : 'Refresh'}</button>
        </div>
      </div>
      <div style={{ marginTop: '1.5rem' }}>
        {loading && buses.length === 0 ? (
          <p>Loading...</p>
        ) : buses.length === 0 ? (
          <p>No buses found.</p>
        ) : (
          <div style={{ display: 'grid', gap: '1rem' }}>
            {buses.map((bus: any) => (
              <div key={bus.id} style={{ padding: '1rem', border: '1px solid #e5e7eb', borderRadius: 16 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <h3 style={{ margin: '0 0 0.5rem' }}>{bus.name || `Bus ${bus.id}`}</h3>
                  <div>
                    <Link href={`/buses/${bus.id}/edit`}><button style={{ marginRight: 8 }}>Edit</button></Link>
                  </div>
                </div>
                <p style={{ margin: '0.25rem 0' }}>Route: {bus.routeId || 'Unassigned'}</p>
                <p style={{ margin: '0.25rem 0' }}>Capacity: {bus.capacity ?? 'N/A'}</p>
                <p style={{ margin: '0.25rem 0' }}>Status: {bus.status || 'Unknown'}</p>
              </div>
            ))}
          </div>
        )}
      </div>
    </AdminShell>
  )
}
