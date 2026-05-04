# AKS Testing & Quality Guide

Azure Kubernetes Service (AKS) requires a robust quality framework to manage cluster-level configurations and application-level reliability within the Azure ecosystem.

## 1. Cluster-Level Quality (Guardrails)
-   **Azure Policy for Kubernetes:** Enforce security standards (e.g., no privileged containers) across all clusters.
-   **Microsoft Defender for Containers:** Scan for vulnerabilities and threats in real-time.
-   **Networking Validation:** Verify Azure CNI or Kubenet configuration and network policies.

## 2. Infrastructure as Code (IaC) Gates
-   **Bicep/Terraform Linting:** Use `bicep lint` or `tflint` to catch configuration errors before deployment.
-   **Drift Detection:** Monitor cluster state using Azure Resource Graph.

## 3. Application Reliability (In-Cluster)
-   **Service Mesh Quality:** If using OSM (Open Service Mesh) or Istio on AKS, validate traffic management and security policies.
-   **Auto-healing Validation:** Verify that Azure's node auto-repair works correctly during failures.
-   **Probes:** Mandatory `liveness` and `readiness` probes using Azure-native health checks.

## 4. Scalability & Performance
-   **Cluster Autoscaler:** Test that node pools scale up/down correctly based on demand.
-   **HPA Validation:** Use Azure Load Testing (based on JMeter/k6) to trigger and validate pod scaling.

---

*See [Terraform Azure Baseline](../reference-implementations/terraform-azure-baseline/) for cluster scaffolding.*
