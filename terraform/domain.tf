resource "digitalocean_domain" "app" {
  name        = var.domain
}

resource "digitalocean_record" "app" {
  domain  = digitalocean_domain.app.name
  type    = "A"
  name    = var.subdomain
  value   = digitalocean_loadbalancer.app.ip
  ttl     = 300
}
