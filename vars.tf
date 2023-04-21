variable aws_reg {
  description = "Region to deploy to"
  default     = "us-east-1"
  type        = string
}

variable stack {
  description = "Stack Name"
  default     = "terraform"
}

variable ssh_key {
  default     = "/home/rcusimano/work/AWSdeploy.pub"
  description = "Default pub key"
}

variable ssh_priv_key {
  default     = "/home/rcusimano/work/AWSdeploy"
  description = "Default private key"
}

