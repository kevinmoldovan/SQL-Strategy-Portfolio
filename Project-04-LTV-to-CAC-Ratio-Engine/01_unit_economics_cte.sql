WITH channel_aggregates AS (
  SELECT 
    m.utm_source,
    SUM(m.acquisition_cost) AS total_cac,
    SUM(COALESCE(r.lifetime_spend, 0)) AS total_ltv
  FROM marketing_attribution m
  LEFT JOIN user_revenue r ON m.customer_id = r.customer_id
  GROUP BY m.utm_source
)
SELECT 
  utm_source,
  -- Force decimal division for precise ratios
  (total_ltv * 1.0) / NULLIF(total_cac, 0) AS ltv_cac_ratio
FROM channel_aggregates
ORDER BY ltv_cac_ratio DESC;
