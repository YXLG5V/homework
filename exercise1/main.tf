module "base" {
  source           = "./base"
  region           = "eu-central-1"
  vpc_cidr         = "10.0.0.0/16"
  vpc_name         = "demo-vpc"
  public_subnet_1  = "10.0.1.0/24"
  public_subnet_2  = "10.0.2.0/24"
  private_subnet_1 = "10.0.3.0/24"
  private_subnet_2 = "10.0.4.0/24"
}

output "vpc_id" {
  value = module.base.vpc_id
}
