/* PROJECT: 2015 Scion Fleet Opex Analysis
FILE: 07_chronological_burn_rate.sql
PURPOSE: Extract monthly temporal components to analyze chronological expenditure trends.
DATA SOURCE: service_history
*/

SELECT
    EXTRACT(MONTH FROM service_date) AS service_month,
    SUM(cost) AS monthly_spend
FROM
    service_history
GROUP BY
    EXTRACT(MONTH FROM service_date)
ORDER BY
    service_month ASC;
