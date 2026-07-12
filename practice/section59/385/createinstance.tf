resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "three-three" {
    ami = lookup(var.AMIS,var.AWS_REGION)
    key_name = aws_key_pair.levelup_key.key_name
    availability_zone = "ap-south-1a"
    instance_type = "t3.micro"
    user_data = data.template_cloudinit_config.install-apache-config.rendered
    tags = {
        Name = "three-three"
    }
}

output "public_ip" {
    value = aws_instance.three-three.public_ip
}