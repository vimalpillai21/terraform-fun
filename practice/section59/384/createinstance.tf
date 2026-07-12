resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "three-two" {
    key_name = aws_key_pair.levelup_key.key_name
    availability_zone = "ap-south-1b"
    instance_type = "t3.micro"
    ami = lookup(var.AMIS,var.AWS_REGION)
    tags = {
        Name = "three-two"
    }
    user_data = file("installapache.sh")
}

output public_ip {
    value = aws_instance.three-two.public_ip
}