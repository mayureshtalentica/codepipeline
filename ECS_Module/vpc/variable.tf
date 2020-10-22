#Each module will have its own variables.

variable "project_name" {
  description = "VPC name, like staging and production etc."
}

variable "env" {
  description = "Environment name, staging-000, production-000 etc."
}

variable "cidr" {
  description = "The CIDR block for the VPC."
#  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnets CIDR blocks"
  type        = "list"
  default     = []
}

variable "s3_bucket_name" {}
variable "private_subnets" {
  description = "List of private subnets CIDR blocks"
  type        = "list"
  default     = []
}

#variable "internal_dns_name" {}
variable "azs" {
  description = "Comma separated lists of AZs in which to distribute subnets"
#  default     = "us-west-2a,us-west-2b,us-west-2c"
}

variable "enable_dns_hostnames" {
  description = "True or False to enable/diasbale the DNS hostnames in VPC."
  default     = true
}

variable "enable_dns_support" {
  description = "True or False to enable/disable the DNS support in VPC."
  default     = true
}


variable "nat_gateways_count" {
  description = "NAT Gateway to be created."
  default     = 1
}

variable "public_zone_create" {
  description = "True or False to enable/disable public hosted zone"
  default     = false
}

variable "private_zone_create" {
  description = "True or False to enable/disable public route53 zone"
  default     = false
}


