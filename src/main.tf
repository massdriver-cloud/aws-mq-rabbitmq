resource "aws_mq_broker" "main" {
  broker_name                = var.md_metadata.name_prefix
  deployment_mode            = var.broker.deployment_mode
  engine_type                = "RabbitMQ"
  engine_version             = local.latest_minor_version
  host_instance_type         = var.broker.instance_type
  auto_minor_version_upgrade = true
  apply_immediately          = var.broker.apply_immediately
  publicly_accessible        = false
  storage_type               = lower(local.storage_type)
  subnet_ids                 = local.subnet_ids

  security_groups = [aws_security_group.main.id]

  encryption_options {
    kms_key_id        = module.kms.key_arn
    use_aws_owned_key = false
  }

  # NOTE: Omit logs block if both general and audit logs disabled:
  # https://github.com/hashicorp/terraform-provider-aws/issues/18067
  dynamic "logs" {
    for_each = var.monitoring.general_logging ? ["logs"] : []
    content {
      general = var.monitoring.general_logging
    }
  }

  user {
    username = local.rabbitmq.user
    password = random_password.main.result
  }
}
