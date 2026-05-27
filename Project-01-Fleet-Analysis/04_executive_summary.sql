/* PROJECT: 2015 Scion Fleet Opex Analysis
FILE: 04_executive_summary.sql
PURPOSE: Aggregate table rows into top-line business metrics for executive evaluation.
DATA SOURCE: service_history
*/

SELECT
    SUM(cost) AS total_spend,
    ROUND(AVG(cost), 2) AS average_service_cost,
    COUNT(*) AS service_count
FROM 
    service_history;
