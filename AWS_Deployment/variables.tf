variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

// EC2 


variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0157af9aea2eef346" # Amazon Linux 2 (for ap-south-1)
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "Existing AWS Key Pair name for SSH access"
  default     = "test-key"  # replace with your actual key pair name
}


///// s3////

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable or disable versioning for S3 bucket"
  type        = bool
}

variable "force_destroy" {
  description = "Allow bucket to be deleted even if not empty"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}


variable "dynamodb_table_name" {
  description = "DynamoDB table name for Terraform lock management"
  type        = string
}
