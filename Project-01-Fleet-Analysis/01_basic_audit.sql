Select service_type, 
  service_date 
  from service_history
  where cost > 0 and service_type = 'Oil Change';
