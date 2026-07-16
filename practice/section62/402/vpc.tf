resource "aws_vpc" "levelupvpc" {
    cidr_block = "13.162.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
        Name = "levelupvpc"
    }
}

resource "aws_subnet" "levelup-public-1" {
    vpc_id = aws_vpc.levelupvpc.id
    cidr_block = "13.162.1.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "levelup-public-1"
    }
}

resource "aws_internet_gateway" "levelup-gw" {
    vpc_id = aws_vpc.levelupvpc.id
    tags = {
        Name = "levelup-gw"
    }
}

resource "aws_route_table" "levelup-public" {
    vpc_id = aws_vpc.levelupvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.levelup-gw.id
    }
    tags = {
        Name = "levelup-public"
    }
}

resource "aws_route_table_association" "levelup-public-1a" {
    subnet_id = aws_subnet.levelup-public-1.id
    route_table_id = aws_route_table.levelup-public.id
}


