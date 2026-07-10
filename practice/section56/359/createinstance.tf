resource "aws_instance" "double" {
    ami = "ami-01a00762f46d584a1"
    count = 2
    instance_type = "t3.micro"
    tags = {
        Name = "double-${count.index}"
        # Name = "double" 
    }
}