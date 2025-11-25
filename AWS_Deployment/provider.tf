terraform {
    backend "s3" {
    bucket         = "mahnoor-terraform-s3-demo"
    key            = "global/s3/terraform.tfstate"   # Path inside the bucket
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
    shared_credentials_files = ["~/.aws/credentials"]
    # profile                 = "default"
}

