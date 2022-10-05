# [terraform-azurerm-apimanagementapi][1]

Manages an API within an API Management Service.

## Getting Started

- Format and validate Terraform code before commit.

```shell
terraform init -upgrade \
    && terraform init -reconfigure -upgrade \
    && terraform fmt -recursive . \
    && terraform fmt -check \
    && terraform validate .
```

- Always fetch latest changes from upstream and rebase from it. Terraform documentation will always be updated with GitHub Actions. See also [.github/workflows/terraform.yml](.github/workflows/terraform.yml) GitHub Actions workflow.

```shell
git fetch --all --tags --prune --prune-tags \
  && git pull --rebase --all --prune --tags
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management_api.api_management_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_management_name"></a> [api\_management\_name](#input\_api\_management\_name) | (Required) The Name of the API Management Service where this API should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_api_type"></a> [api\_type](#input\_api\_type) | (Optional) Type of API. Possible values are `graphql`, `http`, `soap`, and `websocket`. Defaults to `http`. | `string` | `"http"` | no |
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | (Optional) The Version number of this API, if this API is versioned. | `string` | `null` | no |
| <a name="input_configuration"></a> [configuration](#input\_configuration) | (Required) The configuration for block type arguments. | `any` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description of the API Management API, which may include HTML formatting tags. | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Optional) The display name of the API. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Enable the creation of this resource. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The name of the environment. | `string` | n/a | yes |
| <a name="input_override_name"></a> [override\_name](#input\_override\_name) | (Optional) Override the name of the resource. Under normal circumstances, it should not be used. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional) The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of its resource paths within the API Management Service. | `string` | `null` | no |
| <a name="input_protocols"></a> [protocols](#input\_protocols) | (Optional) A list of protocols the operations in this API can be invoked. Possible values are `http`, `https`, `ws`, and `wss`. | `list(string)` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | (Required) The resource group in which to create the resource. | `any` | n/a | yes |
| <a name="input_revision"></a> [revision](#input\_revision) | (Required) The Revision which used for this API. | `string` | n/a | yes |
| <a name="input_revision_description"></a> [revision\_description](#input\_revision\_description) | (Optional) The description of the API Revision of the API Management API. | `string` | `null` | no |
| <a name="input_service_url"></a> [service\_url](#input\_service\_url) | (Optional) Absolute URL of the backend service implementing this API. | `string` | `null` | no |
| <a name="input_source_api_id"></a> [source\_api\_id](#input\_source\_api\_id) | (Optional) The API id of the source API, which could be in format `azurerm_api_management_api.example.id` or in format `azurerm_api_management_api.example.id;rev=1`. | `string` | `null` | no |
| <a name="input_subscription_required"></a> [subscription\_required](#input\_subscription\_required) | (Optional) Should this API require a subscription key? | `bool` | `false` | no |
| <a name="input_system_name"></a> [system\_name](#input\_system\_name) | (Required) The systen name which should be used for this resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_version_description"></a> [version\_description](#input\_version\_description) | (Optional) The description of the API Version of the API Management API. | `string` | `null` | no |
| <a name="input_version_set_id"></a> [version\_set\_id](#input\_version\_set\_id) | (Optional) The ID of the Version Set which this API is associated with. When `version` is set, `version_set_id` must also be specified. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_api_management_api"></a> [azurerm\_api\_management\_api](#output\_azurerm\_api\_management\_api) | The Azure API Management API resource. |
<!-- END_TF_DOCS -->

[1]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
