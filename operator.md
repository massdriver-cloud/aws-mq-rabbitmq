## AWS MQ RabbitMQ

### Description

AWS MQ RabbitMQ is a managed message broker service that provides a robust and scalable environment for deploying and running RabbitMQ on the AWS cloud. It reduces the operational overhead required to manage RabbitMQ, ensuring high availability and security, and integrates seamlessly with other AWS services.

### Use Cases
**Asynchronous Messaging**
RabbitMQ is often used for asynchronous communication between different components of a distributed system. It allows decoupling of producers and consumers, where producers can send messages to RabbitMQ without waiting for an immediate response.
**Financial Transaction Processing**
RabbitMQ's support of AMQP provides reliable, secure and efficient communication between financial institutions, facilitating seamless payment transactions and messaging workflows.
**Microservice Architectures**
RabbitMQ facilitates communication and coordination between various microservices by acting as a message broker, allowing for asynchronous communication, event-driven architectures, and decoupling of services.

### Design Decisions

- **Broker Configuration:**
  - Supports [single-broker configuration](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/rabbitmq-broker-architecture-single-instance.html) for small, cost-efficent use-cases.
  - Supports [multi-broker configuration](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/rabbitmq-broker-architecture-cluster.html) for highly availabe, distributed messaging.

- **Automatic Updates:**
  - Cluster will be kept up to date with all security patches via automatic minor version updates.

- **Networking:**
  - Configured to use VPC internal subnets for better security.
  - Security groups and rules are defined to control access to RabbitMQ broker.

- **Monitoring and Logging:**
  - Configured for general logging based on user input.
  - CloudWatch alarms for monitoring system CPU utilization with configurable thresholds.

- **Security:**
  - Automatically generates strong, random passwords.
  - Configures the necessary IAM policy documents for access control and security.
  - Encrypted using AWS KMS, with KMS policy specifically crafted for RabbitMQ.

### Runbook

#### Issue: Cannot Connect to RabbitMQ Broker

If you are unable to connect to the RabbitMQ broker, follow these steps to troubleshoot.

1. **Verify Broker Status:**

   Ensure that the RabbitMQ broker is in the running state.

   ```sh
   aws mq describe-broker --broker-id <BROKER_ID>
   ```

   You should see the broker status as `RUNNING`. If not, investigate further using the AWS Console or CLI.

2. **Check Security Group Rules:**

   Ensure that the security groups associated with the RabbitMQ broker have the correct inbound rules.

   ```sh
   aws ec2 describe-security-groups --group-ids <SECURITY_GROUP_ID>
   ```

   Verify the inbound rules allow connections on the configured RabbitMQ port (default is 5671).

3. **Check Subnet Configuration:**

   Ensure that the subnets used by the RabbitMQ broker have the correct configuration and are associated with your VPC.

   ```sh
   aws ec2 describe-subnets --subnet-ids <SUBNET_ID>
   ```

   Verify the subnets' CIDR blocks and ensure there are no network ACLs or other VPC configurations blocking the traffic.

#### Issue: High CPU Utilization

If your RabbitMQ broker experiences high CPU utilization, perform the following checks:

1. **Inspect CloudWatch Alarm:**

   Check the CloudWatch alarm defined for CPU utilization.

   ```sh
   aws cloudwatch describe-alarms --alarm-names <ALARM_NAME>
   ```

   Review the alarm history for any recent spikes or anomalies.

2. **Analyze RabbitMQ Logs:**

   Enable and inspect RabbitMQ logs to identify any operations that might be causing high CPU usage.

   ```sh
   aws mq describe-configuration-revision --configuration-id <CONFIGURATION_ID> --configuration-revision <REVISION>
   ```

   Review the logs for any unusual activities or errors.

3. **RabbitMQ Management:**

   Use RabbitMQ's management UI or CLI to inspect queues, consumers, and overall message flow.

   ```sh
   rabbitmqctl list_queues
   rabbitmqctl list_consumers
   ```

   Identify any queues with a high number of messages or any consumers that might be causing issues.

### Summary

By following the guide and utilizing the provided troubleshooting commands, you should be able to effectively manage and troubleshoot your AWS MQ RabbitMQ instances.
