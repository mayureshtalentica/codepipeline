variable "health_check_path" {
  default = "/"
}

variable "vpc_id" {}
variable "subnets" {

}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}
variable "alb_type" {}