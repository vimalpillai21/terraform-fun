data "aws_availability_zones" "available" {}
data "aws_ami" latest_ubuntu {
    most_recent = true
    owners = ["099720109477"]
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_instance" "three" {
    ami = data.aws_ami.latest_ubuntu.id
    availability_zone = data.aws_availability_zones.available.names[1]
    instance_type = "t3.micro"
    tags = {
        Name = "hello"
    }
    
    provisioner "local-exec" {
        command = "echo ${aws_instance.three.private_ip} >> my_private_ips.txt"
    }
}

output "public_ip" {
        value = aws_instance.three.public_ip
    }