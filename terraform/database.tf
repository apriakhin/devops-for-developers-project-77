resource "digitalocean_database_cluster" "postgres" {
  name                    = "app-postgres"
  engine                  = "pg"
  version                 = "18"
  size                    = "db-s-1vcpu-1gb"
  region                  = var.region
  node_count              = 1
  private_network_uuid    = digitalocean_vpc.app.id
}

resource "local_file" "ansible_db_vars" {
  filename = "${path.module}/../ansible/group_vars/webservers/db.yml"

  content = templatefile("${path.module}/templates/db.tftpl", {
    db_host         = digitalocean_database_cluster.postgres.private_host
    db_port         = digitalocean_database_cluster.postgres.port
    db_database     = digitalocean_database_cluster.postgres.database
    db_username     = digitalocean_database_cluster.postgres.user
    db_password     = digitalocean_database_cluster.postgres.password
  })

  file_permission = "0600"
}
