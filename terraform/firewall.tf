resource "digitalocean_database_firewall" "postgres" {
  cluster_id = digitalocean_database_cluster.postgres.id

  dynamic "rule" {
    for_each = digitalocean_droplet.apps

    content {
      type  = "droplet"
      value = rule.value.id
    }
  }
}
