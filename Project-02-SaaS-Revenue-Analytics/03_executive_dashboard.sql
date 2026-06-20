SELECT
  SUM(monthly_revenue) AS total_booked_mrr, 
  ROUND(AVG(CASE WHEN account_status = 'active' THEN monthly_revenue END), 2) AS avg_active_acv,  
  COUNT(CASE WHEN account_status = 'active' THEN 1 END) AS active_customer_count
FROM subscription_ledger;
