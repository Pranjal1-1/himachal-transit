"use client"
import { useEffect, useState } from 'react'
import { useRouter, useParams } from 'next/navigation'
import { fetchFromApi, patchToApi } from '../../../../lib/api'
import { useToasts } from '../../../components/ToastProvider'

export default function EditRoutePage() {
  const params = useParams() as { id?: string }
  const id = params?.id
  const router = useRouter()
  const { showToast } = useToasts()
  const [route, setRoute] = useState<any>(null)
  const [organizationId, setOrganizationId] = useState('')
  const [name, setName] = useState('')
  const [origin, setOrigin] = useState('')
  const [destination, setDestination] = useState('')
  const [geometry, setGeometry] = useState('')
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!id) return
    fetchFromApi(`/routes/${id}`).then(setRoute).catch((e) => setError(e.message))
  }, [id])

  useEffect(() => {
    if (!route) return
    setOrganizationId(route.organizationId || '')
    setName(route.name || '')
    setOrigin(route.origin || '')
    setDestination(route.destination || '')
    setGeometry(route.geometry || '')
  }, [route])

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    try {
      const patch: any = { organizationId, name, origin, destination, geometry }
      await patchToApi(`/routes/${id}`, patch)
      showToast('Route updated')
      router.push('/routes')
    } catch (e: any) {
      setError(e.message)
    }
  }

  if (!id) return <div style={{ padding: 20 }}>Missing route id</div>

  return (
    <div style={{ padding: 20 }}>
      <h2>Edit Route</h2>
      <form onSubmit={submit} style={{ display: 'grid', gap: 8, maxWidth: 720 }}>
        <input placeholder="Organization ID" value={organizationId} onChange={(e) => setOrganizationId(e.target.value)} />
        <input placeholder="Name" value={name} onChange={(e) => setName(e.target.value)} />
        <input placeholder="Origin" value={origin} onChange={(e) => setOrigin(e.target.value)} />
        <input placeholder="Destination" value={destination} onChange={(e) => setDestination(e.target.value)} />
        <textarea placeholder="Geometry" value={geometry} onChange={(e) => setGeometry(e.target.value)} />
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <div>
          <button type="submit" style={{ padding: '8px 12px' }}>Save</button>
        </div>
      </form>
    </div>
  )
}
