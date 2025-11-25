
module "network" {
  source             = "./modules/aws-vpc"
  vpc_name           = var.vpc_name
  aws_region         = var.aws_region
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}


//////ec2///////////////

module "ec2" {
  source             = "./modules/aws-ec2"
  vpc_id             = module.network.vpc_id
  subnet_id          = module.network.public_subnet_id
  ec2_ami            = var.ec2_ami
  ec2_instance_type  = var.ec2_instance_type
  ec2_key_name       = var.ec2_key_name

}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

/////// s3 bucket //////////

module "s3_bucket" {
  source         = "./modules/aws-bucket"
  bucket_name    = var.bucket_name
  versioning     = var.versioning
  force_destroy  = var.force_destroy
  tags           = var.tags
}

module "dynamodb" {
  source = "./modules/aws-dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
  
}

