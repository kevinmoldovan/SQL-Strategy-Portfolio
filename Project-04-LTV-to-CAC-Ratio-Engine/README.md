# Relational Unit Economics & LTV-to-CAC Ratio Engine

## Executive Summary
This project delivers a multi-layered analytical pipeline utilizing a Common Table Expression (CTE) framework to evaluate marketing channel efficiency. By isolating initial marketing data aggregation from downstream mathematical operations, the engine calculates precise Customer Acquisition Cost (CAC) to Lifetime Value (LTV) ratios, providing the executive leadership team with a programmatic framework for capital allocation.

## Business Problem & Context
Evaluating unit economics requires dividing aggregated revenue metrics by aggregated cost metrics. Attempting to perform multi-table joins, row-level null handling, and cross-aggregate division within a single flat query structure leads to unreadable, brittle scripts that are prone to calculation errors. 

To satisfy a C-suite directive to cut underperforming ad channels (ratios below 3.0), I architected a modular pipeline that isolates aggregation logic into a virtual data layer before executing unit economic equations.

## Pipeline Architecture & File Matrix
The pipeline is contained within a high-performance script architecture:

1. **`01_unit_economics_cte.sql`**
   * *Purpose:* Builds a temporary virtual table layer (`channel_aggregates`) to compute gross channel values, then feeds those outputs into a primary calculation layer.
   * *Defensive Engineering:* Implements a float multiplier (`* 1.0`) to force decimal precision and utilizes `NULLIF()` to dynamically intercept zero-cost channels (e.g., Organic traffic), preventing production-crashing "Division by Zero" database exceptions.

## Key Strategic Insights Delivered
* **Budget Optimization Triggers:** Evaluating the exact scalar ratio revealed which channels safely exceed the corporate efficiency threshold (3.0 LTV:CAC), allowing the business to isolate and defund unsustainable acquisition loops.
* **Pipeline Resilience:** By embedding row-level data normalization directly into the relational layer, the pipeline can ingest organic or zero-cost attribution sources without requiring manual code maintenance.

## Technical Skillset Demonstrated
* Advanced Pipeline Modularization (Common Table Expressions / CTEs)
* Multi-Table Grouped Aggregations
* Relational Table Aliasing
* Defensive Mathematical Engineering (`NULLIF` Exception Interception)
* Precision Numeric Forcing (Integer-to-Decimal Manipulation)
