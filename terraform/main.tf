# main.tf
terraform {
  cloud {
    organization = "shamil-khan"
    workspaces {
      name = "Soda"
    }
  }
  
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  # reads CLOUDFLARE_API_TOKEN from environment automatically
}