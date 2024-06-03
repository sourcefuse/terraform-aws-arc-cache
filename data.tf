data "aws_security_groups" "this" {
  filter {
    name   = "group-name"
    values = var.security_group_names
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_ssm_parameter" "retrieved_redis_password" {
  name       = aws_ssm_parameter.uuid_parameter.name
  depends_on = [aws_ssm_parameter.uuid_parameter]
}
