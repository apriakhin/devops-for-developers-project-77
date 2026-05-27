resource "digitalocean_loadbalancer" "app" {
  name                  = "app-lb"
  region                = var.region
  network_stack         = "IPV4"
  vpc_uuid              = digitalocean_vpc.app.id

  droplet_ids = [
    for droplet in digitalocean_droplet.apps :
    droplet.id
  ]

  forwarding_rule {
    entry_protocol      = "https"
    entry_port          = 443
    target_protocol     = "http"
    target_port         = 80
    certificate_name    = digitalocean_certificate.app.name
  }

  healthcheck {
    protocol = "http"
    port     = 80
    path     = "/"
  }
}
