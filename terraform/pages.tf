resource "cloudflare_pages_project" "frontend" {
  account_id        = var.cloudflare_account_id
  name              = "my-hono-react-web"
  production_branch = "main"

  build_config {
    build_command   = "pnpm run build"
    destination_dir = "dist"
    root_dir        = "apps/web"
  }
}
