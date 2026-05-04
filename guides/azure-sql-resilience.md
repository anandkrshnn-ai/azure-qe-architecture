# Azure SQL Resilience Guide

Ensuring database availability and performance on Microsoft Azure through rigorous resilience engineering.

## 1. High Availability (HA) Validation
-   **Failover Groups:** Trigger and measure the duration of a failover from primary to secondary region.
-   **Service Tier Scaling:** Validate that the database scales compute resources (DTU/vCore) in response to load without significant downtime.

## 2. Disaster Recovery Gates
-   **Point-in-Time Restore (PITR):** Verify the ability to restore the database to any point within the retention period.
-   **Geo-Replication:** Validate that data is correctly replicated to the secondary region with target RPO/RTO.
-   **Backup Integrity:** Monthly automated restoration of long-term retention (LTR) backups.

## 3. Performance Insights & Observability
-   **Query Performance Insight:** Analyze top SQL queries contributing to DTU/vCore utilization.
-   **Intelligent Insights:** Use built-in Azure features to identify and alert on performance regressions.
-   **Log Analytics:** Export query execution logs for automated trend analysis.

## 4. Connection Resilience
-   **Retry Logic:** Verify that application-side database drivers implement retry logic specifically for Azure SQL transient errors.
-   **Connection Pooling:** Use managed connection pooling to handle high connection churn.

---

*See [Azure Chaos Studio Experiments](../reference-implementations/azure-chaos-studio/) for the SQL failover template.*
