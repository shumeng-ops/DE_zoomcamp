--setup
CREATE OR REPLACE EXTERNAL TABLE `data-engineer-413104.de2024.hw3_green_2022_external`
  OPTIONS (
    format ="parquet",
    uris = ["gs://2024de/hw3_green_2022"]
    );
-- Q1
SELECT count(*) as row_count FROM `data-engineer-413104.de2024.hw3_green_2022_external` ;

--Q2
SELECT count(DISTINCT PULocationID) FROM `data-engineer-413104.de2024.hw3_green_2022_native`;

SELECT count(DISTINCT PULocationID) FROM `data-engineer-413104.de2024.hw3_green_2022_external`;

--Q3
select count(*) from `data-engineer-413104.de2024.hw3_green_2022_native`
where fare_amount = 0;

--Q4
CREATE OR REPLACE TABLE `data-engineer-413104.de2024.hw3_green_2022_native_partitioned`
PARTITION BY
  DATE(lpep_pickup_datetime) 
  CLUSTER BY PUlocationID  AS
SELECT * FROM `data-engineer-413104.de2024.hw3_green_2022_native`;

--Q5

SELECT COUNT (DISTINCT PULocationID) FROM `data-engineer-413104.de2024.hw3_green_2022_native`
WHERE lpep_pickup_datetime BETWEEN '2022-06-01' AND '2022-06-30';

SELECT COUNT (DISTINCT PULocationID) FROM `data-engineer-413104.de2024.hw3_green_2022_native_partitioned`
WHERE lpep_pickup_datetime BETWEEN '2022-06-01' AND '2022-06-30';

-- Q8
SELECT count(*) FROM `data-engineer-413104.de2024.hw3_green_2022_native`;