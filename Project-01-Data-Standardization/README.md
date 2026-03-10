# Project 01: Data Standardization for Scion Fleet Analysis

## The Business Problem
The Strategy team received a messy export of 2015 Scion FR-S sales data. 
Inconsistent naming (e.g., 'fr-s' vs 'FR-S') and missing price values 
were skewing the Total Revenue KPIs by ~5%.

## The Technical Solution
I developed a SQL script to create a **"Golden Table"** for reporting:
* **Data Cleaning:** Used `TRIM` and `UPPER` to standardize model naming.
* **Null Handling:** Used `COALESCE` to ensure missing price values didn't break sum functions.
* **Integrity Check:** Implemented a Window Function (`ROW_NUMBER`) to identify duplicate VIN entries.

## The Strategic Result
Standardizing this data allows for an accurate calculation of the 2015 
market share, ensuring the "Top-Down" strategy is based on clean inputs.
