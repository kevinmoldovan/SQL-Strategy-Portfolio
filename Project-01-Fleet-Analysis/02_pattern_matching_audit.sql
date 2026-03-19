/* PROJECT: 2015 Scion Fleet Analysis
FILE: 02_pattern_matching_audit.sql
PURPOSE: Use case-insensitive pattern matching to identify 'Tire' related maintenance events.
DATA SOURCE: service_history
*/

SELECT 
    * FROM 
    service_history 
WHERE 
    LOWER(service_type) LIKE 't%';
