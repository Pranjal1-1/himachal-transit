export const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:3000'

export function getAuthToken(): string | null {
  try {
    return typeof window !== 'undefined' ? localStorage.getItem('admin_token') : null
  } catch (e) {
    return null
  }
}

export function setAuthToken(token: string | null) {
  try {
    if (typeof window !== 'undefined') {
      if (token) localStorage.setItem('admin_token', token)
      else localStorage.removeItem('admin_token')
    }
  } catch (e) {
    // ignore
  }
}

export function getRefreshToken(): string | null {
  try {
    return typeof window !== 'undefined' ? localStorage.getItem('admin_refresh') : null
  } catch (e) {
    return null
  }
}

export function setRefreshToken(token: string | null) {
  try {
    if (typeof window !== 'undefined') {
      if (token) localStorage.setItem('admin_refresh', token)
      else localStorage.removeItem('admin_refresh')
    }
  } catch (e) {
    // ignore
  }
}

export async function fetchFromApi(path: string, init: RequestInit = {}) {
  const url = `${API_BASE_URL}${path}`
  const headers: Record<string, string> = { 'Content-Type': 'application/json', ...(init.headers as Record<string, string> || {}) }
  const token = getAuthToken()
  if (token) headers['Authorization'] = `Bearer ${token}`
  let res = await fetch(url, { ...init, headers, cache: 'no-store' })

  // If unauthorized, try refresh once and retry the original request
  if (res.status === 401) {
    const refreshed = await tryRefreshToken()
    if (refreshed) {
      const newToken = getAuthToken()
      if (newToken) headers['Authorization'] = `Bearer ${newToken}`
      res = await fetch(url, { ...init, headers, cache: 'no-store' })
    }
  }

  if (!res.ok) {
    const text = await res.text().catch(() => '')
    throw new Error(`API ${res.status} ${res.statusText} ${text}`)
  }
  return res.json()
}

async function tryRefreshToken(): Promise<boolean> {
  const refresh = getRefreshToken()
  if (!refresh) return false
  try {
    const url = `${API_BASE_URL}/auth/refresh`
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ refresh }) })
    if (!res.ok) {
      // clear tokens on failed refresh
      setAuthToken(null)
      setRefreshToken(null)
      return false
    }
    const body = await res.json()
    const tokens = (body && body.tokens) || body
    if (tokens?.access) setAuthToken(tokens.access)
    if (tokens?.refresh) setRefreshToken(tokens.refresh)
    return true
  } catch (e) {
    setAuthToken(null)
    setRefreshToken(null)
    return false
  }
}

export async function postToApi(path: string, body: any) {
  return fetchFromApi(path, { method: 'POST', body: JSON.stringify(body) })
}

export async function patchToApi(path: string, body: any) {
  return fetchFromApi(path, { method: 'PATCH', body: JSON.stringify(body) })
}

export async function adminLogin(identifier: string, password: string) {
  const url = `${API_BASE_URL}/auth/login`
  const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ identifier, password }) })
  if (!res.ok) {
    const text = await res.text().catch(() => '')
    throw new Error(`Login failed: ${res.status} ${res.statusText} ${text}`)
  }
  const body = await res.json()
  // backend returns { ...role, tokens }
  const tokens = (body && body.tokens) || body
  if (tokens?.access) setAuthToken(tokens.access)
  if (tokens?.refresh) setRefreshToken(tokens.refresh)
  return body
}
