This is the initial Ansible code for setting up ML/DL hosts.

Mostly this is the basic framework. The development environment is:

* ansible: the config management system
* docker: provide host-like containers to develop/test on
* kitchen: a test and dev framework tying together ansible/docker

The current setup assumes you are using a vanilla Ubuntu 16-04 host
for dev. 

This is tested on a Ubuntu 16-06 vm. to get started run:

    make setup-dev-env

Then run

    make verify # or
    kitchen verify

You can login to any container you've configured by running:

    kitchen list # get instance names
    kitchen login instance-name

To apply these playbooks to your system, clone the repo, do

    apt-get install ansible
    
and then

    ansible-playbook -i 'localhost,' godeeper.yml


Now that basic framework is in place, the next step is to
write ansible tasks for all the things in the top-level README
