resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "ap-south-1a"
    type = "gp2"
    size = "10"
    tags = {
        Name = "ebs-volume-1"
    }
}

resource "aws_instance" "three" {
    key_name = aws_key_pair.levelup_key.key_name
    availability_zone = "ap-south-1a"
    instance_type = "t3.micro"
    ami = lookup(var.AMIS,var.AWS_REGION)
    tags = {
        Name = "three"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    instance_id = aws_instance.three.id
    volume_id = aws_ebs_volume.ebs-volume-1.id
}




