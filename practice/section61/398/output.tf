output "instance_public_ip" {
    value = ["${aws_instance.four.public_ip}"]
}