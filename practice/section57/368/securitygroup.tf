data "aws_ip_ranges" "ap_south_ip_range" {
    regions = ["ap-south-1","ap-south-2"]
    services = ["ec2"]
}

resource "aws_security_group" "sg-custom_ap_south" {
    name = "custom_ap_south"
    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = slice(data.aws_ip_ranges.ap_south_ip_range.cidr_blocks,0,40)
    }
    tags = {
        CreateDate = data.aws_ip_ranges.ap_south_ip_range.create_date
        SyncToken = data.aws_ip_ranges.ap_south_ip_range.sync_token
    }
}