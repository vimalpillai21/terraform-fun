resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "sixty" {
    ami = lookup(var.AMIS,var.AWS_REGION)
    instance_type = "t3.micro"
    availability_zone = "ap-south-1a"
    key_name = aws_key_pair.levelup_key.key_name

    iam_instance_profile = aws_iam_instance_profile.s3-levelupbucket-role-instanceprofile.name
    tags = {
        Name = "sixty"
    }
}

output "public_ip" {
    value = aws_instance.sixty.public_ip
}