variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
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

variable "PATH_TO_PUBLIC_KEY" {
    default = "levelup_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "levelup_key"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}

