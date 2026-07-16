module "levelup-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.environment}"
  cidr = "13.162.0.0/16"

  azs             = ["${var.AWS_REGION}a", "${var.AWS_REGION}b", "${var.AWS_REGION}c"]
  private_subnets = ["13.162.1.0/24", "13.162.2.0/24", "13.162.3.0/24"]
  public_subnets  = ["13.162.4.0/24", "13.162.5.0/24", "13.162.6.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

output "my_vpc_id" {
    description = "VPC ID"
    value = module.levelup-vpc.vpc_id
}

output "public_subnets" {
    description = "List of IDS of public subnets"
    value = module.levelup-vpc.public_subnets
}

output "private_subnets" {
    description = "List of IDs of private subnets"
    value = module.levelup-vpc.private_subnets
}