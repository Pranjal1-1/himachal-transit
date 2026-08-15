"use client"
import { useState } from 'react'
import { postToApi } from '../../../lib/api'
import { useToasts } from '../../components/ToastProvider'
import { useRouter } from 'next/navigation'

export default function NewRoutePage() {
  const [organizationId, setOrganizationId] = useState('')
  const [name, setName] = useState('')
  const [origin, setOrigin] = useState('')
  const [destination, setDestination] = useState('')
  const [geometry, setGeometry] = useState('')
  const [error, setError] = useState<string | null>(null)
  const router = useRouter()
  const { showToast } = useToasts()

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    if (!organizationId || !name) return setError('Organization and name required')
    try {
      await postToApi('/routes', { organizationId, name, origin, destination, geometry })
      showToast('Route created')
      router.push('/routes')
    } catch (e: any) {
      setError(e.message)
    }
  }

  return (
    <div style={{ padding: 20 }}>
      <h2>New Route</h2>
      <form onSubmit={submit} style={{ display: 'grid', gap: 8, maxWidth: 720 }}>
        <input placeholder="Organization ID" value={organizationId} onChange={(e) => setOrganizationId(e.target.value)} />
        <input placeholder="Name" value={name} onChange={(e) => setName(e.target.value)} />
        <input placeholder="Origin" value={origin} onChange={(e) => setOrigin(e.target.value)} />
        <input placeholder="Destination" value={destination} onChange={(e) => setDestination(e.target.value)} />
        <textarea placeholder="Geometry (GeoJSON or WKT)" value={geometry} onChange={(e) => setGeometry(e.target.value)} />
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <div>
          <button type="submit" style={{ padding: '8px 12px' }}>Create Route</button>
        </div>
      </form>
    </div>
  )
}
