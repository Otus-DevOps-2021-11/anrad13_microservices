# anrad13_microservices
anrad13 microservices repository

# HW-15, HW-16 Docker-2
- created integration the repo with github actions (autoassign and tests)
- created Dockerfile for reddit app deploying as single container with ruby, mongo, reddit
- docker-1.log - hw's required result output
## Задание со *
### Шаблон пакера, который делает образ с уже установленным Docker, Python
- docker-monolith/infra/parker - packer config
- docker-monolith/infra/ansible/playbook/packer-docker.yml - ansible playbook
- to run - packer build -var-file=./packer/variables.json packer/docker.json from docker-monolith/infra/
### Поднятие инстансов с помощью Terraform, их количество задается переменной
- by default = 2 instance
- docker-monolith/infra/terraform/stage - the main for doker-hosts instantiation
- docker-monolith/infra/terraform/modules/docker - the module for instance creation
- 1) create N instances; 2) Create inventory file for ansible in docker-monolith/infra/ansible/environment/stage
- to run - terraform plan|apply|destroy from docker-monolith/infra/terraform/stage
### Ansible с использованием динамического инвентори для установки докера и запуска там образа приложения
- docker-monolith/infra/ansible/playbook/deploy.yml - deploys reddit as a mono container with "anrad13/otus-reddit:1.0"
- docker-monolith/infra/ansible/inventory.sh - dynamic inventory config by terraform output -json
- docker-monolith/infra/terraform/stage/enventory.py - python script for terraform output -json to ansible inventory json parsing
- docker-monolith/infra/ansible/playbook/packer-docker.yml - ansible playbook for docker image disk with packer

# HW-17 Docker-3
- created Dockerfile files for comment, post and ui applications
- deployed them successfully with different network alliases as 
docker run -d --network=reddit --network-alias=post_db1 --network-alias=comment_db1 mongo:latest
docker run -d --network=reddit --network-alias=post -e POST_DATABASE_HOST=comment_db1  anrad13/post:1.0
docker run -d --network=reddit --network-alias=comment  -e COMMENT_DATABASE_HOST=post_db1 anrad13/comment:1.0
docker run -d --network=reddit -p 9292:9292 anrad13/ui:2.0
- made container from ubuntu image - UI v2
