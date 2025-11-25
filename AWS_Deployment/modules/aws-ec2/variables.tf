variable "aws_region" {
  default = "ap-south-1"
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0dee22c13ea7a9a67" # Amazon Linux 2 (for ap-south-1)
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "Existing AWS Key Pair name for SSH access"
  default     = "my-keypair"  # replace with your actual key pair name
}

variable "subnet_id" {
  type = string
  
}
variable "vpc_id" {
  
}