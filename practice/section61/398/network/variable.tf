variable "cidr_vpc" {
    description = "CIDR block for the VPC"
    default = "13.162.0.0/16"
}

variable "cidr_subnet" {
    description = "CIDR block for the subnet"
    default = "13.162.1.0/24"
}

variable "availability_zone" {
    description = "Availability zone to create subnet"
    default = "ap-south-1a"
}

variable "public_key_path" {
    description = "Public key path"
    default = "../levelup_key.pub"
}

variable "environment_tag" {
    description = "Environment tag"
    default = "Production"
}