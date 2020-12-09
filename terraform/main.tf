provider "aws" {
  region = "eu-west-1"
}
locals {
  serviceName = "lambdademo"
  DefaultDesc = "Managed by Terraform"
}