variable "project_id" {
  description = "Google Cloud Platform Project ID"
  type        = string
  default     = ""
}

variable "region" {
  description = "Google Cloud Platform Region"
  type        = string
  default     = "asia-southeast1"
}

variable "zone" {
  description = "Google Cloud Platform zone"
  type        = string
  default     = "asia-southeast1-b"
}

variable "instance_name" {
  description = "virtual machine instance name"
  type        = string
  default     = "openvpn-server"
}

variable "instance_metadata" {
  description = "virtual machine instance metadata"
  type        = map(string)
  default     = {
    # enable-oslogin = "TRUE"
  }
}