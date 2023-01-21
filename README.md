# openvpn-server-gcp

deploy openvpn server on google cloud platform virtual machine

## Prerequisite

- [Google Cloud](https://cloud.google.com) Project with linked Billing Account
- [Google Cloud Console](https://console.cloud.google.com) access to project for create service account
- [Google Cloud CLI](https://cloud.google.com/cli) connect to Google Cloud VM instance with command line interface
- [OpenVPN](https://openvpn.net) Account for oogin Access Server Portal
- [OpenVPN Connect](https://openvpn.net/vpn-client) client software
- [Terraform](https://www.terraform.io) command-line interface


## Setup your Mac

### install Homerrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install terraform

[terraform on Homebrew](https://formulae.brew.sh/formula/terraform)

```sh
brew install terraform
```

### Install Google Cloud CLI

[google-cloud-sdk on Homebrew](https://formulae.brew.sh/cask/google-cloud-sdk)

```sh
brew install --cask google-cloud-sdk
```

inititialize your google cloud cli

```sh
gcloud init
```

login to use google cloud cli

```sh
gcloud auth login
```

## Google Cloud VM Instance

create [Google Cloud Compute Engine](https://cloud.google.com/compute) with [Terraform](https://www.terraform.io)

### Prepare Configuration

- create file my-var.tfvars likes example.tfvars
- edit my-var.tfvars,
  [list of zone](https://console.cloud.google.com/compute/zones) if you what to changes `region` and `zone`

### First Run

```sh
terraform -chdir=./terraform init
```

### Create VM with Terraform

```sh
terraform -chdir=./terraform apply -auto-approve --var-file my-var.tfvars
```

for dry run

```sh
terraform -chdir=./terraform plan --var-file my-var.tfvars
```

### Remove VM with Terraform

```sh
terraform -chdir=./terraform destroy --var-file my-var.tfvars
```

## OpenVPN Access Server

### Create OpenVPN Account

- go to <https://openvpn.net>
- create account for access Access Server Portal

### Create Your License

- Go to Subscriptions
- Create Activation key (free 2 concurrent connections)

### Install OpenVPN Access Server

run this command to set variable before run install script

`OPENVPN_SERVER_INSTANCE_NAME` is `instance_name` in my-var.tfvars \
`OPENVPN_SERVER_ZONE` is `zone` in my-var.tfvars

```sh
export OPENVPN_SERVER_INSTANCE_NAME=openvpn-server
export OPENVPN_SERVER_ZONE=asia-southeast1-b
export CURRENT_USERNAME=$(whoami)
```

running this command, you will see account and password for login to your admin web site

```sh
sh ./script/main.sh
```

not using Ubuntu 22, x86_64 [see how to install on other operation system](https://as-portal.openvpn.com/get-access-server)

### Config Your Access Server

- Go to Access Server admin page <https://your-ip:943/admin> and login with credential from installation step
- activate
- Go to Network Settings set your hostname or IP
- save setting and click on update running server

## OpenVPN Client

Connect to your OpenVPN Access Server with Client

### Install OpenVPN Connect

- go to <https://openvpn.net/vpn-client>
- choose your operation system
- download and install

### Add new profile

- login to access server (non admin page)
- click to download Available Connection Profiles
- import profile to openvpn client

## How to remote to your Google Cloud VM Instance

### Using Google Cloud Web

- go to <https://console.cloud.google.com/compute/instances>
- Click on SSH button

### Using Google Cloud CLI

```sh
gcloud compute ssh --zone=$OPENVPN_SERVER_ZONE $OPENVPN_SERVER_INSTANCE_NAME
```
