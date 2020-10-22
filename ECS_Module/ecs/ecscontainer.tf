
resource "aws_ecs_cluster" "main" {
  name = var.myapp-cluster
}

data "template_file" "python-app" {
  template = file("./myapp.json")

  vars = {
    container_name =var.container_name
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }
}


resource "aws_ecs_task_definition" "app" {
  family                   = "python-app"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.python-app.rendered
}