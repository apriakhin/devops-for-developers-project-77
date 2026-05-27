locals {
  full_domain   = "${var.subdomain}.${var.domain}"
}

resource "digitalocean_certificate" "app" {
  name          = "app-cert"
  type          = "lets_encrypt"
  domains       = [local.full_domain]
  depends_on    = [digitalocean_domain.app]
}
