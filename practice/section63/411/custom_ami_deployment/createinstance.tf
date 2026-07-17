provider "aws" {
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
    region = var.AWS_REGION
}

module "levelup-vpc" {
    source = "../modules/vpc"
    ENVIRONMENT = var.ENVIRONMENT
    AWS_REGION = var.AWS_REGION
}

resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.public_key_path)
}

resource "aws_security_group" "allow-ssh" {
    vpc_id = module.levelup-vpc.my_vpc_id
    name = "allow-ssh-${var.ENVIRONMENT}"
    description = "aws security group that allows ssh traffic"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow-ssh"
        Environment = var.ENVIRONMENT
    }
}

resource "aws_instance" "my-instance" {
    ami = var.AMI_ID
    instance_type = var.INSTANCE_TYPE
    subnet_id = element(module.levelup-vpc.public_subnets,0)
    availability_zone = "${var.AWS_REGION}a"
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
    key_name = aws_key_pair.levelup_key.key_name
    tags = {
        Name = "instance-${var.ENVIRONMENT}"
        Environment = var.ENVIRONMENT
    }
}


