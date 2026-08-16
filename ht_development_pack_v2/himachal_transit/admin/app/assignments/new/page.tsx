"use client"
import { useState } from 'react'
import { postToApi } from '../../../lib/api'
import { useToasts } from '../../components/ToastProvider'
import { useRouter } from 'next/navigation'

export default function NewAssignmentPage() {
  const [driverId, setDriverId] = useState('')
  const [busId, setBusId] = useState('')
  const [routeId, setRouteId] = useState('')
  const [startTime, setStartTime] = useState('')
  const [endTime, setEndTime] = useState('')
  const [status, setStatus] = useState('scheduled')
  const [error, setError] = useState<string | null>(null)
  const router = useRouter()
  const { showToast } = useToasts()

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    if (!driverId || !busId) return setError('Driver and Bus required')
    try {
      await postToApi('/assignments', { driverId, busId, routeId, startTime, endTime, status })
      showToast('Assignment created')
      router.push('/assignments')
    } catch (e: any) {
      setError(e.message)
    }
  }

  return (
    <div style={{ padding: 20 }}>
      <h2>New Assignment</h2>
      <form onSubmit={submit} style={{ display: 'grid', gap: 8, maxWidth: 720 }}>
        <input placeholder="Driver ID" value={driverId} onChange={(e) => setDriverId(e.target.value)} />
        <input placeholder="Bus ID" value={busId} onChange={(e) => setBusId(e.target.value)} />
        <input placeholder="Route ID" value={routeId} onChange={(e) => setRouteId(e.target.value)} />
        <input placeholder="Start Time (ISO)" value={startTime} onChange={(e) => setStartTime(e.target.value)} />
        <input placeholder="End Time (ISO)" value={endTime} onChange={(e) => setEndTime(e.target.value)} />
        <select value={status} onChange={(e) => setStatus(e.target.value)}>
          <option value="scheduled">scheduled</option>
          <option value="active">active</option>
          <option value="completed">completed</option>
        </select>
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <div>
          <button type="submit" style={{ padding: '8px 12px' }}>Create Assignment</button>
        </div>
      </form>
    </div>
  )
}
