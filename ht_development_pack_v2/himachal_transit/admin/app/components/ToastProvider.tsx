"use client"
import React, { createContext, useContext, useState, ReactNode } from 'react'

type Toast = { id: number; message: string }

type ToastContextType = { showToast: (message: string) => void }

const ToastContext = createContext<ToastContextType>({ showToast: () => {} })

export function ToastProvider({ children }: { children: ReactNode }) {
  const [toasts, setToasts] = useState<Toast[]>([])

  function showToast(message: string) {
    const id = Date.now()
    setToasts((s) => [...s, { id, message }])
    setTimeout(() => setToasts((s) => s.filter((t) => t.id !== id)), 3000)
  }

  return (
    <ToastContext.Provider value={{ showToast }}>
      {children}
      <div style={{ position: 'fixed', right: 16, top: 16, zIndex: 9999 }}>
        {toasts.map((t) => (
          <div key={t.id} style={{ background: '#323232', color: '#fff', padding: '8px 12px', borderRadius: 6, marginBottom: 8, boxShadow: '0 2px 6px rgba(0,0,0,0.2)' }}>
            {t.message}
          </div>
        ))}
      </div>
    </ToastContext.Provider>
  )
}

export function useToasts() {
  return useContext(ToastContext)
}

export default ToastProvider
