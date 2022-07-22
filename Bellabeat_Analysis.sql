/*
SQL Queries for Bellabeat Data Analysis Case
Each specific query will be given a number, followed by the question or statement it is intended to address.
*/

-- 1. Unique individuals reporting for Daily Activity:
SELECT distinct iD
FROM dailyactivity_merged.dailyActivity_merged -- 33 unique users

-- 2. Unique individuals reporting for Weight:
SELECT distinct Id
FROM dailyactivity_merged.sleepDay_merged -- 24 unique users

-- 3. Unique individuals reporting for Sleep:
SELECT distinct iD
FROM dailyactivity_merged.weightLogInfo_merged -- 8 unique users

-- 4. Average number of calories burned for the average user:
SELECT ROUND(AVG(Calories)) AS avg_calories
FROM dailyactivity_merged.dailyActivity_merged -- 2013 Calories

-- 5. Average number of steps walked for the average user:

SELECT ROUND(AVG(TotalSteps)) AS avg_totalSteps
FROM dailyactivity_merged.dailyActivity_merged -- 7671 Steps

-- 6. Average distance (in Miles) walked by our members in a day:

SELECT ROUND(AVG(TotalDistance)) as avg_distance
FROM dailyactivity_merged.dailyActivity_merged -- 6 Miles

-- Entries by day of the week:
-- Sunday=1...Saturday=7
SELECT
  EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) AS day_of_week,
  COUNT(Id) as entries
FROM
  `bellabeat-device-analysis.dailyactivity_merged.dailyActivity_merged`
GROUP BY
  day_of_week
ORDER BY
  day_of_week




