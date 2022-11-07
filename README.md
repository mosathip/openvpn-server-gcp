# openvpn-server-gcp

deploy openvpn server on google cloud platform virtual machine

## Create Google Cloud VM Instance

## Install OpenVPN Access Server

- go to <https://openvpn.net/> and click login
- select Access Server Portal
- login or signup if you don't have an account
- Go to Get Access Server menu and choose Ubuntu or using scripts in this project (coming soon)
- Save your default password
- Go to Subscriptions
- Create your subscriptions key (free license for 2 devices)
- Go to Access Server admin page <https://your-ip:943/admin> and login with credential from installation step
- activate
- Go to Network Settings set your hostname or IP
- save setting and click on update running server
- download openvpn client
- login to access server (non admin page)
- click to download Available Connection Profiles
- import profile to openvpn client
