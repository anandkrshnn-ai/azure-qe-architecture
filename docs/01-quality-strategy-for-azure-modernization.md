# Quality Strategy for Azure Modernization

When migrating to Microsoft Azure, the strategy for quality engineering must adapt to the migration archetype. Rehosting a .NET monolith requires different validations than refactoring into an Azure Functions microservices architecture.

## 1. Migration Archetypes & Quality Focus

### A. Rehost (Lift & Shift)
- **Strategy:** Focus on parity and baseline performance on Azure VMs.
- **Key Validations:**
  - Connectivity & Security (VNet, NSGs).
  - Baseline Latency (On-prem vs Azure).
  - OS-level stability on Azure VMs.

### B. Replatform (Lift & Reshape)
- **Strategy:** Focus on managed service configuration and scalability.
- **Key Validations:**
  - Containerization (AKS) portability.
  - Database performance (Azure SQL / Cosmos DB) tuning.
  - Managed service integrations (Service Bus, Storage Accounts).

### C. Refactor (Cloud Native)
- **Strategy:** Focus on event-driven reliability and serverless scalability.
- **Key Validations:**
  - Cold starts and scaling (Azure Functions).
  - Event schema consistency (Event Grid).
  - Distributed tracing (Application Insights / X-Ray counterpart).
  - Resilience (Logic Apps / Durable Functions error handling).

## 2. The Azure Quality Gate Model

| Gate | Stage | Automated Tooling |
| :--- | :--- | :--- |
| **G1: Static** | IDE / Commit | Azure Policy, OPA |
| **G2: Deployment** | CI (Azure Pipelines) | Checkov, Bicep Linter |
| **G3: Functional** | CD (Azure Pipelines) | PyTest, Postman, Playwright |
| **G4: Performance** | Stage / Pre-prod | k6, Azure Load Testing |
| **G5: Resilience** | Production | Azure Chaos Studio |

## 3. Measurable Outcomes (Azure Native)
- **Defect Escape Rate:** Correlated with Azure Monitor incidents.
- **DORA Metrics:** Derived from Azure DevOps / GitHub Actions and Log Analytics.
- **Reliability SLO:** 99.9% availability measured via Azure Monitor Synthetics.

---

*See the [AKS Testing Guide](../guides/aks-testing-guide.md) for deeper technical implementation.*
