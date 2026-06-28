SELECT 
  m.utm_source,
  SUM(m.acquisition_cost) AS total_cac,
  SUM(COALESCE(r.lifetime_spend, 0)) AS total_ltv,
  SUM(COALESCE(r.lifetime_spend, 0)) - SUM(m.acquisition_cost) AS net_margin
FROM marketing_attribution m
LEFT JOIN user_revenue r ON m.customer_id = r.customer_id
GROUP BY m.utm_source
ORDER BY net_margin DESC;
