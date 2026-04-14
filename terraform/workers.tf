resource "cloudflare_workers_script" "api" {
  account_id = var.cloudflare_account_id
  name       = "my-hono-api"
  content    = file("${path.module}/../apps/api/dist/index.js")
  module     = true

  plain_text_binding {
    name = "ALLOWED_ORIGIN"
    text = "https://my-hono-react-web.pages.dev"
  }
}