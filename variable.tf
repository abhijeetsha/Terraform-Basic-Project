# Add or Change Instance Type
variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
}

# Add or Change Root_Storage_Size
variable "ec2_root_storage_size" {
  default = "10"
  type = number
}

# Add or Change Ec2 AMI-ID
variable "ec2_ami_id" {
  default = "ami-0ecb62995f68bb549" 
  type = string
}

