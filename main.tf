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

  dynamic "import" {
    for_each = try(var.settings.import, null) != null ? [var.settings.import] : []

    content {

      content_format = try(import.value.content_format, null)
      content_value  = try(import.value.content_value, null)
      dynamic "wsdl_selector" {
        for_each = try(var.settings.wsdl_selector, null) != null ? [var.settings.wsdl_selector] : []

        content {

          service_name  = try(wsdl_selector.value.service_name, null)
          endpoint_name = try(wsdl_selector.value.endpoint_name, null)
        }
      }
    }
  }

  dynamic "oauth2_authorization" {
    for_each = try(var.settings.oauth2_authorization, null) != null ? [var.settings.oauth2_authorization] : []

    content {

      authorization_server_name = try(oauth2_authorization.value.authorization_server_name, null)
      scope                     = try(oauth2_authorization.value.scope, null)
    }
  }

  dynamic "openid_authentication" {
    for_each = try(var.settings.openid_authentication, null) != null ? [var.settings.openid_authentication] : []

    content {

      openid_provider_name         = try(openid_authentication.value.openid_provider_name, null)
      bearer_token_sending_methods = try(openid_authentication.value.bearer_token_sending_methods, null)
    }
  }

  service_url = var.service_url

  # The `soap_pass_through` variable will be removed in favour of the `api_type` property in version 4.0 of the AzureRM provider.
  # soap_pass_through     = var.soap_pass_through

  dynamic "subscription_key_parameter_names" {
    for_each = try(var.settings.subscription_key_parameter_names, null) != null ? [var.settings.subscription_key_parameter_names] : []

    content {

      header = try(subscription_key_parameter_names.value.header, null)
      query  = try(subscription_key_parameter_names.value.query, null)
    }
  }

  subscription_required = var.subscription_required
  version               = var.api_version
  version_set_id        = var.version_set_id
  revision_description  = var.revision_description
  version_description   = var.version_description
  source_api_id         = var.source_api_id
}
