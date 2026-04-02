/* PROJECT: 2015 Scion Fleet Opex Analysis
FILE: 01_basic_audit.sql):
PURPOSE:implement basic cost filtering for maintenance audit
DATA SOURCE: service_history
*/

Select 
  service_type, 
  service_date 
FROM 
  service_history
WHERE 
  cost > 0 
  and service_type = 'Oil Change';
