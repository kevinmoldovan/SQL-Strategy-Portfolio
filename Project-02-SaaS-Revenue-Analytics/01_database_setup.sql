CREATE TABLE subscription_ledger (
    account_id int PRIMARY KEY,
    company_name varchar(100),
    monthly_revenue int,
    subscription_tier varchar(50),
    signup_date date,
    account_status varchar(20)
);

Insert into subscription_ledger 
Values
    (101, 'Acme Corp', 50, 'starter', '2026-01-15', 'active'),
    (102, 'NexaTech', 150, 'professional', '2026-01-20', 'active'),
    (103, 'Apex Group', 1200, 'ENTERPRISE', '2026-02-10', 'churned'),
    (104, 'Horizon Labs', 150, 'professional', '2026-02-22', 'active'),
    (105, 'Vanguard LLC', 60, 'starter', '2026-03-05', 'active');
