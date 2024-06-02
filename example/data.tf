data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}"]
  }
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"

    values = [
      "${var.namespace}-${var.environment}-private-${var.region}a",
      "${var.namespace}-${var.environment}-private-${var.region}b",
      "${var.namespace}-${var.environment}-private-${var.region}c",
    ]
  }
}
