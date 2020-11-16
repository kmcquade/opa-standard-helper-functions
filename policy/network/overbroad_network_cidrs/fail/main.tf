provider "aws" {
  region  = "us-east-1"
//  version = "~> 2.12.0"
}

//terraform {
//  required_version = "< 0.12.0"
//}

resource "aws_security_group" "test" {}

resource "aws_security_group_rule" "test" {
  type              = "ingress"
  security_group_id = aws_security_group.test.id
  from_port         = 0
  protocol          = "tcp"
  to_port           = 65535
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "test2" {
  type              = "ingress"
  security_group_id = aws_security_group.test.id
  from_port         = 0
  protocol          = "tcp"
  to_port           = 65535
  cidr_blocks       = [
    "40.76.4.15/32",
    "40.112.72.205/32"
  ]
}
