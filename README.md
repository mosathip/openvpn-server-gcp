# openvpn-server-gcp

deploy openvpn server on google cloud platform virtual machine

## Prerequisite

- [Google Cloud](https://cloud.google.com) Project with linked Billing Account
- [Google Cloud Console](https://console.cloud.google.com) access to project for create service account
- [OpenVPN](https://openvpn.net) Account for oogin Access Server Portal
- [OpenVPN Connect](https://openvpn.net/vpn-client) client software
- [Terraform](https://www.terraform.io) command-line interface

## Google Cloud VM Instance

create [Google Cloud Compute Engine](https://cloud.google.com/compute) with [Terraform](https://www.terraform.io)

### Install Terraform Command-line Interface

[Install with Homebrew](https://formulae.brew.sh/formula/terraform)

```sh
brew install terraform
```

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

### Remote to your server

- go to <https://console.cloud.google.com/compute/instances>
- Click on SSH button
- ready for execute your command

## OpenVPN Access Server

### Create OpenVPN Account

- go to <https://openvpn.net>
- create account for access Access Server Portal

### Create Your License

- Go to Subscriptions
- Create Activation key (free 2 concurrent connections)

### Install OpenVPN Access Server

switch to root user

```sh
  sudo -i
```

installation command for Ubuntu 22, x86_64 \
[other operation system](https://as-portal.openvpn.com/get-access-server)

```sh
apt update && apt -y install ca-certificates wget net-tools gnupg

wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -

echo "deb http://as-repository.openvpn.net/as/debian jammy main">/etc/apt/sources.list.d/openvpn-as-repo.list

# you with get username and password for login to access server after run this command
apt update && apt -y install openvpn-as
```

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
