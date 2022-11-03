# bin/sh

# for Ubuntu 22, x86_64
apt update && apt -y install ca-certificates wget net-tools gnupg

wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -

echo "deb http://as-repository.openvpn.net/as/debian jammy main">/etc/apt/sources.list.d/openvpn-as-repo.list

apt update && apt -y install openvpn-as
