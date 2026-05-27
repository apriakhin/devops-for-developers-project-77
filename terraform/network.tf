resource "digitalocean_vpc" "app" {
  name     = "app-vpc"
  region   = var.region
  ip_range = "10.20.0.0/16"
}
