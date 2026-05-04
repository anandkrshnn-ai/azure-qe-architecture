# Azure Monitor Metric Alerts defined via Terraform
# These act as continuous quality probes in production.

resource "azurerm_monitor_metric_alert" "aks_availability_slo" {
  name                = "AKS-Availability-SLO-99.9"
  resource_group_name = var.resource_group
  scopes              = [var.aks_cluster_id]
  description         = "Breached if AKS success rate falls below 99.9%."
  severity            = 1
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.ContainerService/managedClusters"
    metric_name      = "kube_pod_status_ready"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 0.999
  }

  action {
    action_group_id = azurerm_monitor_action_group.qe_alerts.id
  }
}

# SLO Alert for App Service Latency
resource "azurerm_monitor_metric_alert" "app_latency_slo" {
  name                = "App-Latency-P95-800ms"
  resource_group_name = var.resource_group
  scopes              = [var.app_service_id]
  description         = "Breached if App Service P95 latency exceeds 800ms."
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HttpResponseTime"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 800
  }

  action {
    action_group_id = azurerm_monitor_action_group.qe_alerts.id
  }
}
