locals {
  automated_alarms = {
    cpu_utilization = {
      percent = 90
    }
  }
  alarms_map = {
    "AUTOMATED" = local.automated_alarms
    "DISABLED"  = {}
    "CUSTOM"    = lookup(var.monitoring, "alarms", {})
  }

  alarms = lookup(local.alarms_map, var.monitoring.mode, {})
}

module "alarm_channel" {
  source      = "github.com/massdriver-cloud/terraform-modules//aws/alarm-channel?ref=ceceacd"
  md_metadata = var.md_metadata
}

module "cpu_utilization" {
  source        = "github.com/massdriver-cloud/terraform-modules//aws/cloudwatch-alarm?ref=ceceacd"
  for_each      = lookup(local.alarms, "cpu_utilization", null) == null ? [] : toset(["enabled"])
  sns_topic_arn = module.alarm_channel.arn
  display_name  = "CPU Utilization"

  md_metadata         = var.md_metadata
  message             = "AWS MQ RabbitMQ Broker ${aws_mq_broker.main.broker_name}: CPU Utilization > ${local.alarms.cpu_utilization.percent}"
  alarm_name          = "${aws_mq_broker.main.broker_name}-cpuUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "SystemCpuUtilization"
  namespace           = "AWS/AmazonMQ"
  period              = 300
  statistic           = "Average"
  threshold           = local.alarms.cpu_utilization.percent

  dimensions = {
    "Broker" = aws_mq_broker.main.broker_name
  }
}
