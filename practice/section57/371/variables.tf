variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    type = string
    default = "ap-south-1"
}

variable "SECURITY_GROUP" {
    type = list
    default = ["sg-012","sg-1023","sg-345"]
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