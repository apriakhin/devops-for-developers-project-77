resource "digitalocean_ssh_key" "local" {
  name       = "macbook-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}
