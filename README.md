# discourse

This repository contains Ansible setup and roles to manage infrastructure deployment and automated CI/CD for Poseion DAO Discourse instance configuration.

## Hosts

Ansible is based on ec2 plugin with dynamic inventory to dynamically target the hosts based on AWS environment variable. Envorinment variables should be setup in GitHub repository and they are referred through GitHub Actions workflow.

### Playbook

The playbook is made un by the roles should be installed in EC2 based on its tags. Currently we are targeting discourse environment, hence the EC2 with tag env:discourse will be targeted.

First operations are common for each service, that means create the user that will run the service and all dependencies. Finally each service is launched running the docker image previously built in the repository workflow.
