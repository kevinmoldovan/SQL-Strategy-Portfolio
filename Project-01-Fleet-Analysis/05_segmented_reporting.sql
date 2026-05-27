/* PROJECT: 2015 Scion Fleet Opex Analysis
FILE: 05_segmented_reporting.sql
PURPOSE: Bucket fleet expenditure and volume metrics strictly by service categories.
DATA SOURCE: service_history
*/

SELECT 
    service_type, 
    SUM(cost) AS total_cost, 
    COUNT(*) AS occurrences
FROM 
    service_history
GROUP BY 
    service_type
ORDER BY 
    total_cost DESC;
