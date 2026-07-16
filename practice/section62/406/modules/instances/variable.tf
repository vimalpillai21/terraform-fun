variable "public_key_path" {
    description = "Public key path"
    default = "levelup_key.pub"
}

variable "vpc_id" {
    type = string
    default = ""
}

variable "environment" {
    type = string
    default = ""
}

variable "AWS_REGION" {
    type = string
    default = "ap-south-1"
}

variable "AMIS" {
    type = map
    default = {
        ap-south-1 = "ami-01a00762f46d584a1"
        ap-south-2 = "ami-016a1f8306d051864"
        ap-northeast-1 = "ami-055ac77ee59b2dfa3"
        ap-northeast-2 = "ami-04e65c737a6ed3b59"
    }
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "public_subnets" {
    type = list
}