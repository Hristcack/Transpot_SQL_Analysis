CREATE DATABASE transport_analysis;
USE transport_analysis;

CREATE TABLE stations ( station_id INT PRIMARY KEY,
station_name VARCHAR (100),
city VARCHAR (100));

CREATE TABLE routes ( route_id INT PRIMARY KEY,
start_station_id INT,
end_station_id INT,
FOREIGN KEY (start_station_id) REFERENCES stations (station_id),
FOREIGN KEY (end_station_id) REFERENCES stations (station_id));

CREATE TABLE trips ( trip_id INT PRIMARY KEY,
route_id INT, scheduled_time INT,
actual_time INT, delayed_time INT,
trip_date DATE, 
FOREIGN KEY (route_id) REFERENCES routes (route_id));

INSERT INTO stations ( station_id, station_name, city) VALUES
(1, 'Central Station', 'Bangalore'),
(2, 'MG Road', 'Bangalore'),
(3, 'Whitefield', 'Bangalore'),
(4, 'Marathalli', 'Bangalore');

SELECT * FROM stations;

INSERT INTO routes(route_id, start_station_id, end_station_id) VALUES
(101,1,2),
(102,1,3),
(103,2,3),
(104,2,4);

SELECT * FROM routes;

ALTER TABLE trips
MODIFY scheduled_time TIME,
MODIFY actual_time TIME;

INSERT INTO trips 
(trip_id, route_id, scheduled_time, actual_time, delayed_time, trip_date) VALUES
(1001, 101, '08:00:00', '08:05:00', 5,  '2024-01-01'),
(1002, 101, '09:00:00', '09:15:00', 15, '2024-01-01'),
(1003, 102, '08:30:00', '08:50:00', 20, '2024-01-01'),
(1004, 103, '10:00:00', '10:00:00', 0,  '2024-01-01'),
(1005, 104, '11:00:00', '11:30:00', 30, '2024-01-02'),
(1006, 102, '09:30:00', '09:40:00', 10, '2024-01-02'),
(1007, 103, '12:00:00', '12:20:00', 20, '2024-01-02'),
(1008, 104, '13:00:00', '13:10:00', 10, '2024-01-02');

SELECT * FROM trips;

SELECT * FROM trips
LIMIT 5;

SELECT COUNT(trip_id) AS total_trips
FROM trips;

SELECT r.route_id,
AVG (t.delayed_time) AS avg_delay_minutes
FROM trips t
JOIN routes r
ON t.route_id=r.route_id
GROUP BY r.route_id
ORDER BY avg_delay_minutes DESC;

SELECT s.station_name,
AVG (t.delayed_time) AS avg_delayed_minutes
FROM trips t
JOIN routes r
ON t.route_id=r.route_id
JOIN stations s
ON s.station_id IN (r.start_station_id, r.end_station_id)
GROUP BY s.station_name
ORDER BY avg_delayed_minutes DESC;

DESCRIBE stations;

SELECT trip_date,
AVG(delayed_time) AS average_delayed_minutes
FROM trips
GROUP BY trip_date
ORDER BY trip_date;

SELECT HOUR(scheduled_time) AS scheduled_hour,
AVG(delayed_time) AS average_delayed_minutes
FROM trips
GROUP BY scheduled_hour
ORDER BY average_delayed_minutes DESC;



