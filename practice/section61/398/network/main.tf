resource "aws_vpc" "levelupvpc" {
    cidr_block = var.cidr_vpc
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Environment = var.environment_tag
    }
}

resource "aws_internet_gateway" "levelup_igw" {
    vpc_id = aws_vpc.levelupvpc.id
    tags = {
        Environment = var.environment_tag
    }
}

resource "aws_subnet" "subnet_public" {
    vpc_id = aws_vpc.levelupvpc.id
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    cidr_block = var.cidr_subnet

    tags = {
        Environment = var.environment_tag
    }
}

resource "aws_route_table" "levelup_rtb_public" {
    vpc_id = aws_vpc.levelupvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.levelup_igw.id
    }
    tags = {
        Environment = var.environment_tag
    }
}

resource "aws_route_table_association" "levelup_rta_subnet_public" {
    route_table_id = aws_route_table.levelup_rtb_public.id
    subnet_id =  aws_subnet.subnet_public.id
}

resource "aws_security_group" "levelup_sg_22" {
    name = "levelup_sg_22"
    vpc_id = aws_vpc.levelupvpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Environment = var.environment_tag
    }
}




