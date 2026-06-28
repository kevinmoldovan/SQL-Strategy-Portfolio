SELECT 
  marketing_attribution.customer_id, 
  marketing_attribution.utm_source, 
  marketing_attribution.acquisition_cost, 
 user_revenue.lifetime_spend
FROM marketing_attribution
INNER JOIN user_revenue
ON marketing_attribution.customer_id = user_revenue.customer_id;
