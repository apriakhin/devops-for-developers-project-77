vault-encrypt:
	ansible-vault encrypt ansible/group_vars/all/vault.yml --vault-password-file ansible/.vault_pass

vault-edit:
	ansible-vault edit ansible/group_vars/all/vault.yml --vault-password-file ansible/.vault_pass

terraform-secrets:
	ansible-playbook ansible/playbook.yml -t terraform-secrets --vault-password-file ansible/.vault_pass

terraform-init:
	cd terraform && set -a && source .env && set +a && terraform init

terraform-state:
	cd terraform && set -a && source .env && set +a && terraform state list

terraform-plan:
	cd terraform && set -a && source .env && set +a && terraform plan

terraform-apply:
	cd terraform && set -a && source .env && set +a && terraform apply -auto-approve

terraform-destroy:
	cd terraform && set -a && source .env && set +a && terraform destroy -auto-approve
