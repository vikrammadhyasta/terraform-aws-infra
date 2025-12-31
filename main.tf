module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source    = "./modules/ec2"
  ami       = "ami-0f58b397bc5c1f2e8"
  subnet_id = module.vpc.public_subnet_id
  sg_id     = module.security_group.sg_id
  key_name  = "terraform-key"
}

