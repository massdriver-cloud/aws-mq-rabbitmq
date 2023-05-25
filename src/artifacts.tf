locals {
  endpoint = aws_mq_broker.main.instances.0.endpoints.0
  port     = tonumber(element(split(":", trimprefix(local.endpoint, "amqps://")), 1))
  hostname = element(split(":", trimprefix(local.endpoint, "amqps://")), 0)
}

resource "massdriver_artifact" "rabbitmq" {
  field                = "rabbitmq"
  provider_resource_id = var.md_metadata.name_prefix
  name                 = "RabbitMQ authentication for ${var.md_metadata.name_prefix}"
  artifact = jsonencode({
    data = {
      infrastructure = {
        arn = aws_mq_broker.main.arn
      }
      authentication = {
        username = local.rabbitmq.user
        password = random_password.main.result
        hostname = local.hostname
        port     = local.port
      }
    }
    specs = {
      rabbitmq = {
        version = aws_mq_broker.main.engine_version
      }
      # aws = {
      #   region = var.vpc.specs.aws.region
      # }
    }
  })
}
