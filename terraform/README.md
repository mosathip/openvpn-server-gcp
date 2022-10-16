# terraform

## requirements

- Google Cloud Platform Project with linked Billing Account
- Google Cloud Platform Project access for create service account

## prepare configuration

- create file my-var.tfvars likes example.tfvars
- edit my-var.tfvars

## install terraform cli

For macOS

```sh
brew install terraform
```

## first run

```sh
terraform init
```

## create vm with terraform

dry run

```sh
terrform plan --var-file my-var.tfvars
```

```sh
terraform apply --var-file my-var.tfvars
```

## clean up vm with terraform

dry run

```sh
terrform destroy --var-file my-var.tfvars
```
