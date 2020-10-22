provider "aws" {
  region = "ap-south-1"
  profile = "mayur-old"
}
data "template_file" "buildspec" {
  template = "${file("./buildspec.yml")}"

}

resource "aws_codebuild_project" "static_web_build" {
  badge_enabled  = false
  build_timeout  = 60
  name           = var.codebuild_name
  queued_timeout = 480
  service_role   = aws_iam_role.example.arn
  tags = {
    Environment = var.env
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:3.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }


  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mayureshtalentica/code-deploy.git"
    git_clone_depth = 1
  }
}