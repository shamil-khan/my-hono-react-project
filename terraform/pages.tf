resource "cloudflare_pages_project" "frontend" {
  account_id        = var.cloudflare_account_id
  name              = "my-hono-react-web"
  production_branch = "main"

  build_config {
    build_command   = "pnpm run build"
    destination_dir = "dist"
    root_dir        = "apps/web"
  }
  
  deployment_config {
    production {
      environment_variables = {
        # Replace with your actual workers.dev URL
        VITE_API_URL = "https://my-hono-api.shamil-khan.workers.dev"
      }
    }
  }
}
