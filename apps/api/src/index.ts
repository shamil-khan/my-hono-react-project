import { Hono } from 'hono'
import { cors } from 'hono/cors'

type Bindings = {
  ALLOWED_ORIGIN: string
}

const app = new Hono<{ Bindings: Bindings }>()

app.use('/*', async (c, next) => {
  const corsMiddleware = cors({
    origin: c.env.ALLOWED_ORIGIN,
    allowMethods: ['GET', 'POST', 'OPTIONS'],
  })
  return corsMiddleware(c, next)
})

app.get('/', (c) => c.text(`Hello Hono from Cloudflare! ${new Date().toLocaleString()}`))

export default app
