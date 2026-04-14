resource "cloudflare_worker_script" "api" {
  account_id = var.cloudflare_account_id
  name       = "my-hono-api"
  content    = file("${path.module}/../apps/api/dist/index.js")
  module     = true

  plain_text_binding {
    name = "ALLOWED_ORIGIN"
    text = "https://my-hono-react-web.pages.dev"
  }
}

resource "cloudflare_worker_domain" "api_subdomain" {
  account_id  = var.cloudflare_account_id
  hostname    = "my-hono-api.shamil-khan.workers.dev"
  service     = cloudflare_worker_script.api.name
  environment = "production"
}