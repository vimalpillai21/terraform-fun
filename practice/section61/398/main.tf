provider "aws" {
    region = var.region
}

module "myvpc" {
    source = "./network"
}

resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.public_key_path)
}

resource "aws_instance" "four" {
    ami = var.instance_ami
    instance_type = var.instance_type
    subnet_id = module.myvpc.public_subnet_id
    vpc_security_group_ids = module.myvpc.sg_22_id
    key_name = aws_key_pair.levelup_key.key_name
    tags = {
        Environment = var.environment_tag
    }
}