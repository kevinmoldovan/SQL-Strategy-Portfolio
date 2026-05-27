 /* PROJECT: 2015 Scion Fleet Opex Analysis
FILE: 03_budget_flagging.sql
PURPOSE: Conditional logic for expense categorization.
DATA SOURCE: service_history
*/

SELECT
    service_type,
    cost,
    CASE 
        WHEN cost > 60 THEN 'Major Expense'
        ELSE 'Minor Expense'
    END AS expense_tier
FROM 
    service_history;
