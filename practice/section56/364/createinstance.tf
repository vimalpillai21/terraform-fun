resource "aws_instance" "three" {
    ami = lookup(var.AMIS,var.AWS_REGION)
    instance_type = "t3.micro"
    tags = {
        Name = "hello-three"
    }
    security_groups = "${var.SECURITY_GROUP}"
}