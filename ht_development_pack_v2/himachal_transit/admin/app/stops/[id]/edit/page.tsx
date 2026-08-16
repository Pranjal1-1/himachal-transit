"use client"
import { useEffect, useState } from 'react'
import { useRouter, useParams } from 'next/navigation'
import { fetchFromApi, patchToApi } from '../../../../lib/api'
import { useToasts } from '../../../components/ToastProvider'

export default function EditStopPage() {
  const params = useParams() as { id?: string }
  const id = params?.id
  const router = useRouter()
  const { showToast } = useToasts()
  const [stop, setStop] = useState<any>(null)
  const [name, setName] = useState('')
  const [latitude, setLatitude] = useState<number | ''>('')
  const [longitude, setLongitude] = useState<number | ''>('')
  const [address, setAddress] = useState('')
  const [status, setStatus] = useState('active')
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!id) return
    fetchFromApi(`/stops/${id}`).then(setStop).catch((e) => setError(e.message))
  }, [id])

  useEffect(() => {
    if (!stop) return
    setName(stop.name || '')
    setLatitude(stop.latitude ?? '')
    setLongitude(stop.longitude ?? '')
    setAddress(stop.address || '')
    setStatus(stop.status || 'active')
  }, [stop])

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    try {
      const patch: any = { name, latitude, longitude, address, status }
      await patchToApi(`/stops/${id}`, patch)
      showToast('Stop updated')
      router.push('/stops')
    } catch (e: any) {
      setError(e.message)
    }
  }

  if (!id) return <div style={{ padding: 20 }}>Missing stop id</div>

  return (
    <div style={{ padding: 20 }}>
      <h2>Edit Stop</h2>
      <form onSubmit={submit} style={{ display: 'grid', gap: 8, maxWidth: 720 }}>
        <input placeholder="Name" value={name} onChange={(e) => setName(e.target.value)} />
        <input placeholder="Latitude" type="number" value={latitude as any} onChange={(e) => setLatitude(e.target.value === '' ? '' : Number(e.target.value))} />
        <input placeholder="Longitude" type="number" value={longitude as any} onChange={(e) => setLongitude(e.target.value === '' ? '' : Number(e.target.value))} />
        <input placeholder="Address" value={address} onChange={(e) => setAddress(e.target.value)} />
        <select value={status} onChange={(e) => setStatus(e.target.value)}>
          <option value="active">active</option>
          <option value="inactive">inactive</option>
          <option value="disabled">disabled</option>
        </select>
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <div>
          <button type="submit" style={{ padding: '8px 12px' }}>Save</button>
        </div>
      </form>
    </div>
  )
}
