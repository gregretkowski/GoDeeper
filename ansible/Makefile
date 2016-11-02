
help:          ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

inst-ansible:  ## Install ansible on your system
	sudo ./helpers/install-ansible.sh
inst-kitchen:  ## Set up test-kitchen, and docker on your host
inst-kitchen: inst-ansible
	ansible-playbook -i localhost, helpers/setup-kitchen.yml -c local
setup-dev-env: ## Sets up the dev env.. i.e. ansible/kitchen/docker
setup-dev-env: inst-kitchen
	/bin/true
verify:        ## Verify cookbooks via test-kitchen
	kitchen verify 16

