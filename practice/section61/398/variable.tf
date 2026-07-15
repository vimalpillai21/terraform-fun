variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "region" {
    default = "ap-south-1"
}

variable "public_key_path" {
    description = "Path to public key"
    default = "levelup_key.pub"
}

variable "instance_ami" {
    description = "AMI for ec2 instance"
    default = "ami-01a00762f46d584a1"
} 

variable "instance_type" {
    description = "type for AWS ec2 instance"
    default = "t3.micro"
}

variable "environment_tag" {
    description = "Environment tag"
    default = "Production"
}


