# Terraform

## Requirements

- Google Cloud Platform Project with linked Billing Account
- Google Cloud Platform Project access for create service account

## Prepare Configuration

- create file my-var.tfvars likes example.tfvars
- edit my-var.tfvars

## Install Terraform cli

For macOS

```sh
brew install terraform
```

## First Run

```sh
terraform init
```

## Create VM with Terraform

dry run

```sh
terrform plan --var-file my-var.tfvars
```

exec

```sh
terraform apply -auto-approve --var-file my-var.tfvars 
```

## Cleanup VM with Terraform

```sh
terrform destroy --var-file my-var.tfvars
```
