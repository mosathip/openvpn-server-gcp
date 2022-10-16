project_id = "project-id"
region = "asia-southeast1"
zone = "asia-southeast1-b"

instance_name = "openvpn-server"

instance_metadata = {
    ## use os login to control root access from iam
    ## need to grant role os login or os login admin
    # enable-oslogin = "TRUE"

}
