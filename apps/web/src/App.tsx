import { useEffect, useState } from 'react'

function App() {
  const [message, setMessage] = useState('Loading...')

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/`)
      .then(res => res.text())
      .then(data => setMessage(data))
      .catch(() => setMessage('Error connecting to API'))
  }, [])

  return (
    <div>
      <h1>Frontend + Backend</h1>
      <p>Message from Hono: <strong>{message}</strong></p>
    </div>
  )
}

export default App
