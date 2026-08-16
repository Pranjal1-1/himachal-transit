"use client"
import { useState } from 'react'
import { setAuthToken, adminLogin, setRefreshToken } from '../../lib/api'
import { useToasts } from '../components/ToastProvider'
import { useRouter } from 'next/navigation'

export default function LoginPage() {
  const [identifier, setIdentifier] = useState('')
  const [password, setPassword] = useState('')
  const [token, setTokenState] = useState('')
  const [error, setError] = useState<string | null>(null)
  const router = useRouter()
  const { showToast } = useToasts()

  async function submitCreds(e: any) {
    e.preventDefault()
    setError(null)
    if (!identifier || !password) return setError('Provide identifier and password')
    try {
      await adminLogin(identifier, password)
      showToast('Login successful')
      router.push('/')
    } catch (e: any) {
      setError(e.message)
    }
  }

  async function submitToken(e: any) {
    e.preventDefault()
    setError(null)
    if (!token) return setError('Paste a token or use email/password')
    try {
      setAuthToken(token)
      // clear any refresh token when manually pasting
      setRefreshToken(null)
      showToast('Token saved')
      router.push('/')
    } catch (e: any) {
      setError(e.message)
    }
  }

  return (
    <div style={{ padding: 20 }}>
      <h2>Admin Login</h2>
      <p>Sign in with email/phone and password, or paste a token for development.</p>
      <div style={{ display: 'grid', gap: 16, maxWidth: 640 }}>
        <form onSubmit={submitCreds} style={{ display: 'grid', gap: 8 }}>
          <input placeholder="Email or phone" value={identifier} onChange={(e) => setIdentifier(e.target.value)} />
          <input placeholder="Password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
          <div>
            <button type="submit" style={{ padding: '8px 12px' }}>Sign in</button>
          </div>
        </form>

        <hr />

        <form onSubmit={submitToken} style={{ display: 'grid', gap: 8 }}>
          <textarea value={token} onChange={(e) => setTokenState(e.target.value)} rows={4} placeholder="Paste token here" />
          <div>
            <button type="submit" style={{ padding: '8px 12px' }}>Save token and continue</button>
          </div>
        </form>

        {error && <div style={{ color: 'red' }}>{error}</div>}
      </div>
    </div>
  )
}
