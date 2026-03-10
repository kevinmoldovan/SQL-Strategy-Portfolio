/* PROJECT 01: Data Standardization & Integrity
Business Case: Preparing 2015 Scion Sales Data for Executive Reporting.
*/

WITH raw_data AS (
    -- This CTE simulates a messy raw table
    SELECT 
        TRIM(UPPER(model_name)) AS model,      -- Fixes 'frs' vs 'FRS'
        COALESCE(sale_price, 0) AS price,      -- Fills missing prices with 0
        DATE(sale_date) AS formatted_date,     -- Ensures date format is standard
        vin_number
    FROM `external_data.scion_sales_2015`
)
SELECT 
    model,
    price,
    formatted_date,
    -- Google S&O Tip: Always check for duplicates in your 'Golden Table'
    ROW_NUMBER() OVER(PARTITION BY vin_number ORDER BY formatted_date) AS entry_count
FROM raw_data
WHERE model = 'FR-S';
