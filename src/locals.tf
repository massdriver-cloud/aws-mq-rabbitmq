locals {
  vpc_id = element(split("/", var.vpc.data.infrastructure.arn), 1)

  rabbitmq = {
    protocol = "tcp"
    port     = 5671
    user     = "admin"
  }

  storage_type = "EBS"

  // a single instance broker requires exactly one subnet, a cluster requires multiple
  vpc_internal_subnets = [for subnet in var.vpc.data.infrastructure.internal_subnets : element(split("/", subnet["arn"]), 1)]
  subnet_ids           = var.broker.deployment_mode == "SINGLE_INSTANCE" ? [cache_store.single_subnet.value] : local.vpc_internal_subnets

  // terraform doesn't have a way to sort a list of numbers (https://github.com/hashicorp/terraform/issues/30475)
  // but the "supported_engine_versions" field seems to always arrive sorted descending, so we'll assume thats always
  // the case and grab the first record where the semver prefix matches
  compatible_minor_versions = [for version in data.aws_mq_broker_instance_type_offerings.lookup.broker_instance_options.0.supported_engine_versions : version if startswith(version, var.broker.engine_version)]
  latest_minor_version      = element(local.compatible_minor_versions, 0)
}

data "aws_mq_broker_instance_type_offerings" "lookup" {
  host_instance_type = var.broker.instance_type
  storage_type       = local.storage_type
  engine_type        = "RABBITMQ"
}

// cache the single subnet we selected in case of "SINGLE_INSTANCE"
resource "cache_store" "single_subnet" {
  value = local.vpc_internal_subnets[0]
}
