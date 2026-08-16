"use client"
import { useState } from 'react'
import { postToApi } from '../../../lib/api'
import { useToasts } from '../../components/ToastProvider'
import { useRouter } from 'next/navigation'

export default function NewStopPage() {
  const [name, setName] = useState('')
  const [latitude, setLatitude] = useState<number | ''>('')
  const [longitude, setLongitude] = useState<number | ''>('')
  const [address, setAddress] = useState('')
  const [status, setStatus] = useState('active')
  const [error, setError] = useState<string | null>(null)
  const router = useRouter()
  const { showToast } = useToasts()

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    if (!name || latitude === '' || longitude === '') return setError('Name and location required')
    try {
      await postToApi('/stops', { name, latitude, longitude, address, status })
      showToast('Stop created')
      router.push('/stops')
    } catch (e: any) {
      setError(e.message)
    }
  }

  return (
    <div style={{ padding: 20 }}>
      <h2>New Stop</h2>
      <form onSubmit={submit} style={{ display: 'grid', gap: 8, maxWidth: 720 }}>
        <input placeholder="Name" value={name} onChange={(e) => setName(e.target.value)} />
        <input placeholder="Latitude" type="number" value={latitude as any} onChange={(e) => setLatitude(e.target.value === '' ? '' : Number(e.target.value))} />
        <input placeholder="Longitude" type="number" value={longitude as any} onChange={(e) => setLongitude(e.target.value === '' ? '' : Number(e.target.value))} />
        <input placeholder="Address" value={address} onChange={(e) => setAddress(e.target.value)} />
        <select value={status} onChange={(e) => setStatus(e.target.value)}>
          <option value="active">active</option>
          <option value="inactive">inactive</option>
        </select>
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <div>
          <button type="submit" style={{ padding: '8px 12px' }}>Create Stop</button>
        </div>
      </form>
    </div>
  )
}
