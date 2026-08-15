"use client"
import { useEffect, useState } from 'react'
import { useRouter, useParams } from 'next/navigation'
import { fetchFromApi, patchToApi } from '../../../../lib/api'
import { useToasts } from '../../../components/ToastProvider'

export default function EditBusPage() {
  const params = useParams() as { id?: string }
  const id = params?.id
  const router = useRouter()
  const { showToast } = useToasts()
  const [bus, setBus] = useState<any>(null)
  const [organizationId, setOrganizationId] = useState('')
  const [registrationNumber, setRegistrationNumber] = useState('')
  const [model, setModel] = useState('')
  const [capacity, setCapacity] = useState<number | ''>('')
  const [status, setStatus] = useState('active')
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!id) return
    fetchFromApi(`/buses/${id}`).then(setBus).catch((e) => setError(e.message))
  }, [id])

  useEffect(() => {
    if (!bus) return
    setOrganizationId(bus.organizationId || '')
    setRegistrationNumber(bus.registrationNumber || '')
    setModel(bus.model || '')
    setCapacity(bus.capacity ?? '')
    setStatus(bus.status || 'active')
  }, [bus])

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    try {
      const patch: any = { organizationId, registrationNumber, model, capacity: capacity === '' ? undefined : capacity, status }
      await patchToApi(`/buses/${id}`, patch)
      showToast('Bus updated')
      router.push('/buses')
    } catch (e: any) {
      setError(e.message)
    }
  }

  if (!id) return <div style={{ padding: 20 }}>Missing bus id</div>

  return (
    <div style={{ padding: 20 }}>
      <h2>Edit Bus</h2>
      <form onSubmit={submit} style={{ display: 'grid', gap: 8, maxWidth: 720 }}>
        <input placeholder="Organization ID" value={organizationId} onChange={(e) => setOrganizationId(e.target.value)} />
        <input placeholder="Registration Number" value={registrationNumber} onChange={(e) => setRegistrationNumber(e.target.value)} />
        <input placeholder="Model" value={model} onChange={(e) => setModel(e.target.value)} />
        <input placeholder="Capacity" type="number" value={capacity as any} onChange={(e) => setCapacity(e.target.value === '' ? '' : Number(e.target.value))} />
        <select value={status} onChange={(e) => setStatus(e.target.value)}>
          <option value="active">active</option>
          <option value="inactive">inactive</option>
          <option value="maintenance">maintenance</option>
        </select>
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <div>
          <button type="submit" style={{ padding: '8px 12px' }}>Save</button>
        </div>
      </form>
    </div>
  )
}
