Select
  LOWER(subscription_tier) as subscription_tier,
  EXTRACT (MONTH from signup_date) as signup_month,
  SUM(CASE WHEN account_status = 'churned' then monthly_revenue else null END) as churned_mrr
FROM subscription_ledger
GROUP BY
  LOWER(subscription_tier),
  EXTRACT(MONTH FROM signup_date)
ORDER BY 2 ASC; 
