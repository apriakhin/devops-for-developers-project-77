resource "digitalocean_database_cluster" "postgres" {
  name                    = "app-postgres"
  engine                  = "pg"
  version                 = "18"
  size                    = "db-s-1vcpu-1gb"
  region                  = var.region
  node_count              = 1
  private_network_uuid    = digitalocean_vpc.app.id
}
