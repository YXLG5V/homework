module "base" {
  source             = "./base"
  region             = "eu-central-1"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "demo_vpc"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["eu-central-1a", "eu-central-1b"]
}

output "vpc_id" {
  value = module.base.vpc_id
}
