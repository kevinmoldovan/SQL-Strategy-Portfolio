-- TITLE: 2015 Scion Fleet Schema Setup
-- GOAL: Initialize the service history table for fleet Opex tracking.
-- AUTHOR: Kevin Moldovan 

CREATE TABLE service_history (
 service_id int,
 service_type varchar(50),
 cost int,
 service_date date
);

INSERT INTO service_history (service_id, service_type, cost, service_date)
VALUES 
(1, 'Oil Change', 80, '2025-01-10'),
(2, 'Tire Rotation', 50, '2025-02-15'),
(3, 'Brake Inspection', 0, '2025-03-01');
