module "dev-vpc" {
    source = "../"
    vpcname = "dev01-vpc"
    cidr = "13.162.1.0/24"
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
    enable_ipv6 = "true"
    vpcenvironment = "Development-Engineering"
}