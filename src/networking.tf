resource "aws_security_group" "main" {
  vpc_id      = local.vpc_id
  name_prefix = var.md_metadata.name_prefix
  description = "Control traffic to/from RabbitMQ Broker ${var.md_metadata.name_prefix}"
  lifecycle {
    create_before_destroy = true
  }
}

# Note: this rule here is to support ingress from the VPC until we add in security group support for applications in AWS
resource "aws_security_group_rule" "vpc_ingress" {
  count       = 1
  description = "From allowed local VPC"
  type        = "ingress"
  from_port   = local.rabbitmq.port
  to_port     = local.rabbitmq.port
  protocol    = local.rabbitmq.protocol
  cidr_blocks = [var.vpc.data.infrastructure.cidr]

  security_group_id = aws_security_group.main.id
}
