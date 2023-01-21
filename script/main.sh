# copy file to vm
gcloud compute scp --zone=$OPENVPN_SERVER_ZONE ./script/install-openvpn-access-server.sh $OPENVPN_SERVER_INSTANCE_NAME:/home/$CURRENT_USERNAME/install-openvpn-access-server.sh

# excute install script
gcloud compute ssh --zone=$OPENVPN_SERVER_ZONE $OPENVPN_SERVER_INSTANCE_NAME -- sudo sh /home/$CURRENT_USERNAME/install-openvpn-access-server.sh
