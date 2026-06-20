# B2B SaaS Subscription Revenue & Operational Health Engine

## Executive Summary
This repository contains an end-to-end relational data pipeline designed to transform raw, unstructured B2B SaaS account logs into a production-ready financial reporting layer. The core engine sanitizes human-entered contract data, constructs dynamic revenue tier segmentations, isolates churn risk, and aggregates high-level KPIs required for executive decision-making and board-level reporting.

## Business Problem & Context
The executive leadership team tracked customer acquisition and subscription statuses through decentralized, flat-file logs. This manual tracking resulted in data casing discrepancies, an inability to accurately isolate active Monthly Recurring Revenue (MRR) from historical contract values, and zero visibility into chronological churn vectors. 
As the sole operations leader, I architected a centralized database schema and analytics engine to calculate real-time financial exposure, segment the client portfolio into actionable support cohorts, and pinpoint revenue leakage across product tiers.

## Data Schema & Architecture
The underlying data layer is built on a structured ledger (`subscription_ledger`) capturing transactional client profiles:

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `account_id` | INT | PRIMARY KEY | Unique identifier for corporate accounts |
| `company_name` | VARCHAR(100) | NOT NULL | Registered name of the business entity |
| `monthly_revenue` | INT | NOT NULL | Recurring monthly contract value (USD) |
| `subscription_tier` | VARCHAR(50) | NOT NULL | Product tier (Starter, Professional, Enterprise) |
| `signup_date` | DATE | NOT NULL | Sequential contract execution date |
| `account_status` | VARCHAR(20) | NOT NULL | Operational status (Active, Churned) |

## Pipeline Architecture & File Matrix
The analytical framework is decoupled into a 4-stage sequential execution model:

1. **`01_database_setup.sql`**
   * *Purpose:* Initializes the infrastructure environment, establishes data integrity constraints, and seeds the ledger with messy, real-world customer baseline records.
2. **`02_mrr_segmentation.sql`**
   * *Purpose:* Implements conditional logic gates to automatically categorize accounts into strategic portfolio cohorts (`Enterprise Support`, `Mid-Market Premium`, `Self-Serve Standard`) and engineering active contract values.
3. **`03_executive_dashboard.sql`**
   * *Purpose:* Deploys nested conditional aggregations to compress operational rows into single-line executive health metrics: Total Booked MRR, True Active Contract Value, and Active Customer Volume.
4. **`04_churn_and_cohort_trends.sql`**
   * *Purpose:* Combines defensive string normalization (`LOWER`), temporal month extraction, and multi-column grouping to pinpoint exact cash leakage volumes across product tiers over time.

## Key Strategic Insights Delivered
* **Portfolio Concentration:** While the Enterprise tier drives the vast majority of gross booked contract volume, it represents the single point of failure for systemic operational churn.
* **Contract Value Distortion:** Simple averages skew executive runway projections. Utilizing defensive aggregate filtering revealed the true average active contract value (ACV) sits safely at $102.50 across our surviving client base.
* **Data Sanitization:** Implemented upstream string normalization to protect financial reporting models from manual entry irregularities (e.g., resolving capitalized text anomalies).

## Technical Skillset Demonstrated
* Relational Schema Design & Data Seeding
* Defensive String Manipulation & Normalization
* Conditional Logic Gates (`CASE WHEN`)
* Conditional Aggregations (Nesting logic within `SUM`, `AVG`, `COUNT`)
* Temporal Component Extraction (`EXTRACT`)
* Post-Aggregation Filtering (`HAVING`)
