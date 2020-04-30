provider "azurerm" {
  features {}
}

resource "azurerm_template_deployment" "template_deployment" {
  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode == null ? "Incremental" : var.deployment_mode
  template_body       = file(var.template_file)
  parameters_body     = file(var.parameters) ==null ? {} : file(var.parameters)
  parameters          = var.parameters == null ? {} : var.parameters
}
