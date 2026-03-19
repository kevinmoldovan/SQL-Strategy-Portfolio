Select 
  service_type, 
  service_date 
FROM 
  service_history
WHERE 
  cost > 0 
  and service_type = 'Oil Change';
