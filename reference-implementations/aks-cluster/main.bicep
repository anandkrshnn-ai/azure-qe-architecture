// Azure Kubernetes Service (AKS) with Quality & Resilience
// Defines a production-grade cluster with monitoring and chaos studio integration.

param location string = resourceGroup().location
param clusterName string = 'aks-qe-prod'

resource aksCluster 'Microsoft.ContainerService/managedClusters@2022-07-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: clusterName
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: 3
        vmSize: 'Standard_DS2_v2'
        osType: 'Linux'
        mode: 'System'
        availabilityZones: [
          '1'
          '2'
          '3'
        ]
        tags: {
          'chaos-experiment': 'enabled'
        }
      }
    ]
    addonProfiles: {
      omsagent: {
        enabled: true
        config: {
          logAnalyticsWorkspaceResourceID: logAnalyticsWorkspace.id
        }
      }
    }
    networkProfile: {
      networkPlugin: 'azure'
      loadBalancerSku: 'standard'
    }
  }
}

resource logAnalyticsWorkspace 'Microsoft.Insights/workspaces@2021-06-01' = {
  name: '${clusterName}-logs'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
