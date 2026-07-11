variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "ap-south-1"
}

variable "SECURITY_GROUP" {
    type = list(string)
    default = ["sg-122","sg-123","sg-124"]
}

variable "AMIS" {
    type = map
    default = {
        ap-south-1 = ""
        ap-south-2 = ""
        ap-northeast-1 = ""
        ap-northeast-2 = ""
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