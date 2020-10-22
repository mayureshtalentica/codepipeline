resource "aws_codepipeline" "static_web_pipeline" {
  name     = var.pipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn
  tags = {
    Environment = var.env
  }
  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"
  }



  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["SourceArtifact"]


      configuration = {
        Owner      = var.github_owner
        Repo       = var.github_repo
        Branch     = var.github_branch
        OAuthToken = var.github_token
        PollForSourceChanges = "false"
      }
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "ProjectName" = var.codebuild_name
      }
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      name             = "Build"

      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }
  /*
   stage {
    name = "Deploy"

    action {
      name = "ExternalDeploy"
      category = "Deploy"
      owner = "AWS"
      provider = "CodeDeployToECS"
      input_artifacts = ["BuildArtifact"]
      version = "1"
       configuration = {
        ApplicationName = "python-app"
        DeploymentGroupName = "python-app"
        TaskDefinitionTemplateArtifact = "BuildArtifact"

        AppSpecTemplateArtifact = "BuildArtifact"

      }


    }
  }
  */
  stage {
    name = "deploy"

    action {
      category = "Deploy"
      configuration = {
        "ClusterName" = var.ecs_cluster_name
        "ServiceName" = var.ecs_servicename
      }
      input_artifacts = [
        "BuildArtifact",
      ]
      name             = "deploy"
      output_artifacts = []
      owner            = "AWS"
      provider         = "ECS"
      region           = "ap-south-1"
      run_order        = 1
      version          = "1"
    }
  }


}

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = var.pipeline_bucket
  acl    = var.bucket_acl
  force_destroy = true
}
