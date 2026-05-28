resource "digitalocean_droplet" "apps" {
  for_each    = toset(["app-1", "app-2"])
  name        = each.value
  region      = var.region
  size        = "s-1vcpu-1gb"
  image       = "ubuntu-24-04-x64"
  ssh_keys    = [digitalocean_ssh_key.local.id]
  vpc_uuid    = digitalocean_vpc.app.id
  user_data   = <<-EOF
    #cloud-config
    runcmd:
      - fallocate -l 4G /swapfile
      - chmod 600 /swapfile
      - mkswap /swapfile
      - swapon /swapfile
      - echo '/swapfile none swap sw 0 0' >> /etc/fstab
  EOF
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"

  content = templatefile("${path.module}/templates/inventory.tftpl", {
    app_ips = {
      for name, droplet in digitalocean_droplet.apps :
      name => droplet.ipv4_address
    }
  })
}
