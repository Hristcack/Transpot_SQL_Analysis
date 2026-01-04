## Transport SQL Analysis – Route & Delay Insights
This project analyzes transportation trip data to understand route performance, delays, and operational trends using SQL.  
The goal is to demonstrate strong fundamentals in database design, joins, aggregations, and analytical querying.
The dataset was structured manually to simulate a real-world transport system with stations, routes, and trips.
The database consists of three related tables:
## Stations
- station_id (Primary Key)
- station_name
- city
## Routes
- route_id (Primary Key)
- start_station_id (Foreign Key → stations)
- end_station_id (Foreign Key → stations)
## Trips
- trip_id (Primary Key)
- route_id (Foreign Key → routes)
- scheduled_time
- actual_time
- delayed_time
- trip_date
## Key SQL Concepts Used
- CREATE DATABASE & CREATE TABLE
- Primary Key & Foreign Key constraints
- INSERT statements with referential integrity
- INNER JOIN across multiple tables
- Aggregations using COUNT, AVG
- GROUP BY and ORDER BY
- Date and time-based analysis
## Key Analysis Performed
- Identified most delayed routes.
- Calculated average delay per route.
- Compared scheduled vs actual travel time.
- Analyzed city-level delay trends.
- Evaluated route performance efficiency.
## Business Insights
- Certain routes consistently show higher delays, indicating possible congestion or operational bottlenecks.
- City-level analysis helps identify regions with recurring delay patterns.
- Average delay metrics can support data-driven decisions for route optimization.


  
