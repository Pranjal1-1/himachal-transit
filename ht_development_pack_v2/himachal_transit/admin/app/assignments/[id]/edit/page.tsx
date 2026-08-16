"use client"
import { useEffect, useState } from 'react'
import { useRouter, useParams } from 'next/navigation'
import { fetchFromApi, patchToApi } from '../../../../lib/api'
import { useToasts } from '../../../components/ToastProvider'

export default function EditAssignmentPage() {
  const params = useParams() as { id?: string }
  const id = params?.id
  const router = useRouter()
  const { showToast } = useToasts()
  const [assignment, setAssignment] = useState<any>(null)
  const [driverId, setDriverId] = useState('')
  const [busId, setBusId] = useState('')
  const [routeId, setRouteId] = useState('')
  const [startTime, setStartTime] = useState('')
  const [endTime, setEndTime] = useState('')
  const [status, setStatus] = useState('scheduled')
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (!id) return
    fetchFromApi(`/assignments/${id}`).then(setAssignment).catch((e) => setError(e.message))
  }, [id])

  useEffect(() => {
    if (!assignment) return
    setDriverId(assignment.driverId || '')
    setBusId(assignment.busId || '')
    setRouteId(assignment.routeId || '')
    setStartTime(assignment.startTime || '')
    setEndTime(assignment.endTime || '')
    setStatus(assignment.status || 'scheduled')
  }, [assignment])

  async function submit(e: any) {
    e.preventDefault()
    setError(null)
    try {
      const patch: any = { driverId, busId, routeId, startTime, endTime, status }
      await patchToApi(`/assignments/${id}`, patch)
      showToast('Assignment updated')
      router.push('/assignments')
    } catch (e: any) {
      setError(e.message)
    }
  }

  if (!id) return <div style={{ padding: 20 }}>Missing assignment id</div>

  return (
    <div style={{ padding: 20 }}>
      <h2>Edit Assignment</h2>
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
          <button type="submit" style={{ padding: '8px 12px' }}>Save</button>
        </div>
      </form>
    </div>
  )
}
