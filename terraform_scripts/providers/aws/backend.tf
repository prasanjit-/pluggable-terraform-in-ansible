terraform {

  backend "s3" {

    profile = "containers"
    region  = "eu-west-1"

    bucket          = "containers-terraform-state-storage"
    dynamodb_table  = "terraform-state-lock"

    key     = "service/ansible/terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  profile = "containers"
  region  = "eu-west-1"
}
