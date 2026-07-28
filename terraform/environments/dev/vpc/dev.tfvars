environment_name = "dev"
#aws_region       = "us-east-1"
vpc_cidr       = "10.0.0.0/16"
subnet_newbits = 8
tags = {
  Terraform   = "true"
  Project     = "retail"
  Environment = "dev"
}
#remotebackend = "trfbec"    # CHANGE THIS to your bucket name