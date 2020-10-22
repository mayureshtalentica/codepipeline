

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    #Name = "${var.region}-${var.env}"
    Name = "${var.project_name}-vpc"
    ENV  = var.env
  }
}

resource "aws_flow_log" "flowlog" {
  log_destination      = aws_s3_bucket.flowlogbucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc.id
  iam_role_arn         = ""
}


resource "aws_s3_bucket" "flowlogbucket" {
  bucket = "${var.s3_bucket_name}-${random_string.random.result}"
  acl    = "private"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }
  tags = {
    Name = var.s3_bucket_name
    ENV  = var.env
  }
}



resource "aws_s3_bucket_public_access_block" "access-block" {
  bucket = aws_s3_bucket.flowlogbucket.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "random_string" "random" {
  length = 4
  upper = false
  special = false
}