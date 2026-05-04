# Test Strategy Template - Azure Modernization

## 1. Program Overview
*   **Project Name:** [e.g., Azure Migration Phase 1]
*   **Goal:** [e.g., Replatforming .NET API to AKS]
*   **Success Metrics:** [e.g., < 0.5% defect escape rate]

## 2. Azure-Specific Test Levels
| Level | Type | Tooling | Responsibility |
| :--- | :--- | :--- | :--- |
| **IaC** | Static Analysis | Checkov / Bicep Linter | DevOps / Dev |
| **Unit** | Code Logic | PyTest / xUnit | Developers |
| **Integration** | Service Integration | Azurite / TestContainers | QE / Dev |
| **Performance** | Load/Stress | k6 / Azure Load Testing | Performance Eng |
| **Resilience** | Chaos | Azure Chaos Studio | SRE / QE |
| **Security** | DAST/SCA | Defender for Cloud / Snyk | SecOps |

## 3. Deployment Environments
-   **Sandbox:** Individual developer subscriptions.
-   **Dev/QA:** Shared resource groups for integration.
-   **Stage:** Production mirror for load and chaos testing.
-   **Prod:** Production with slot-based canary releases.

## 4. Automated Quality Gates
-   [ ] **Static:** Bicep lint passes with zero "High" violations.
-   [ ] **Functional:** 100% of critical path tests pass in Azure Pipelines.
-   [ ] **Performance:** P95 latency within 800ms in Stage.
-   [ ] **Observability:** App Insights dashboards active and healthy.

## 5. Defect Management
-   **Tracking:** Azure DevOps / GitHub Issues.
-   **SLA:** Critical bugs resolved within 4 hours (P0).

---
*Approver:* ____________________ (QE Architect)
