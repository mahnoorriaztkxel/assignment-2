  vpc_name           = ""
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"

  ////s3 bucket///
bucket_name    = "mahnoor-terraform-s3-demo"
versioning     = true
force_destroy  = true

tags = {
  Environment = "Dev"
  Project     = "TerraformS3"
}

dynamodb_table_name  = "terraform-locks"