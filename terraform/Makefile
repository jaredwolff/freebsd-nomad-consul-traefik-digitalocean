VARS := .tfvars

.PHONY: init plan deploy

default: plan

init:
	terraform init -var-file="$(VARS)"

plan:
	terraform plan -var-file="$(VARS)" -out test

deploy:
	terraform deploy -var-file="$(VARS)"