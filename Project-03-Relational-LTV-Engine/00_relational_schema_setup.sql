CREATE TABLE marketing_attribution (
  customer_id INT PRIMARY KEY,
  utm_source VARCHAR(50),
  acquisition_cost INT
);

CREATE TABLE user_revenue (
  customer_id INT PRIMARY KEY,
  lifetime_spend INT
);

INSERT INTO marketing_attribution
VALUES
  (101, 'Google', 50),
  (102, 'LinkedIn', 120),
  (103, 'Organic', 0),
  (104, 'Twitter', 30);

INSERT INTO user_revenue
VALUES
  (101, 400),
  (102, 600),
  (103, 50); 
