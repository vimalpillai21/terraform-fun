resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "four" {
    ami = lookup(var.AMIS,var.AWS_REGION)
    instance_type = "t3.micro"
    # availability_zone = "ap-south-1a" --> availability_zone in subnet
    key_name = aws_key_pair.levelup_key.key_name
    vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
    subnet_id = aws_subnet.levelup-public-1.id
    
    tags = {
        Name = "four"
    }
}

output "public_ip" {
    value = aws_instance.four.public_ip
}

output "private_ip" {
    value = aws_instance.four.private_ip
}