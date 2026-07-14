module "ec2_cluster" {
    source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
    name = "hello-world-instance"
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.levelup-public-1.id
    tags = {
        Terraform = "true"
        Development = "dev"
    }
}