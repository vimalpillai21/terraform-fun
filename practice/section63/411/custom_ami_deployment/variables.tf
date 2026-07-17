variable "public_key_path" {
    type = string
    default = "levelup_key.pub"
}

variable "AWS_REGION" {
    type = string
    default = "ap-south-1"
}

variable "AMI_ID" {
    type = string
    default = ""
}

variable "ENVIRONMENT" {
    type = string
    default = "development"
}

variable "INSTANCE_TYPE" {
    type = string
    default = "t3.micro"
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}


