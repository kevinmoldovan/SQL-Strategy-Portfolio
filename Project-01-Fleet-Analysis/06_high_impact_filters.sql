/* PROJECT: 2015 Scion Fleet Opex Analysis
FILE: 06_high_impact_filters.sql
PURPOSE: Isolate high-impact maintenance categories by filtering post-aggregation cost totals.
DATA SOURCE: service_history
*/

SELECT
    service_type,
    SUM(cost) AS total_cost
FROM 
    service_history
GROUP BY 
    service_type
HAVING 
    SUM(cost) > 20;
