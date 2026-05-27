### Hexlet tests and linter status:
[![Actions Status](https://github.com/apriakhin/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/apriakhin/devops-for-developers-project-77/actions)

## URL

https://devops-for-developers-project-77.apriakhin.com

## Requirements

- Python
- PIP
- Ansible
- Terraform
- Make
- Git

## Getting Started

### Encrypt secrets

```bash
make vault-encrypt
```

### Edit secrets

```bash
make vault-edit
```

### Generate Terraform secrets

```bash
make terraform-secrets
```

### Initialize Terraform

```bash
make terraform-init
```

### Check state

```bash
make terraform-state
```

### Check what will change

```bash
make terraform-plan
```

### Deploy infrastructure

```bash
make terraform-apply
```

### Destroy infrastructure

```bash
make terraform-destroy
```
