variable "environment" {
  description = "(Required) The name of the environment."
  type        = string
  validation {
    condition = contains([
      "dev",
      "test",
      "prod",
    ], var.environment)
    error_message = "Possible values are dev, test, and prod."
  }
}

# This `name` variable is replaced by the use of `system_name` and `environment` variables.
# variable "name" {
#   description = "(Required) The name which should be used for this resource. Changing this forces a new resource to be created."
#   type        = string
# }

variable "system_name" {
  description = "(Required) The systen name which should be used for this resource. Changing this forces a new resource to be created."
  type        = string
}

variable "override_name" {
  description = "(Optional) Override the name of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

# variable "override_location" {
#   description = "(Optional) Override the location of the resource. Under normal circumstances, it should not be used."
#   default     = null
#   type        = string
# }

variable "resource_group" {
  description = "(Required) The resource group in which to create the resource."
  type        = any
}

# This `resource_group_name` variable is replaced by the use of `resource_group` variable.
# variable "resource_group_name" {
#   description = "(Required) The name of the resource group where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

# This `location` variable is replaced by the use of `resource_group` variable.
# variable "location" {
#   description = "(Required) The location where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

variable "enabled" {
  description = "(Optional) Enable the creation of this resource."
  type        = bool
  default     = true
}

variable "api_management_name" {
  description = "(Required) The Name of the API Management Service where this API should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "revision" {
  description = "(Required) The Revision which used for this API."
  type        = string
}

variable "api_type" {
  description = "(Optional) Type of API. Possible values are `graphql`, `http`, `soap`, and `websocket`. Defaults to `http`."
  type        = string
  default     = "http"
  validation {
    condition     = can(regex("^(graphql|http|soap|websocket)$", var.api_type))
    error_message = "Possible values are `graphql`, `http`, `soap`, and `websocket`."
  }
}

variable "display_name" {
  description = "(Optional) The display name of the API."
  type        = string
  default     = null
}

variable "path" {
  description = "(Optional) The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of its resource paths within the API Management Service."
  type        = string
  default     = null
}

variable "protocols" {
  description = "(Optional) A list of protocols the operations in this API can be invoked. Possible values are `http`, `https`, `ws`, and `wss`."
  type        = list(string)
  default     = null
  validation {
    condition     = can(regex("^(http|https|ws|wss)$", var.protocols))
    error_message = "Possible values are `http`, `https`, `ws`, and `wss`."
  }
}

variable "description" {
  description = "(Optional) A description of the API Management API, which may include HTML formatting tags."
  type        = string
  default     = null
}

# variable "import" {}
# variable "oauth2_authorization" {}
# variable "openid_authentication" {}

variable "service_url" {
  description = "(Optional) Absolute URL of the backend service implementing this API."
  type        = string
  default     = null
}

# The `soap_pass_through` variable will be removed in favour of the `api_type` property in version 4.0 of the AzureRM provider.
# variable "soap_pass_through" {
#   description = "(Optional) Should this API expose a SOAP frontend, rather than a HTTP frontend? Defaults to `false`."
#   type        = bool
#   default     = false
# }

# variable "subscription_key_parameter_names" {}

variable "subscription_required" {
  description = "(Optional) Should this API require a subscription key?"
  type        = bool
  default     = false
}

variable "api_version" { # TODO: The variable name "version" is reserved due to its special meaning inside module blocks.
  description = "(Optional) The Version number of this API, if this API is versioned."
  type        = string
  default     = null
}

variable "version_set_id" {
  description = "(Optional) The ID of the Version Set which this API is associated with. When `version` is set, `version_set_id` must also be specified."
  type        = string
  default     = null
}

variable "revision_description" {
  description = "(Optional) The description of the API Revision of the API Management API."
  type        = string
  default     = null
}

variable "version_description" {
  description = "(Optional) The description of the API Version of the API Management API."
  type        = string
  default     = null
}

variable "source_api_id" {
  description = "(Optional) The API id of the source API, which could be in format `azurerm_api_management_api.example.id` or in format `azurerm_api_management_api.example.id;rev=1`."
  type        = string
  default     = null
}

# variable "tags" {
#   description = "(Optional) A mapping of tags to assign to the resource."
#   type        = map(string)
#   default     = {}
# }
