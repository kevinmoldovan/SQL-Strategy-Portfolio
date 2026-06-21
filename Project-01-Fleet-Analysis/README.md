# 2015 Scion Fleet Operational Expenditure (Opex) Analysis

## Executive Summary
This project delivers a foundational relational database architecture and analytical query suite designed to audit, normalize, and track maintenance expenditures for an operational vehicle fleet. The pipeline transitions unstructured, raw service records into structural tables, enforces data normalization rules, applies conditional logic gates to clean human-entry errors, and builds chronological cost-distribution models for executive reporting.

## Business Problem & Context
Managing decentralized fleet maintenance records frequently introduces structural data anomalies, including missing entry dates, inconsistent descriptive text categories, and hidden operational "noise" from low-value inspections. 

Without a centralized data store, calculating a fleet's exact burn rate or isolating high-impact cost centers is impossible. I engineered this local database environment to establish an audit trail for a 2015 Scion FR-S fleet asset, providing leadership with clear visibility into asset depreciation and maintenance lifecycle costs.

## Data Schema & Architecture
The database layer is anchored by the `service_history` table, built using structured Data Definition Language (DDL):

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `service_id` | INT | PRIMARY KEY | Unique identifier for each maintenance event |
| `service_type` | VARCHAR(50) | NOT NULL | Category of service performed (e.g., Oil Change) |
| `cost` | INT | NOT NULL | Financial cost of the individual event (USD) |
| `service_date` | DATE | NOT NULL | Timestamp of transaction entry |

## Pipeline Architecture & File Matrix
The query suite is structured as a progressive technical sprint, moving from basic environment setup to multi-layered operational analytics:

1. **`00_setup_schema.sql`**
   * *Purpose:* Establishes the database environment, configures precise column data types, and seeds data records representing varied fleet maintenance transactions.
2. **`01_basic_audit.sql`**
   * *Purpose:* Performs baseline data discoveries to map the full footprint of the maintenance history.
3. **`02_data_normalization.sql` & `03_budget_flagging.sql`**
   * *Purpose:* Normalizes text strings and implements conditional logic gates to automatically flag or isolate specific high-priority accounts.
4. **`06_high_impact_filters.sql`**
   * *Purpose:* Deploys post-aggregation filtering via the `HAVING` clause to strip out zero-dollar "noise" (such as free safety inspections) and isolate major cost centers.
5. **`07_chronological_burn_rate.sql`**
   * *Purpose:* Uses temporal math functions (`EXTRACT`) to pull numerical month indicators from timestamps, calculating a sequential monthly operational burn rate.

## Key Strategic Insights Delivered
* **Operational Expense Drivers:** Aggregating cost centers revealed that routine mechanical maintenance (e.g., oil changes and tire rotations) drives over 90% of active capital outflows, while basic inspections contribute negligible overhead.
* **Temporal Spend Visibility:** Isolating transaction dates into chronological monthly buckets allowed the business to track sequential capital burn, highlighting specific peak maintenance cycles across Q1.

## Technical Skillset Demonstrated
* Relational Data Definition (DDL) & Data Manipulation (DML)
* Multi-Step Logical Filtering (`WHERE`, `AND`, `OR`)
* Post-Aggregation Data Filtering (`GROUP BY` & `HAVING`)
* Advanced Temporal Mathematics (`EXTRACT(MONTH FROM Column)`)
* Data Sorting & Chronological Formatting (`ORDER BY ASC/
