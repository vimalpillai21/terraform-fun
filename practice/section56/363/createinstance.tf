resource "aws_instance" "threesixty" {
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    tags = {
        Name = "threesixty"
    }
}