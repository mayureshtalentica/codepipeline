variable "env" {}
variable "vpc_cidr" {
}

variable "public_subnet_cidr" {
  type = "list"
}

variable "private_subnet_cidr" {
  type = "list"
}
variable "project-name" {}

variable "availability-zones" {}

variable "vpc-bucket-name" {}
variable "alb_type" {}
variable "myapp-cluster" {}