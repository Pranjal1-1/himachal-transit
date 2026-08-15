"use client"
import AdminShell from '../components/AdminShell'
import Link from 'next/link'
import { useEffect, useState } from 'react'
import { fetchFromApi } from '../../lib/api'
import { useToasts } from '../components/ToastProvider'

export default function AssignmentsPage() {
  const [assignments, setAssignments] = useState<any[]>([])
  const [loading, setLoading] = useState(false)
  const { showToast } = useToasts()

  async function load() {
    setLoading(true)
    try {
      const data = await fetchFromApi('/assignments')
      setAssignments(data)
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
          <h2>Assignments</h2>
          <p>Manage bus and driver route assignments.</p>
        </div>
        <div>
          <Link href="/assignments/new"><button style={{ padding: '8px 12px', marginRight: 8 }}>New Assignment</button></Link>
          <button onClick={load} style={{ padding: '8px 12px' }}>{loading ? 'Refreshing...' : 'Refresh'}</button>
        </div>
      </div>
      <div style={{ marginTop: '1.5rem' }}>
        {loading && assignments.length === 0 ? (
          <p>Loading...</p>
        ) : assignments.length === 0 ? (
          <p>No assignments found.</p>
        ) : (
          <div style={{ display: 'grid', gap: '1rem' }}>
            {assignments.map((assignment: any) => (
              <div key={assignment.id} style={{ padding: '1rem', border: '1px solid #e5e7eb', borderRadius: 16 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <h3 style={{ margin: '0 0 0.5rem' }}>Assignment {assignment.id}</h3>
                  <div>
                    <Link href={`/assignments/${assignment.id}/edit`}><button style={{ marginRight: 8 }}>Edit</button></Link>
                  </div>
                </div>
                <p style={{ margin: '0.25rem 0' }}>Route: {assignment.routeId || 'Unassigned'}</p>
                <p style={{ margin: '0.25rem 0' }}>Bus: {assignment.busId || 'Unassigned'}</p>
                <p style={{ margin: '0.25rem 0' }}>Driver: {assignment.driverId || 'Unassigned'}</p>
              </div>
            ))}
          </div>
        )}
      </div>
    </AdminShell>
  )
}
