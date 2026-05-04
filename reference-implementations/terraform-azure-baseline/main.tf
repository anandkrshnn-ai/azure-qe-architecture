# Terraform Azure Baseline with Quality Guardrails
# Sets up a secure landing zone with monitoring and auditing enabled.

provider "azurerm" {
  features {}
}

# 1. Log Analytics Workspace (Centralized QE Data)
resource "azurerm_log_analytics_workspace" "qe" {
  name                = "qe-workspace"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# 2. Application Insights (Deep Observability)
resource "azurerm_application_insights" "qe" {
  name                = "qe-app-insights"
  location            = var.location
  resource_group_name = var.resource_group
  workspace_id        = azurerm_log_analytics_workspace.qe.id
  application_type    = "web"
}

# 3. Action Group (for SLO Alerts)
resource "azurerm_monitor_action_group" "qe_alerts" {
  name                = "qe-architect-alerts"
  resource_group_name = var.resource_group
  short_name          = "QEAlerts"

  email_receiver {
    name          = "QE Admin"
    email_address = var.admin_email
  }
}

# 4. Azure Policy Assignment (Governance Gate)
resource "azurerm_resource_group_policy_assignment" "no_public_ip" {
  name                 = "enforce-no-public-ip"
  resource_group_id    = var.resource_group_id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/83a86541-ad15-4a76-8f71-004458e51e83" # Inherited from built-in
  display_name         = "Restrict Public IP for VMs"
}
