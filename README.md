[![Massdriver][logo]][website]

# aws-mq-rabbitmq

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]


AWS MQ Broker for RabbitMQ is a managed message broker service that simplifies the deployment and maintenance of RabbitMQ in the AWS cloud.


---

## Design

For detailed information, check out our [Operator Guide](operator.mdx) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle


<!-- COMPLIANCE:START -->

Security and compliance scanning of our bundles is performed using [Bridgecrew](https://www.bridgecrew.cloud/). Massdriver also offers security and compliance scanning of operational infrastructure configured and deployed using the platform.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS AWS](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/aws-mq-rabbitmq/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Faws-mq-rabbitmq&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |

<!-- COMPLIANCE:END -->

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`core_services`** *(object)*: Configure core services in Kubernetes for Massdriver to manage.
  - **`enable_efs_csi`** *(boolean)*: Enabling this will install the AWS EFS storage controller into your cluster, allowing you to provision persistent volumes backed by EFS file systems. Default: `False`.
  - **`enable_ingress`** *(boolean)*: Enabling this will create an nginx ingress controller in the cluster, allowing internet traffic to flow into web accessible services within the cluster. Default: `False`.
  - **`route53_hosted_zones`** *(array)*: Route53 Hosted Zones to associate with this cluster. Enables Kubernetes to automatically manage DNS records and SSL certificates. Hosted Zones can be configured at https://app.massdriver.cloud/dns-zones. Default: `[]`.
    - **Items** *(string)*: .

      Examples:
      ```json
      "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
      ```

      ```json
      "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
      ```

- **`k8s_version`** *(string)*: The version of Kubernetes to run. Must be one of: `['1.21', '1.22', '1.23', '1.24']`.
- **`node_groups`** *(array)*
  - **Items** *(object)*: Definition of a node group.
    - **`advanced_configuration_enabled`** *(boolean)*: Default: `False`.
    - **`instance_type`** *(string)*: Instance type to use in the node group.
      - **One of**
        - C5 High-CPU Large (2 vCPUs, 4.0 GiB)
        - C5 High-CPU Extra Large (4 vCPUs, 8.0 GiB)
        - C5 High-CPU Double Extra Large (8 vCPUs, 16.0 GiB)
        - C5 High-CPU Quadruple Extra Large (16 vCPUs, 32.0 GiB)
        - C5 High-CPU 9xlarge (36 vCPUs, 72.0 GiB)
        - C5 High-CPU 12xlarge (48 vCPUs, 96.0 GiB)
        - C5 High-CPU 18xlarge (72 vCPUs, 144.0 GiB)
        - C5 High-CPU 24xlarge (96 vCPUs, 192.0 GiB)
        - M5 General Purpose Large (2 vCPUs, 8.0 GiB)
        - M5 General Purpose Extra Large (4 vCPUs, 16.0 GiB)
        - M5 General Purpose Double Extra Large (8 vCPUs, 32.0 GiB)
        - M5 General Purpose Quadruple Extra Large (16 vCPUs, 64.0 GiB)
        - M5 General Purpose Eight Extra Large (32 vCPUs, 128.0 GiB)
        - M5 General Purpose 12xlarge (48 vCPUs, 192.0 GiB)
        - M5 General Purpose 16xlarge (64 vCPUs, 256.0 GiB)
        - M5 General Purpose 24xlarge (96 vCPUs, 384.0 GiB)
        - T3 Small (2 vCPUs for a 4h 48m burst, 2.0 GiB)
        - T3 Medium (2 vCPUs for a 4h 48m burst, 4.0 GiB)
        - T3 Large (2 vCPUs for a 7h 12m burst, 8.0 GiB)
        - T3 Extra Large (4 vCPUs for a 9h 36m burst, 16.0 GiB)
        - T3 Double Extra Large (8 vCPUs for a 9h 36m burst, 32.0 GiB)
        - P2 General Purpose GPU Extra Large (4 vCPUs, 61.0 GiB)
        - P2 General Purpose GPU Eight Extra Large (32 vCPUs, 488.0 GiB)
        - P2 General Purpose GPU 16xlarge (64 vCPUs, 732.0 GiB)
        - A1 General Purpose ARM Medium (1 vCPUs, 2.0 GiB)
        - A1 General Purpose ARM Large (2 vCPUs, 4.0 GiB)
        - A1 General Purpose ARM Extra Large (4 vCPUs, 8.0 GiB)
        - A1 General Purpose ARM Double Extra Large (8 vCPUs, 16.0 GiB)
        - A1 General Purpose ARM Quadruple Extra Large (16 vCPUs, 32.0 GiB)
    - **`max_size`** *(integer)*: Maximum number of instances in the node group. Minimum: `0`. Default: `10`.
    - **`min_size`** *(integer)*: Minimum number of instances in the node group. Minimum: `0`. Default: `1`.
    - **`name_suffix`** *(string)*: The name of the node group. Default: ``.
## Examples

  ```json
  {
      "__name": "Development",
      "k8s_version": "1.24",
      "node_groups": [
          {
              "instance_type": "t3.medium",
              "max_size": 10,
              "min_size": 1,
              "name_suffix": "shared"
          }
      ]
  }
  ```

  ```json
  {
      "__name": "Production",
      "k8s_version": "1.24",
      "node_groups": [
          {
              "instance_type": "c5.2xlarge",
              "max_size": 10,
              "min_size": 1,
              "name_suffix": "shared"
          }
      ]
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`aws_authentication`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`arn`** *(string)*: Amazon Resource Name.

      Examples:
      ```json
      "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
      ```

      ```json
      "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
      ```

    - **`external_id`** *(string)*: An external ID is a piece of data that can be passed to the AssumeRole API of the Security Token Service (STS). You can then use the external ID in the condition element in a role's trust policy, allowing the role to be assumed only when a certain value is present in the external ID.
  - **`specs`** *(object)*
    - **`aws`** *(object)*: .
      - **`region`** *(string)*: AWS Region to provision in.

        Examples:
        ```json
        "us-west-2"
        ```

- **`vpc`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*
      - **`arn`** *(string)*: Amazon Resource Name.

        Examples:
        ```json
        "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
        ```

        ```json
        "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
        ```

      - **`cidr`** *(string)*

        Examples:
        ```json
        "10.100.0.0/16"
        ```

        ```json
        "192.24.12.0/22"
        ```

      - **`internal_subnets`** *(array)*
        - **Items** *(object)*: AWS VCP Subnet.
          - **`arn`** *(string)*: Amazon Resource Name.

            Examples:
            ```json
            "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
            ```

            ```json
            "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
            ```

          - **`aws_zone`** *(string)*: AWS Availability Zone.

            Examples:
          - **`cidr`** *(string)*

            Examples:
            ```json
            "10.100.0.0/16"
            ```

            ```json
            "192.24.12.0/22"
            ```


          Examples:
      - **`private_subnets`** *(array)*
        - **Items** *(object)*: AWS VCP Subnet.
          - **`arn`** *(string)*: Amazon Resource Name.

            Examples:
            ```json
            "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
            ```

            ```json
            "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
            ```

          - **`aws_zone`** *(string)*: AWS Availability Zone.

            Examples:
          - **`cidr`** *(string)*

            Examples:
            ```json
            "10.100.0.0/16"
            ```

            ```json
            "192.24.12.0/22"
            ```


          Examples:
      - **`public_subnets`** *(array)*
        - **Items** *(object)*: AWS VCP Subnet.
          - **`arn`** *(string)*: Amazon Resource Name.

            Examples:
            ```json
            "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
            ```

            ```json
            "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
            ```

          - **`aws_zone`** *(string)*: AWS Availability Zone.

            Examples:
          - **`cidr`** *(string)*

            Examples:
            ```json
            "10.100.0.0/16"
            ```

            ```json
            "192.24.12.0/22"
            ```


          Examples:
  - **`specs`** *(object)*
    - **`aws`** *(object)*: .
      - **`region`** *(string)*: AWS Region to provision in.

        Examples:
        ```json
        "us-west-2"
        ```

<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

- **`kubernetes_cluster`** *(object)*: Kubernetes cluster authentication and cloud-specific configuration. Cannot contain additional properties.
  - **`data`** *(object)*
    - **`authentication`** *(object)*
      - **`cluster`** *(object)*
        - **`certificate-authority-data`** *(string)*
        - **`server`** *(string)*
      - **`user`** *(object)*
        - **`token`** *(string)*
    - **`infrastructure`** *(object)*: Cloud specific Kubernetes configuration data.
      - **One of**
        - AWS EKS infrastructure config*object*: . Cannot contain additional properties.
          - **`arn`** *(string)*: Amazon Resource Name.

            Examples:
            ```json
            "arn:aws:rds::ACCOUNT_NUMBER:db/prod"
            ```

            ```json
            "arn:aws:ec2::ACCOUNT_NUMBER:vpc/vpc-foo"
            ```

          - **`oidc_issuer_url`** *(string)*: An HTTPS endpoint URL.

            Examples:
            ```json
            "https://example.com/some/path"
            ```

            ```json
            "https://massdriver.cloud"
            ```

        - Infrastructure Config*object*: Azure AKS Infrastructure Configuration. Cannot contain additional properties.
          - **`ari`** *(string)*: Azure Resource ID.

            Examples:
            ```json
            "/subscriptions/12345678-1234-1234-abcd-1234567890ab/resourceGroups/resource-group-name/providers/Microsoft.Network/virtualNetworks/network-name"
            ```

          - **`oidc_issuer_url`** *(string)*
        - GCP Infrastructure GRN*object*: Minimal GCP Infrastructure Config. Cannot contain additional properties.
          - **`grn`** *(string)*: GCP Resource Name (GRN).

            Examples:
            ```json
            "projects/my-project/global/networks/my-global-network"
            ```

            ```json
            "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
            ```

            ```json
            "projects/my-project/topics/my-pubsub-topic"
            ```

            ```json
            "projects/my-project/subscriptions/my-pubsub-subscription"
            ```

            ```json
            "projects/my-project/locations/us-west2/instances/my-redis-instance"
            ```

            ```json
            "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
            ```

  - **`specs`** *(object)*
    - **`aws`** *(object)*: .
      - **`region`** *(string)*: AWS Region to provision in.

        Examples:
        ```json
        "us-west-2"
        ```

    - **`azure`** *(object)*: .
      - **`region`** *(string)*: Select the Azure region you'd like to provision your resources in.
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: The GCP region to provision resources in.

        Examples:
        ```json
        "us-east1"
        ```

        ```json
        "us-east4"
        ```

        ```json
        "us-west1"
        ```

        ```json
        "us-west2"
        ```

        ```json
        "us-west3"
        ```

        ```json
        "us-west4"
        ```

        ```json
        "us-central1"
        ```

    - **`kubernetes`** *(object)*: Kubernetes distribution and version specifications.
      - **`cloud`** *(string)*: Must be one of: `['aws', 'gcp', 'azure']`.
      - **`distribution`** *(string)*: Must be one of: `['eks', 'gke', 'aks']`.
      - **`platform_version`** *(string)*
      - **`version`** *(string)*
<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/aws-mq-rabbitmq/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]

<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg
[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=linkedin



[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/aws-mq-rabbitmq.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/aws-mq-rabbitmq/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/aws-mq-rabbitmq.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/aws-mq-rabbitmq/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/aws-mq-rabbitmq.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/aws-mq-rabbitmq/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/aws-mq-rabbitmq.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/aws-mq-rabbitmq/issues
[release_url]: https://github.com/massdriver-cloud/aws-mq-rabbitmq/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/aws-mq-rabbitmq.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/aws-mq-rabbitmq.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/aws-mq-rabbitmq/blob/main/LICENSE


[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=aws-mq-rabbitmq&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
