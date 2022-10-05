locals {
  name = var.override_name == null ? "${var.system_name}-${lower(var.environment)}-apimapi" : var.override_name

  api_management_api = concat(azurerm_api_management_api.api_management_api.*, [null])[0]
}

resource "azurerm_api_management_api" "api_management_api" {
  count = var.enabled ? 1 : 0

  name                = local.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group.name
  revision            = var.revision

  api_type     = try(var.api_type, null)
  display_name = try(var.display_name, null)
  path         = try(var.path, null)
  protocols    = try(var.protocols, null)
  description  = try(var.description, null)

  dynamic "import" {
    for_each = try(var.configuration.import, null) != null ? [var.configuration.import] : []

    content {

      content_format = try(import.value.content_format, null)
      content_value  = try(import.value.content_value, null)
      dynamic "wsdl_selector" {
        for_each = try(var.configuration.wsdl_selector, null) != null ? [var.configuration.wsdl_selector] : []

        content {

          service_name  = try(wsdl_selector.value.service_name, null)
          endpoint_name = try(wsdl_selector.value.endpoint_name, null)
        }
      }
    }
  }

  dynamic "oauth2_authorization" {
    for_each = try(var.configuration.oauth2_authorization, null) != null ? [var.configuration.oauth2_authorization] : []

    content {

      authorization_server_name = try(oauth2_authorization.value.authorization_server_name, null)
      scope                     = try(oauth2_authorization.value.scope, null)
    }
  }

  dynamic "openid_authentication" {
    for_each = try(var.configuration.openid_authentication, null) != null ? [var.configuration.openid_authentication] : []

    content {

      openid_provider_name         = try(openid_authentication.value.openid_provider_name, null)
      bearer_token_sending_methods = try(openid_authentication.value.bearer_token_sending_methods, null)
    }
  }

  service_url = try(var.service_url, null)

  # The `soap_pass_through` variable will be removed in favour of the `api_type` property in version 4.0 of the AzureRM provider.
  # soap_pass_through     = var.soap_pass_through

  dynamic "subscription_key_parameter_names" {
    for_each = try(var.configuration.subscription_key_parameter_names, null) != null ? [var.configuration.subscription_key_parameter_names] : []

    content {

      header = try(subscription_key_parameter_names.value.header, null)
      query  = try(subscription_key_parameter_names.value.query, null)
    }
  }

  subscription_required = try(var.subscription_required, null)
  version               = try(var.api_version, null)
  version_set_id        = try(var.version_set_id, null)
  revision_description  = try(var.revision_description, null)
  version_description   = try(var.version_description, null)
  source_api_id         = try(var.source_api_id, null)
}
