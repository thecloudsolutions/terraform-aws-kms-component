<!-- markdownlint-disable -->
[![Release](https://img.shields.io/github/v/release/thecloudsolutions/terraform-aws-kms-component?style=for-the-badge&color=6150E8)](https://github.com/thecloudsolutions/terraform-aws-kms-component/releases)
[![Commit](https://img.shields.io/github/last-commit/thecloudsolutions/terraform-aws-kms-component?style=for-the-badge&color=FF9800)](https://github.com/thecloudsolutions/terraform-aws-kms-component/commits)
[![Issues](https://img.shields.io/github/issues/thecloudsolutions/terraform-aws-kms-component?style=for-the-badge&color=BB019E)](https://github.com/thecloudsolutions/terraform-aws-kms-component/issues)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-009FD2?style=for-the-badge)](#requirements)
[![License](https://img.shields.io/github/license/thecloudsolutions/terraform-aws-kms-component?style=for-the-badge&color=3FB950)](https://github.com/thecloudsolutions/terraform-aws-kms-component/blob/main/LICENSE)

# terraform-aws-kms-component

[![Cloud Solutions Banner][banner]](https://thecloudsolutions.com/)

[![Sponsor Us](https://img.shields.io/badge/sponsor_us-FF9800?style=for-the-badge)](https://github.com/sponsors/thecloudsolutions)
[![Hire Us](https://img.shields.io/badge/hire_us-009FD2?style=for-the-badge)](https://thecloudsolutions.com/contact-us)
[![Maintained By](https://img.shields.io/badge/maintained_by-Cloud_Solutions-6150E8?style=for-the-badge)](https://thecloudsolutions.com/)

## Description

Terraform component that creates and manages AWS KMS customer-managed keys, key aliases, and key policies. Supports configurable key rotation, multi-Region keys, and granular resource-based key policies.

## Variable Naming

In all Cloud Solutions **components** and **modules**, we intentionally use the _map suffix for input variables that accept map(object(...)).

For example:
```hcl
variable "kms_map" {
  type        = map(object({ ... }))
  description = "Keyed collection of kms definitions"
}
```
⚠️ This is a deliberate deviation from [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/syntax/style).

We fully acknowledge that this naming convention does not follow the Terraform style guide, which recommends naming variables based on what they represent, not how they're implemented. We understand this, and want to emphasize:

1. This is a deliberate, informed decision, not an oversight.
2. Our primary goal is clarity and consistency for developers using our modules.
3. The intent is to give users immediate understanding of what kind of structure they're supplying.

### ✅ Why we made this decision (for our components and modules only)

This convention exists only within our components and modules structure. Here's why it works well for us:

1. Instant clarity for users - The _map suffix immediately signals that the variable supports multiple instances, each keyed by name. This avoids confusion around whether a variable is singular or plural.
2. Uniformity across all resources - Instead of struggling with awkward plurals (like kmses, rdses, vpcs, cloudfronts, account_managements) or inconsistent suffixes (_configs, _definitions, etc.), we use one simple, predictable pattern.
3. Avoids naming collisions - The _map suffix never conflicts with native Terraform or AWS resource types.
4. Future-proof for contributors - When contributors see _map, they can safely assume the structure is a map(object(...)) without checking variables.tf.

### 🙌 What this means for contributors

If you're contributing to Cloud Solutions components or modules, please:

1. Use the _map suffix when introducing a new map(object(...)) variable.
2. Follow the naming pattern consistently: rds_map, vpc_map, cloudfront_map, etc.
3. Don't apply this convention to Terraform projects outside components or modules - it's a local convention, not a global best practice.

If you have strong opinions or ideas for evolving this standard, you're welcome to open a discussion.

## Usage

```hcl
module "terraform-aws-kms-component" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-kms-component.git"
  # Cloud Solutions recommends to pin every module to a specific version
  # ?ref=x.x.x

  # Required variables
  kms_map = {
    key = <value>
  }
}
```

> [!IMPORTANT]
> In our examples we don't pin modules to specific versions to keep the documentation aligned with the latest releases.
> However, for your own projects, we recommend to pin each module to the exact version you're using. This approach helps maintain the stability of your infrastructure.
> Additionally, adopting a structured process for version updates will help prevent unexpected changes.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | ./module | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_map"></a> [kms\_map](#input\_kms\_map) | Keyed collection of kms definitions | <pre>map(object({<br/>    key = optional(object({<br/>      region                             = optional(string)<br/>      description                        = optional(string)<br/>      key_usage                          = optional(string)<br/>      custom_key_store_id                = optional(string)<br/>      custom_key_store_custom_name       = optional(string)<br/>      customer_master_key_spec           = optional(string)<br/>      policy                             = optional(string)<br/>      bypass_policy_lockout_safety_check = optional(bool)<br/>      deletion_window_in_days            = optional(number)<br/>      is_enabled                         = optional(bool)<br/>      enable_key_rotation                = optional(bool)<br/>      rotation_period_in_days            = optional(number)<br/>      multi_region                       = optional(bool)<br/>      xks_key_id                         = optional(string)<br/>      tags                               = optional(map(string))<br/>      timeouts = optional(object({<br/>        create = optional(string)<br/>      }))<br/>    }))<br/><br/>    external_key = optional(object({<br/>      region                             = optional(string)<br/>      description                        = optional(string)<br/>      key_spec                           = optional(string)<br/>      key_usage                          = optional(string)<br/>      policy                             = optional(string)<br/>      bypass_policy_lockout_safety_check = optional(bool)<br/>      deletion_window_in_days            = optional(number)<br/>      enabled                            = optional(bool)<br/>      key_material_base64                = optional(string)<br/>      multi_region                       = optional(bool)<br/>      valid_to                           = optional(string)<br/>      tags                               = optional(map(string))<br/>    }))<br/><br/>    existing_key = optional(object({<br/>      region       = optional(string)<br/>      key_id       = string<br/>      grant_tokens = optional(list(string))<br/>    }))<br/><br/>    aliases = optional(map(object({<br/>      region                  = optional(string)<br/>      name                    = optional(string)<br/>      name_prefix             = optional(string)<br/>      target_key_id           = optional(string)<br/>      replica_key_custom_name = optional(string)<br/>    })), {})<br/><br/>    grants = optional(map(object({<br/>      region                  = optional(string)<br/>      key_id                  = optional(string)<br/>      replica_key_custom_name = optional(string)<br/>      name                    = optional(string)<br/>      grantee_principal       = string<br/>      operations              = set(string)<br/>      retiring_principal      = optional(string)<br/>      retire_on_delete        = optional(bool)<br/>      grant_creation_tokens   = optional(set(string))<br/>      constraints = optional(set(object({<br/>        encryption_context_equals = optional(map(string))<br/>        encryption_context_subset = optional(map(string))<br/>      })))<br/>    })), {})<br/><br/>    replica_keys = optional(map(object({<br/>      region                             = optional(string)<br/>      primary_key_arn                    = optional(string)<br/>      description                        = optional(string)<br/>      policy                             = optional(string)<br/>      bypass_policy_lockout_safety_check = optional(bool)<br/>      deletion_window_in_days            = optional(number)<br/>      enabled                            = optional(bool)<br/>      tags                               = optional(map(string))<br/>    })), {})<br/><br/>    replica_external_keys = optional(map(object({<br/>      region                             = optional(string)<br/>      primary_key_arn                    = optional(string)<br/>      description                        = optional(string)<br/>      policy                             = optional(string)<br/>      bypass_policy_lockout_safety_check = optional(bool)<br/>      deletion_window_in_days            = optional(number)<br/>      enabled                            = optional(bool)<br/>      key_material_base64                = optional(string)<br/>      valid_to                           = optional(string)<br/>      tags                               = optional(map(string))<br/>    })), {})<br/><br/>    key_policy = optional(object({<br/>      region                             = optional(string)<br/>      key_id                             = optional(string)<br/>      policy                             = string<br/>      bypass_policy_lockout_safety_check = optional(bool)<br/>    }))<br/><br/>    custom_key_stores = optional(map(object({<br/>      region                   = optional(string)<br/>      custom_key_store_name    = string<br/>      custom_key_store_type    = optional(string)<br/>      cloud_hsm_cluster_id     = optional(string)<br/>      key_store_password       = optional(string)<br/>      trust_anchor_certificate = optional(string)<br/>      xks_proxy_authentication_credential = optional(object({<br/>        access_key_id         = string<br/>        raw_secret_access_key = string<br/>      }))<br/>      xks_proxy_connectivity              = optional(string)<br/>      xks_proxy_uri_endpoint              = optional(string)<br/>      xks_proxy_uri_path                  = optional(string)<br/>      xks_proxy_vpc_endpoint_service_name = optional(string)<br/>      timeouts = optional(object({<br/>        create = optional(string)<br/>        update = optional(string)<br/>        delete = optional(string)<br/>      }))<br/>    })), {})<br/><br/>    public_key = optional(object({<br/>      region                  = optional(string)<br/>      key_id                  = optional(string)<br/>      replica_key_custom_name = optional(string)<br/>      grant_tokens            = optional(list(string))<br/>    }))<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_arns"></a> [kms\_key\_arns](#output\_kms\_key\_arns) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_kms_key_ids"></a> [kms\_key\_ids](#output\_kms\_key\_ids) | The globally unique identifier for the key. |
| <a name="output_kms_key_tags_all"></a> [kms\_key\_tags\_all](#output\_kms\_key\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_kms_alias_arns"></a> [kms\_alias\_arns](#output\_kms\_alias\_arns) | The Amazon Resource Name (ARN) of the key alias. |
| <a name="output_kms_alias_target_key_arns"></a> [kms\_alias\_target\_key\_arns](#output\_kms\_alias\_target\_key\_arns) | The Amazon Resource Name (ARN) of the target key identifier. |
| <a name="output_kms_key_regions"></a> [kms\_key\_regions](#output\_kms\_key\_regions) | Regions where the keys are managed. |
| <a name="output_kms_key_policies"></a> [kms\_key\_policies](#output\_kms\_key\_policies) | Map of key policy JSON documents. |
| <a name="output_kms_key_specs"></a> [kms\_key\_specs](#output\_kms\_key\_specs) | Types of key material. |
| <a name="output_kms_key_usages"></a> [kms\_key\_usages](#output\_kms\_key\_usages) | Permitted cryptographic uses of the keys. |
| <a name="output_kms_key_states"></a> [kms\_key\_states](#output\_kms\_key\_states) | States of imported and existing keys. |
| <a name="output_kms_key_expiration_models"></a> [kms\_key\_expiration\_models](#output\_kms\_key\_expiration\_models) | Whether imported key material expires. |
| <a name="output_kms_key_valid_to"></a> [kms\_key\_valid\_to](#output\_kms\_key\_valid\_to) | Expiration times of imported key material. |
| <a name="output_kms_alias_names"></a> [kms\_alias\_names](#output\_kms\_alias\_names) | Names of the key aliases. |
| <a name="output_kms_alias_name_prefixes"></a> [kms\_alias\_name\_prefixes](#output\_kms\_alias\_name\_prefixes) | Prefixes used to generate the alias names. |
| <a name="output_kms_alias_target_key_ids"></a> [kms\_alias\_target\_key\_ids](#output\_kms\_alias\_target\_key\_ids) | Identifiers of the keys associated with the aliases. |
| <a name="output_kms_alias_regions"></a> [kms\_alias\_regions](#output\_kms\_alias\_regions) | Regions where the aliases are managed. |
| <a name="output_kms_grant_ids"></a> [kms\_grant\_ids](#output\_kms\_grant\_ids) | Maps of grant identifiers. |
| <a name="output_kms_grant_tokens"></a> [kms\_grant\_tokens](#output\_kms\_grant\_tokens) | Maps of grant tokens. |
| <a name="output_kms_grant_regions"></a> [kms\_grant\_regions](#output\_kms\_grant\_regions) | Maps of grant regions. |
| <a name="output_kms_grant_key_ids"></a> [kms\_grant\_key\_ids](#output\_kms\_grant\_key\_ids) | Maps of key IDs or ARNs to which the grants apply. |
| <a name="output_kms_grant_names"></a> [kms\_grant\_names](#output\_kms\_grant\_names) | Maps of grant names. |
| <a name="output_kms_grant_grantee_principals"></a> [kms\_grant\_grantee\_principals](#output\_kms\_grant\_grantee\_principals) | Maps of grantee principals. |
| <a name="output_kms_grant_operations"></a> [kms\_grant\_operations](#output\_kms\_grant\_operations) | Maps of operations permitted by the grants. |
| <a name="output_kms_grant_retiring_principals"></a> [kms\_grant\_retiring\_principals](#output\_kms\_grant\_retiring\_principals) | Maps of retiring principals. |
| <a name="output_kms_grant_constraints"></a> [kms\_grant\_constraints](#output\_kms\_grant\_constraints) | Maps of encryption context constraints for the grants. |
| <a name="output_kms_replica_key_arns"></a> [kms\_replica\_key\_arns](#output\_kms\_replica\_key\_arns) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_kms_replica_key_ids"></a> [kms\_replica\_key\_ids](#output\_kms\_replica\_key\_ids) | The globally unique identifier for the key. |
| <a name="output_kms_replica_key_regions"></a> [kms\_replica\_key\_regions](#output\_kms\_replica\_key\_regions) | Region where the resource is managed. |
| <a name="output_kms_replica_key_policies"></a> [kms\_replica\_key\_policies](#output\_kms\_replica\_key\_policies) | The key policy JSON document. |
| <a name="output_kms_replica_key_rotation_enabled"></a> [kms\_replica\_key\_rotation\_enabled](#output\_kms\_replica\_key\_rotation\_enabled) | Whether rotation is enabled for the related multi-Region keys. |
| <a name="output_kms_replica_key_specs"></a> [kms\_replica\_key\_specs](#output\_kms\_replica\_key\_specs) | Type of key material. |
| <a name="output_kms_replica_key_usages"></a> [kms\_replica\_key\_usages](#output\_kms\_replica\_key\_usages) | Permitted cryptographic use of the key. |
| <a name="output_kms_replica_key_enabled"></a> [kms\_replica\_key\_enabled](#output\_kms\_replica\_key\_enabled) | Whether the key is enabled. |
| <a name="output_kms_replica_key_tags_all"></a> [kms\_replica\_key\_tags\_all](#output\_kms\_replica\_key\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_kms_replica_external_key_arns"></a> [kms\_replica\_external\_key\_arns](#output\_kms\_replica\_external\_key\_arns) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_kms_replica_external_key_ids"></a> [kms\_replica\_external\_key\_ids](#output\_kms\_replica\_external\_key\_ids) | The globally unique identifier for the key. |
| <a name="output_kms_replica_external_key_regions"></a> [kms\_replica\_external\_key\_regions](#output\_kms\_replica\_external\_key\_regions) | Region where the resource is managed. |
| <a name="output_kms_replica_external_key_policies"></a> [kms\_replica\_external\_key\_policies](#output\_kms\_replica\_external\_key\_policies) | The key policy JSON document. |
| <a name="output_kms_replica_external_key_usages"></a> [kms\_replica\_external\_key\_usages](#output\_kms\_replica\_external\_key\_usages) | Permitted cryptographic use of the key. |
| <a name="output_kms_replica_external_key_states"></a> [kms\_replica\_external\_key\_states](#output\_kms\_replica\_external\_key\_states) | The current state of the key. |
| <a name="output_kms_replica_external_key_expiration_models"></a> [kms\_replica\_external\_key\_expiration\_models](#output\_kms\_replica\_external\_key\_expiration\_models) | Whether the imported key material expires. |
| <a name="output_kms_replica_external_key_valid_to"></a> [kms\_replica\_external\_key\_valid\_to](#output\_kms\_replica\_external\_key\_valid\_to) | Expiration time of the imported key material. |
| <a name="output_kms_replica_external_key_enabled"></a> [kms\_replica\_external\_key\_enabled](#output\_kms\_replica\_external\_key\_enabled) | Whether the key is enabled. |
| <a name="output_kms_replica_external_key_tags_all"></a> [kms\_replica\_external\_key\_tags\_all](#output\_kms\_replica\_external\_key\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_kms_custom_key_store_ids"></a> [kms\_custom\_key\_store\_ids](#output\_kms\_custom\_key\_store\_ids) | Maps of custom key store identifiers. |
| <a name="output_kms_existing_key_ids"></a> [kms\_existing\_key\_ids](#output\_kms\_existing\_key\_ids) | The unique identifier of the resource. |
| <a name="output_kms_existing_key_arns"></a> [kms\_existing\_key\_arns](#output\_kms\_existing\_key\_arns) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_kms_existing_key_regions"></a> [kms\_existing\_key\_regions](#output\_kms\_existing\_key\_regions) | Region where the resource is managed. |
| <a name="output_kms_existing_key_aws_account_ids"></a> [kms\_existing\_key\_aws\_account\_ids](#output\_kms\_existing\_key\_aws\_account\_ids) | AWS account that owns the key. |
| <a name="output_kms_existing_key_cloud_hsm_cluster_ids"></a> [kms\_existing\_key\_cloud\_hsm\_cluster\_ids](#output\_kms\_existing\_key\_cloud\_hsm\_cluster\_ids) | CloudHSM cluster containing the key material. |
| <a name="output_kms_existing_key_creation_dates"></a> [kms\_existing\_key\_creation\_dates](#output\_kms\_existing\_key\_creation\_dates) | Creation date of the key. |
| <a name="output_kms_existing_key_custom_key_store_ids"></a> [kms\_existing\_key\_custom\_key\_store\_ids](#output\_kms\_existing\_key\_custom\_key\_store\_ids) | ID of the custom key store containing the key. |
| <a name="output_kms_existing_key_customer_master_key_specs"></a> [kms\_existing\_key\_customer\_master\_key\_specs](#output\_kms\_existing\_key\_customer\_master\_key\_specs) | Type of key material. |
| <a name="output_kms_existing_key_deletion_dates"></a> [kms\_existing\_key\_deletion\_dates](#output\_kms\_existing\_key\_deletion\_dates) | Scheduled deletion date of the key. |
| <a name="output_kms_existing_key_descriptions"></a> [kms\_existing\_key\_descriptions](#output\_kms\_existing\_key\_descriptions) | Description of the key. |
| <a name="output_kms_existing_key_enabled"></a> [kms\_existing\_key\_enabled](#output\_kms\_existing\_key\_enabled) | Whether the key is enabled. |
| <a name="output_kms_existing_key_expiration_models"></a> [kms\_existing\_key\_expiration\_models](#output\_kms\_existing\_key\_expiration\_models) | Whether the imported key material expires. |
| <a name="output_kms_existing_key_managers"></a> [kms\_existing\_key\_managers](#output\_kms\_existing\_key\_managers) | Manager of the key. |
| <a name="output_kms_existing_key_specs"></a> [kms\_existing\_key\_specs](#output\_kms\_existing\_key\_specs) | Type of key material. |
| <a name="output_kms_existing_key_states"></a> [kms\_existing\_key\_states](#output\_kms\_existing\_key\_states) | The current state of the key. |
| <a name="output_kms_existing_key_usages"></a> [kms\_existing\_key\_usages](#output\_kms\_existing\_key\_usages) | Permitted cryptographic use of the key. |
| <a name="output_kms_existing_key_multi_region"></a> [kms\_existing\_key\_multi\_region](#output\_kms\_existing\_key\_multi\_region) | Whether the key is a multi-Region key. |
| <a name="output_kms_existing_key_multi_region_configurations"></a> [kms\_existing\_key\_multi\_region\_configurations](#output\_kms\_existing\_key\_multi\_region\_configurations) | Primary and replica configuration of the multi-Region key. |
| <a name="output_kms_existing_key_origins"></a> [kms\_existing\_key\_origins](#output\_kms\_existing\_key\_origins) | Origin of the key material. |
| <a name="output_kms_existing_key_pending_deletion_window_in_days"></a> [kms\_existing\_key\_pending\_deletion\_window\_in\_days](#output\_kms\_existing\_key\_pending\_deletion\_window\_in\_days) | Waiting period before deleting a multi-Region primary key. |
| <a name="output_kms_existing_key_valid_to"></a> [kms\_existing\_key\_valid\_to](#output\_kms\_existing\_key\_valid\_to) | Expiration time of the imported key material. |
| <a name="output_kms_existing_key_xks_key_configurations"></a> [kms\_existing\_key\_xks\_key\_configurations](#output\_kms\_existing\_key\_xks\_key\_configurations) | Configuration of the external key store key. |
| <a name="output_kms_public_keys"></a> [kms\_public\_keys](#output\_kms\_public\_keys) | Base64-encoded DER public keys. |
| <a name="output_kms_public_key_pems"></a> [kms\_public\_key\_pems](#output\_kms\_public\_key\_pems) | PEM-encoded public keys. |
| <a name="output_kms_public_key_arns"></a> [kms\_public\_key\_arns](#output\_kms\_public\_key\_arns) | ARNs of keys whose public keys were retrieved. |
| <a name="output_kms_public_key_encryption_algorithms"></a> [kms\_public\_key\_encryption\_algorithms](#output\_kms\_public\_key\_encryption\_algorithms) | Encryption algorithms supported by the keys. |
| <a name="output_kms_public_key_signing_algorithms"></a> [kms\_public\_key\_signing\_algorithms](#output\_kms\_public\_key\_signing\_algorithms) | Signing algorithms supported by the keys. |

## Quick Start

The project is under active development, and we welcome all contributors! 🎉
  
Before you start, please review our [Contributor Guidelines](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) to understand the expectations and processes.
  
Follow these steps to get started:
  
---
  
### 1. **Fork the Repository**
- Click the **"Fork"** button on the repository's GitHub page to create a copy under your GitHub account.

> [!TIP]
> If you're new to GitHub, check out the [GitHub Docs](https://docs.github.com/en/get-started) to familiarize yourself with key concepts like forking, branching, and pull requests.
  
### 2. **Clone the Fork**
- Clone your fork to your local machine using:
  ```bash
  git clone https://github.com/<your-username>/<repository-name>.git
  ```
  
### 3. **Create a Branch**
- Create a new branch for your contribution:
  ```bash
  git checkout -b your-feature-name
  ```
  
### 4. **Make Changes**
- Implement your changes in the codebase.
- Ensure you follow the project's style guide and standards.
  
> [!WARNING]
> Always adhere to the project's coding standards and best practices outlined in the [CONTRIBUTING.md](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) file.
    
### 5. **Test Your Changes**
- Run tests to verify your changes locally.
- Follow any project-specific testing instructions.
    
### 6. **Commit Your Changes**
- Stage and commit your changes with a clear and concise message:
  ```bash
  git add .
  git commit -m "Add description of the change"
  ```

> [!NOTE]
> Use meaningful commit messages in the present tense (e.g., "Add feature X" instead of "Added feature X").
  
### 7. **Push Your Branch**
- Push your branch to your fork:
  ```bash
  git push origin your-feature-name
  ```
    
### 8. **Open a Pull Request (PR)**
- Navigate to the original repository and click the **"New Pull Request"** button.
- Select your branch and submit your PR following the [Pull Request template](https://github.com/thecloudsolutions/.github/blob/main/.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).
- Use keywords like `Closes #123` to link your PR to a related issue.
  
### **🎉 Congratulations, you’ve made your first contribution! 🎉**  
We appreciate your effort and look forward to reviewing your work.

## About Us

**Cloud Solutions: Innovating Open Source for AWS & DevOps**

Cloud Solutions creates and maintains free, open-source tools to help startups thrive in the AWS Cloud and DevOps space. Our mission is to make advanced technology accessible to businesses of all sizes.

With years of experience and a commitment to innovation, we design solutions that simplify workflows, encourage collaboration, and drive growth - removing cost barriers along the way. Every contribution brings us closer to a future where technology empowers all.

Your support makes everything we do possible.

Thank you for being part of our journey to empower innovation and build a stronger Open Source future!

## Contributing

The project is under active development, and we welcome all contributors! 🎉 

Before you start, please review our [Contributor Guidelines](CONTRIBUTING.md) to understand the expectations and processes.

## Blog

Link to our [blog](https://thecloudsolutions.com/blog), where you can explore in-depth articles. Gain valuable insights and expert analysis on AWS cloud solution strategies and trends.

## License

The project is 100% Open Source and licensed under the [APACHE2](LICENSE).

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Copyrights

Copyright © 2020-2026 [Cloud Solutions](https://thecloudsolutions.com)

[banner]: https://github.com/thecloudsolutions/.github/blob/main/profile/banner.png