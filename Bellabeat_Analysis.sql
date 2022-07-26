/*
SQL Queries for Bellabeat Data Analysis Case
Each specific query will be given a number, followed by the question or statement it is intended to address.
*/

/*
DAILY ACTIVITY
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
ROUND((ROUND(AVG(very_active_prcnt))/84)*100,1) AS avg_very_actve_percent, -- results are divided by 84 becasue it was the initial sum of the different activities
ROUND((ROUND(AVG(fairly_active_prcnt))/84)*100,1) AS avg_fairly_active_percent,
ROUND((ROUND(AVG(lightly_active_prcnt))/84)*100,1) AS avg_lightly_active_percent,
ROUND((ROUND(AVG(sedentary_minutes_prcnt))/84)*100,1) AS avg_sedentary_minutes_percent,
FROM (
  SELECT
  ROUND(((VeryActiveMinutes/1440)*100),2) AS very_active_prcnt, -- divided by 1440 because that is the total number of minutes in a day
  ROUND(((FairlyActiveMinutes/1440)*100),2) AS fairly_active_prcnt,
  ROUND(((LightlyActiveMinutes/1440)*100),2) AS lightly_active_prcnt,
  ROUND(((SedentaryMinutes/1440)*100),2) AS sedentary_minutes_prcnt,
FROM dailyactivity_merged.dailyActivity_merged 
)
/*
Very Active = 1.2%, Fairly Active = 1.2%, Lightly Active = 15.5%, Sedentary = 82.1%. 
We find that users on average spend most of their days in a sedentary state of activity. 
*/

-- 10. Relationship between Calories and Total Steps:
SELECT
  TotalSteps, 
  Calories
FROM `bellabeat-device-analysis.dailyactivity_merged.dailyActivity_merged`
WHERE Calories > 400 AND TotalSteps > 500 -- Filtering out anybody burning less than 400 and TotalSteps under 500. These results could skew our results. 
--- The more steps taken, the more calories burned by the user.

/*
WEIGHT
*/
-- 11. Average weight recorded by our users:
SELECT
  ROUND(avg(WeightPounds)) as avg_weight_recorded
FROM
  `bellabeat-device-analysis.dailyactivity_merged.weightLogInfo_merged` -- 159 is the average weight (in lbs)

-- 12. AVG BMI(Body Mass Index) for our users

SELECT ROUND(AVG(BMI),1) as avg_bmi
FROM `bellabeat-device-analysis.dailyactivity_merged.weightLogInfo_merged` -- 25.2 is the average BMI

-- 13. What is the relationship between different sedentary levels and weight?
SELECT DISTINCT
  weight.WeightPounds,
  daily.SedentaryMinutes
FROM `bellabeat-device-analysis.dailyactivity_merged.weightLogInfo_merged` weight
LEFT JOIN `bellabeat-device-analysis.dailyactivity_merged.dailyActivity_merged`daily
ON weight.Id = daily.Id AND weight.Date_2 = daily.ActivityDate -- in order to avoid repeated rows we added a second condition
/*
We converted the results from SQL to Excel and divided the sedentary levels into three groups before calculating the average weight of each.
We noticed that people who engage in more sedentary behavior tend to weigh more than others.
*/
-- 14. Relationship between total steps and weight recorded:
SELECT DISTINCT -- return distinct values for weight and total in order to avoid repeated rows 
  weight.WeightPounds,
  steps.TotalSteps
FROM `bellabeat-device-analysis.dailyactivity_merged.weightLogInfo_merged` weight
LEFT JOIN `bellabeat-device-analysis.dailyactivity_merged.dailySteps_merged` steps -- LEFT JOIN used to combine the results from daily_activity with weight
ON weight.Id = steps.Id
--- We find that in general the higher weight a user records, the less steps they will take. 

-- 15. What is the AVG amount of time spent sleeping / spent in bed total / time spent in bed not sleeping? 
SELECT
  ROUND(avg(TotalMinutesAsleep/60),1) AS avg_time_sleep_hrly, -- avg time spent in bed sleeping
  ROUND(avg(TotalTimeInBed/60),2) AS avg_time_bed_hrly, -- avg time spent in bed total
  ROUND(avg(TotalTimeInBed) - avg(TotalMinutesAsleep)) AS time_bed_aftersleep -- avg time spent in bed not sleeping
FROM
  `bellabeat-device-analysis.dailyactivity_merged.sleepDay_merged`
  /*
   7 hours spent sleeping
   7.64 hours spent in bed = 7:38 minutes
   38 minutes spent in bed, not sleeping
  */

-- 16. Sleep patterns throughout the week: 
--Sleep
--- What day of the week do users sleep the most?
--- 1=Sunday, 7=Sat
SELECT 
  CASE 
    WHEN SleepDate = 1 THEN "SUN"
    WHEN SleepDate = 2 THEN "MON"
    WHEN SleepDate = 3 THEN "TUE"
    WHEN SleepDate = 4 THEN "WED"
    WHEN SleepDate = 5 THEN "THU"
    WHEN SleepDate = 6 THEN "FRI"
    WHEN SleepDate = 7 THEN "SAT"
    END AS DAY, 
    total_hours_sleep
FROM (
  SELECT
  EXTRACT(DAYOFWEEK FROM DATE(SleepDate)) AS SleepDate, -- Extracting the numeric day of the week from Date, Sun = 1... Sat = 7
  ROUND(avg(TotalMinutesAsleep/60),2) AS total_hours_sleep, -- Converting Total Minutes Asleep to Total Hours Asleep
  FROM
  `bellabeat-device-analysis.dailyactivity_merged.sleepDay_merged`
  GROUP BY
  SleepDate 
  ORDER BY
  total_hours_sleep DESC 
 )
 --- Users spend 7hrs on average sleeping, SUN and WED is the day that users record the most sleep while getting the least amount on TUES and THU
 
 -- 17. The impact of sleep on daily activity:
SELECT
  ROUND((sleep.TotalMinutesAsleep/60),2) AS Hours_Sleep, 
  daily.FairlyActiveMinutes, 
  daily.LightlyActiveMinutes, 
  daily.VeryActiveMinutes, 
  daily.SedentaryMinutes
FROM `bellabeat-device-analysis.dailyactivity_merged.sleepDay_merged` sleep
LEFT JOIN `bellabeat-device-analysis.dailyactivity_merged.dailyActivity_merged` daily
ON sleep.Id = daily.Id AND sleep.SleepDate = daily.ActivityDate
/* 
for the following activity we decided to focus on sedentary and lightly active minutes and their relationship to sleep
We discovered that when people sleep around 7-8 hours, they have the highest amount of energy levels for both sedentary and lightly active 
we also discovered that the user's daily activity decreases significantly depending on how much or how little they sleep.
*/
 
 
  
