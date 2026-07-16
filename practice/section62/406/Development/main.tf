module "dev-vpc" {
    source = "../modules/vpc"
    environment = var.environment
    AWS_REGION = var.AWS_REGION
}

module "dev-instance" {
    source = "../modules/instances"
    environment = var.environment
    AWS_REGION = var.AWS_REGION
    vpc_id = module.dev-vpc.my_vpc_id
    public_subnets = module.dev-vpc.public_subnets
}

provider "aws" {
    region = var.AWS_REGION
}