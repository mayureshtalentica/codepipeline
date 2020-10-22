This module will crate ECS cluster with taskdefination which will take image stored in dockerhub registry and crated cluster.
To access this app we have to take Loadbalncer dns name.

Note we will use VPC module in this to launch  ECS cluster in that vpc

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
module "ecs" {
  source        = "./ecs"
  myapp-cluster = var.myapp-cluster
  vpc_id = module.vpc.vpc_id
  subnets = join(",","${element(module.vpc.public_subnets,0)}")
  alb_type = var.alb_type
  private_subnets = join(",","${element(module.vpc.private_subnets,0)}")
}