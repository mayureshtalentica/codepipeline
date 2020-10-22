
variable "env" {
  default = "demo"
}
variable "github_token" {
  default = "ec9a5baf671bef59435b94a1f70a87a09ad734d8"
}
variable "github_owner" {
  default = "mayureshtalentica"
}
variable "github_repo" {
  default = "code-deploy"
}
variable "github_branch" {
  default = "master"
}
variable "pipeline_bucket" {
  default = "s3-website-testing12f"
}
variable "bucket_acl" {
  default = "private"
}

variable "ecs_cluster_name" {
  default = "python-app"
}
variable "ecs_servicename" {
  default = "python-app"
}
variable "codebuild_name" {
  default = "static-web-build"
}

#Code pipeline
variable "pipeline_name" {
  default = "static-web-pipeline"
}
#iam

variable "aws_accoutid" {
  description = "Provide you aws account id for iam role"
  default = "134448675281"
}