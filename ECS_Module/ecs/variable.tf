# variables.tf

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ap-south-1"
}

#ALB


variable "myapp-cluster" {
  default = "python-app"
}
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "134448675281.dkr.ecr.ap-south-1.amazonaws.com/python-app:latest"
}



variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}


variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

variable "health_check_path" {
  default = "/"
}

variable "vpc_id" {}
variable "subnets" {

}
variable "private_subnets" {}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 5000
}
variable "alb_type" {}

variable "container_name" {
  default = "python-app"
}