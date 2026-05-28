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

ansible-ping:
	cd ansible && ansible webservers -i inventory.ini -m ping -vvvv --vault-password-file .vault_pass

ansible-install:
	cd ansible && ansible-galaxy install -r requirements.yml

ansible-setup:
	cd ansible && ansible-playbook playbook.yml -i inventory.ini --tags setup --vault-password-file .vault_pass

ansible-deploy:
	cd ansible && ansible-playbook playbook.yml -i inventory.ini --tags deploy --vault-password-file .vault_pass

ansible-monitoring:
	cd ansible && ansible-playbook playbook.yml -i inventory.ini --tags monitoring --vault-password-file .vault_pass
