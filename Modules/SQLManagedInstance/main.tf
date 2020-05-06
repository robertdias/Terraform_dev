module "naming" {
  source      = "../naming/standard-name"
  counter     = var.counter
  description = var.description
  location    = local.location
  type        = "sqlmi"
}

module "azurerm_template_deployment" {
  source      = "../ARMTemplateDeployment"
  name                = sqlmitestbl01
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode == null ? "Incremental" : var.deployment_mode
  template_file       = var.template_file
  parameters          = var.parameters
}