variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "ap-south-1"
}
variable "SECURITY_GROUP" {
    type = list(string)
    default = ["sg-0111", "sg-0112", "sg-0113"]
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


