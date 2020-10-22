resource "aws_ecr_repository" "foo" {
  name = "bar"
}
provider "aws" {
  region = "ap-south-1"
}