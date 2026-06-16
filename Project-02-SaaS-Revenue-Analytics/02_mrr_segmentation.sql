/* PROJECT: SaaS Revenue Analytics
FILE: 02_mrr_segmentation.sql
PURPOSE: implement revenue cohort segmentation and active mrr flags
DATA SOURCE: service_history
*/

SELECT 
  company_name, 
  monthly_revenue, 
  account_status, 
  Case 
    When monthly_revenue > 500 then 'Enterprise Support'
    When monthly_revenue between 100 and 500 then 'Mid-Market Premium'
    Else 'Self-Serve Standard'
  End as revenue_cohort,
  Case
    When account_status = 'active' then monthly_revenue
    Else 0
  End as active_mrr_flag
From subscription_ledger;
