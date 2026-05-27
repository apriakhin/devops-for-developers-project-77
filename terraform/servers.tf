resource "digitalocean_droplet" "apps" {
  for_each    = toset(["app-1", "app-2"])
  name        = each.value
  region      = var.region
  size        = "s-1vcpu-1gb"
  image       = "ubuntu-24-04-x64"
  ssh_keys    = [digitalocean_ssh_key.local.id]
  vpc_uuid    = digitalocean_vpc.app.id
}
