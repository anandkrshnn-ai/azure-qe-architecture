# Performance Engineering Framework for Azure

Modern cloud applications on Microsoft Azure require performance to be engineered into the architecture using Azure-native tools and Infrastructure as Code (Bicep/Terraform).

## 1. The Performance Engineering Lifecycle
1.  **Define NFRs:** Use the [NFR Spec Template](../templates/nfr-spec-template.md) to define latency (P95/P99), throughput (TPS), and concurrency.
2.  **Establish Baselines:** Use **Azure Monitor Application Insights** to identify baseline latencies for Azure Functions and AKS services.
3.  **Continuous Validation:** Integrate **Azure Load Testing** (JMeter/k6 based) into **Azure Pipelines**.
4.  **Analyze & Tune:** Use **Log Analytics** and **Azure Advisor** to right-size resources.

## 2. Load Testing Strategy
-   **Serverless Load Tests:** Test Azure Functions scaling behavior and cold start impact.
-   **AKS Scaling Tests:** Verify cluster autoscaler node provisioning speed.
-   **Azure SQL Stress Tests:** Validate performance under high DTU/vCore utilization and read-heavy workloads.
-   **Global Stress Tests:** Use **Azure Front Door** and cross-region load tests for managed large-scale simulations.

## 3. Azure Performance Tuning Checklist
-   **Azure Functions:** Consumption plan vs Premium plan scaling, cold start mitigation.
-   **AKS:** Node pool configuration, Pod resource requests/limits, Azure CNI performance.
-   **Azure SQL:** Scaling DTUs/vCores, Read Scale-Out, and Query Performance Insight.
-   **Storage Account:** Throughput limits and latency optimization for blob/file storage.

## 4. Pass/Fail Criteria (Quality Gates)
-   `P95 Latency < target_ms`
-   `Functions Cold Start < 800ms` for critical paths.
-   `Request Success Rate > 99.9%` during peak load.

---

*See the [k6 Performance Tests](../reference-implementations/k6-azure/) for executable examples.*
