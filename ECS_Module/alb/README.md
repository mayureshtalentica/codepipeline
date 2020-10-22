This module will crate Application Load balancer whose target type will be IP which we can use for
ECS fargate

Note we will use VPC module in this to launch ALB in that vpc

How do I get set up?

We have to crated main.tf value and need to pass following variable.

module "vpc" {
  source = "./vpc"
  project_name      = "${var.project-name}"
  env               = "${var.env}"
  cidr              = "${var.vpc_cidr}"
  public_subnets    = "${var.public_subnet_cidr}"
  private_subnets   = "${var.private_subnet_cidr}"
  azs               = "${var.availability-zones}"
  s3_bucket_name    = "${var.vpc-bucket-name}"
  nat_gateways_count = 1
}
module "alb" {
  source = "./alb"
  alb_type = var.alb_type
  subnets = join(",","${element(module.vpc.public_subnets,0)}")
  vpc_id = module.vpc.vpc_id
}