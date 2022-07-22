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

-- 7. Entries recorded by day of the week:
---  Sunday=1...Saturday=7
SELECT 
  CASE -- Case statement to convert a numeric date to text, such as 'Sun'... etc
  WHEN day_of_week = 1 THEN "SUN"
  WHEN day_of_week = 2 THEN "MON"
  WHEN day_of_week = 3 THEN "TUE"
  WHEN day_of_week = 4 THEN "WED"
  WHEN day_of_week = 5 THEN "THU"
  WHEN day_of_week = 6 THEN "FRI"
  WHEN day_of_week = 7 THEN "SAT"
  END AS Day, 
  entries
FROM
  ( SELECT
  EXTRACT(DAYOFWEEK FROM DATE(ActivityDate)) AS day_of_week,
  COUNT(Id) as entries
FROM
  `bellabeat-device-analysis.dailyactivity_merged.dailyActivity_merged`
GROUP BY
  day_of_week
ORDER BY
  day_of_week)
--- The results show that TUE and WED are days when our users use the device the most, SUN and MON are the days the device is used the least
  
-- 8. View daily usage by reviewing the number of hours sleeping and subtracting it by 24.
SELECT 
  CASE 
  WHEN day_week = 1 THEN "SUN"
  WHEN day_week = 2 THEN "MON"
  WHEN day_week = 3 THEN "TUE"
  WHEN day_week = 4 THEN "WED"
  WHEN day_week = 5 THEN "THU"
  WHEN day_week = 6 THEN "FRI"
  WHEN day_week = 7 THEN "SAT"
  END AS Day,
  avg_activity_day
FROM (
  SELECT
  EXTRACT(DAYOFWEEK FROM DATE(SleepDate)) AS day_week,
  ROUND((24-AVG(total_hours_sleep)),2) AS avg_activity_day -- nested query in order to find the total activity of the day
  FROM (
    SELECT
    sleep.SleepDate,
    ROUND((sleep.TotalMinutesAsleep/60),2) AS total_hours_sleep -- nested query in order to find the sleeping time recorded by our users
    FROM `bellabeat-device-analysis.dailyactivity_merged.sleepDay_merged` sleep
    LEFT JOIN `bellabeat-device-analysis.dailyactivity_merged.dailyActivity_merged` daily -- LEFT JOIN to combine Sleeping and Weight databases
    ON sleep.Id = daily.Id AND sleep.SleepDate = daily.ActivityDate
)
GROUP BY day_week
ORDER BY day_week
)
--- We've discovered that our users sleep more on weekends and register less activity.

-- 9. Daily breakdown of our users activity level throughout the day as percentages
SELECT 
ROUND((ROUND(AVG(very_active_prcnt))/84)*100,1) AS avg_very_actve_percent, -- results are divided by 84 becasue 
ROUND((ROUND(AVG(fairly_active_prcnt))/84)*100,1) AS avg_fairly_active_percent,
ROUND((ROUND(AVG(lightly_active_prcnt))/84)*100,1) AS avg_lightly_active_percent,
ROUND((ROUND(AVG(sedentary_minutes_prcnt))/84)*100,1) AS avg_sedentary_minutes_percent,
FROM (
  SELECT
  ROUND(((VeryActiveMinutes/1440)*100),2) AS very_active_prcnt,
  ROUND(((FairlyActiveMinutes/1440)*100),2) AS fairly_active_prcnt,
  ROUND(((LightlyActiveMinutes/1440)*100),2) AS lightly_active_prcnt,
  ROUND(((SedentaryMinutes/1440)*100),2) AS sedentary_minutes_prcnt,
FROM dailyactivity_merged.dailyActivity_merged 
)




