import { useEffect, useState } from 'react'

function App() {
  console.log('App created')
  const [message, setMessage] = useState('Loading...')

  useEffect(() => {
    const apiUrl = import.meta.env.VITE_API_URL
    console.log('API URL:', apiUrl)
    fetch(`${apiUrl}/`)
      .then(res => res.text())
      .then(data => setMessage(data))
      .catch(() => setMessage('Error connecting to API'))
  }, [])

  return (
    <div>
      <h1>Hello: Frontend + Backend + Shop</h1>
      <p>Message from Hono-Api: <strong>{message}</strong></p>
    </div>
  )
}

export default App
