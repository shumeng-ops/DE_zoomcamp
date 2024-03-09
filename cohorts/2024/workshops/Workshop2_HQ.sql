    
### Q1 
    
    CREATE MATERIALIZED VIEW q1_avg_trip_time AS
    SELECT a.zone as pu_zone, b.zone as do_zone,
    avg(tpep_dropoff_datetime - tpep_pickup_datetime) as avg_trip_time
    FROM
        trip_data
            JOIN taxi_zone a
                 ON trip_data.pulocationid = a.location_id
            Join taxi_zone b
                ON trip_data.dolocationid = b.location_id
    GROUP BY a.zone, b.zone;

### Q2
    CREATE MATERIALIZED VIEW q2_avg_trip_time AS
    SELECT a.zone as pu_zone, b.zone as do_zone,
    count(*) as trip_count,
    avg(tpep_dropoff_datetime - tpep_pickup_datetime) as avg_trip_time
    FROM
        trip_data
            JOIN taxi_zone a
                 ON trip_data.pulocationid = a.location_id
            Join taxi_zone b
                ON trip_data.dolocationid = b.location_id
    GROUP BY a.zone, b.zone;

### Q3
CREATE MATERIALIZED VIEW q3 AS
WITH max_putime AS (
    SELECT MAX(tpep_pickup_datetime) AS max_time
    FROM trip_data
)
SELECT taxi_zone.zone, COUNT(*) 
FROM trip_data
JOIN taxi_zone ON trip_data.pulocationid = taxi_zone.location_id
CROSS JOIN max_putime
WHERE trip_data.tpep_pickup_datetime > max_putime.max_time - INTERVAL '17 hours'
GROUP BY taxi_zone.zone;





