terraform {
    backend "s3" {
        bucket = "tf-state-s456"
        key = "development/terraform/terraform_state"
        region = "ap-south-1"
    }
}