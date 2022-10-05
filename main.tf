locals {
  name = var.override_name == null ? "${var.system_name}-${lower(var.environment)}-apimapi" : var.override_name
  # location = var.override_location == null ? var.resource_group.location : var.override_location

  api_management_api = concat(azurerm_api_management_api.api_management_api.*, [null])[0]
}

resource "azurerm_api_management_api" "api_management_api" {
  count = var.enabled ? 1 : 0

  name = local.name
  # location            = local.location
  resource_group_name = var.resource_group.name

  api_management_name = var.api_management_name
  revision            = var.revision
  api_type            = var.api_type
  display_name        = var.display_name
  path                = var.path
  protocols           = var.protocols
  description         = var.description
  service_url         = var.service_url

  # The `soap_pass_through` variable will be removed in favour of the `api_type` property in version 4.0 of the AzureRM provider.
  # soap_pass_through     = var.soap_pass_through

  subscription_required = var.subscription_required
  version               = var.api_version
  version_set_id        = var.version_set_id
  revision_description  = var.revision_description
  version_description   = var.version_description
  source_api_id         = var.source_api_id
}
