data "aws_ssm_parameter" "retrieved_redis_password" {
  name       = aws_ssm_parameter.uuid_parameter.name
  depends_on = [aws_ssm_parameter.uuid_parameter]
}
