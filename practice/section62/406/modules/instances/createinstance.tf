resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.public_key_path)
}

resource "aws_security_group" "allow-ssh" {
    vpc_id = var.vpc_id
    name = "allow-ssh"
    description = "security group that allows ssh traffic"

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
        Environment = var.environment
    }
}

resource "aws_instance" "my-instance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = var.instance_type
    subnet_id = element(var.public_subnets,0)
    availability_zone = "${var.AWS_REGION}a"
    key_name = aws_key_pair.levelup_key.key_name
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
    tags = {
        Name = "instance-${var.environment}"
        Environment = var.environment
    }

}