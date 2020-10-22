provider "aws" {
  region = "ap-south-1"
  profile = "mayur-old"
}
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






module "demo" {
  source        = "./ecs"
  myapp-cluster = var.myapp-cluster
  vpc_id = module.vpc.vpc_id
  subnets = join(",","${element(module.vpc.public_subnets,0)}")
  alb_type = var.alb_type
  private_subnets = join(",","${element(module.vpc.private_subnets,0)}")

}
/*
module "alb" {
  source = "./alb"
  alb_type = var.alb_type
  subnets = join(",","${element(module.vpc.public_subnets,0)}")
  vpc_id = module.vpc.vpc_id
}
alb-sg = module.alb.alb-sg
  target-arn = module.alb.alb-arm
*/