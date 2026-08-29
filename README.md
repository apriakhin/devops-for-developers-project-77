### Hexlet tests and linter status:

[![Actions Status](https://github.com/apriakhin/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/apriakhin/devops-for-developers-project-77/actions)

# Infrastructure as Code

This project provisions and configures a production environment for
[Redmine](https://www.redmine.org/). Terraform creates DigitalOcean resources,
including servers, a PostgreSQL database, networking, a load balancer, DNS, and
TLS certificates. Ansible configures the servers, deploys the Redmine Docker
container, and enables Datadog monitoring.

The deployed application is available at
[devops-for-developers-project-77.apriakhin.com](https://devops-for-developers-project-77.apriakhin.com).

## Install

Python, pip, Ansible, Terraform, Make, and Git are required.

Clone the repository, install Ansible dependencies, and generate the Terraform
configuration from encrypted secrets:

```sh
git clone https://github.com/apriakhin/devops-for-developers-project-77.git
cd devops-for-developers-project-77
make ansible-install
make terraform-secrets
```

Secrets are stored in `ansible/group_vars/all/vault.yml` and require the local
vault password file at `ansible/.vault_pass`. Do not commit either file. Use
`make vault-edit` to update encrypted values.

Initialize Terraform, review the planned changes, and provision the
infrastructure:

```sh
make terraform-init
make terraform-plan
make terraform-apply
```

## Usage

After Terraform creates the inventory, verify connectivity and configure the
servers:

```sh
make ansible-ping
make ansible-setup
make ansible-deploy
make ansible-monitoring
```

Open the application URL in a browser after deployment. To remove the managed
cloud infrastructure, run `make terraform-destroy`; this action is destructive.

## Project commands

| Command | Description |
| --- | --- |
| `make vault-encrypt` | Encrypts the Ansible vault. |
| `make vault-edit` | Opens the encrypted vault for editing. |
| `make terraform-secrets` | Generates Terraform secrets and environment files. |
| `make terraform-init` | Initializes Terraform providers and backend. |
| `make terraform-state` | Lists resources in the Terraform state. |
| `make terraform-plan` | Shows planned infrastructure changes. |
| `make terraform-apply` | Creates or updates the infrastructure. |
| `make terraform-destroy` | Destroys the managed infrastructure. |
| `make ansible-ping` | Checks connectivity to provisioned servers. |
| `make ansible-install` | Installs required Ansible roles and collections. |
| `make ansible-setup` | Updates servers and installs Docker dependencies. |
| `make ansible-deploy` | Configures and starts the Redmine container. |
| `make ansible-monitoring` | Installs and configures the Datadog Agent. |
