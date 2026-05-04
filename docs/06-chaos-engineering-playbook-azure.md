# Azure Chaos Engineering Playbook

Chaos engineering on Azure leverages **Azure Chaos Studio** to inject controlled failures and build confidence in system resilience.

## 1. Prerequisites
-   **Observability:** Azure Monitor Dashboards and Alerts must be active.
-   **Permissions:** User must have `Chaos Studio Experiment Designer` and `Chaos Studio User` roles.
-   **Safe Deployment:** Ensure experiments are initially run in non-production environments.

## 2. Common Azure Chaos Experiments
| Experiment | Target | Failure Mode | Success Metric |
| :--- | :--- | :--- | :--- |
| **VM Shutdown** | Azure Virtual Machines | Power off random VMs in a scale set. | App remains available; VM restarts automatically. |
| **AKS Pod Kill** | AKS Cluster | Terminate random pods in a namespace. | Deployment maintains desired replica count. |
| **Network Isolation** | NSG / VNet | Deny traffic to critical subnets. | App handles timeouts or uses circuit breakers. |
| **SQL Failover** | Azure SQL Database | Trigger manual failover to secondary. | Client reconnects within the target RTO. |
| **Cosmos DB Region Fail** | Cosmos DB | Simulate regional outage. | Global distribution ensures zero data loss. |

## 3. Experiment Lifecycle with Chaos Studio
1.  **Steady State:** Latency < 100ms, Success Rate > 99.95%.
2.  **Hypothesis:** "If an AKS node pool fails, the cluster will reschedule pods to other nodes without losing requests."
3.  **Chaos Action:** `AKS Chaos Mesh - Pod Failure`.
4.  **Observe:** Monitor Application Insights for spikes in 5xx errors.
5.  **Fix:** Implement better Pod Disruption Budgets (PDB) and resource requests.

## 4. Tools
-   **Azure Chaos Studio:** Managed platform for resilience experiments.
-   **Chaos Mesh:** Integrated with AKS for container-level chaos.
-   **Gremlin:** For advanced enterprise chaos scenarios on Azure.

---

*See the [Azure Chaos Studio Experiments](../reference-implementations/azure-chaos-studio/) for template definitions.*
