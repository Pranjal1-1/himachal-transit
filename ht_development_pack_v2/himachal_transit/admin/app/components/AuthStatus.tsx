"use client"
import { useEffect, useState } from 'react'
import { getAuthToken, setAuthToken } from '../../lib/api'
import { useRouter } from 'next/navigation'

export default function AuthStatus() {
  const [token, setToken] = useState<string | null>(null)
  const router = useRouter()

  useEffect(() => {
    setToken(getAuthToken())
  }, [])

  function logout() {
    setAuthToken(null)
    setToken(null)
    router.push('/')
  }

  if (!token) {
    return <a href="/login">Admin login</a>
  }

  return (
    <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
      <span style={{ color: '#374151' }}>Authenticated</span>
      <button onClick={logout} style={{ padding: '6px 10px', borderRadius: 8 }}>Logout</button>
    </div>
  )
}
