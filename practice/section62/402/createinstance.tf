provider "aws" {
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
    region = var.AWS_REGION
}

module "ec2_cluster" {
    source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
    for_each = toset(["A","B"])
    name = "instance-${each.key}"
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    
    subnet_id = aws_subnet.levelup-public-1.id
    

    tags = {
        Terraform = "true"
        Environment = var.ENVIRONMENT
        INSTANCE_COUNT = var.ENVIRONMENT == "Production" ? 2 : 1
        
    }

}