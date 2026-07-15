module "dev-qa-vpc" {
    source = "../"
    cidr = "13.162.2.0/24"
    vpcname = "dev02-qa-vpc"
    vpcenvironment = "Development-QA-Engineering"
    enable_ipv6 = "true"
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
    # AWS_REGION = "ap-south-2"
}