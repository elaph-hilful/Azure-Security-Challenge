resource "azurerm_monitor_diagnostic_setting" "vm_logs" {
  name               = "${var.name}-vm-diag"
  target_resource_id = var.vm_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  metric {
    category = "AllMetrics"

  }
}

resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.name}-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_security_center_subscription_pricing" "standard" {
  tier = "Standard"
}

resource "azurerm_security_center_contact" "admin_alert" {
  email = var.alert_email
  alert_notifications = true
  alerts_to_admins    = true
  lifecycle {
  ignore_changes = [email]
}

}

# resource "azurerm_logic_app_workflow" "alert_workflow" {
#   name                = "${var.name}-alert-logic"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   definition = jsonencode({
#     "$schema" = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
#     "contentVersion" = "1.0.0.0",
#     "triggers" = {
#       "Recurrence" = {
#         "type" = "Recurrence",
#         "recurrence" = {
#           "frequency" = "Hour",
#           "interval" = 1
#         }
#       }
#     },
#     "actions" = {
#       // Define a valid Logic App connector-based action here
#     }
#   })

#   identity {
#     type = "SystemAssigned"
#   }
# }




