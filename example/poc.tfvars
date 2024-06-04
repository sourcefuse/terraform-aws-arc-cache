namespace    = "arc"
region       = "us-east-1"
environment  = "poc"
project_name = "arc-mono-infra"
security_group_rules = {
  ingress = {
    "rule1" = {
      description = "incoming traffic from default-vpc"
      from_port   = 6379
      to_port     = 6379
      protocol    = "tcp"
      cidr_blocks = ["10.12.0.0/16"] // change it according to your requirement
    }
  }
  egress = {
    "rule1" = {
      description = "outgoing traffic to anywhere"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
