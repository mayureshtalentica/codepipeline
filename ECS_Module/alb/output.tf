output "alb-arm" {
  value = aws_alb_target_group.app.id
}

output "alb-sg" {

  value = aws_security_group.lb.id
}