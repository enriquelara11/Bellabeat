# Bellabeat Data Analysis Case
*Presented by Enrique Lara*

![]([Images/Bellabeat-Logo.png)](https://github.com/enriquelara11/Bellabeat/blob/3b7042853e8e37069153f399f100250ee23e7d91/Images/Bellabeat%20Logo.png)

## Introduction
Bellabeat is a high-tech manufacturer of health-focused products for women. Urska Srsen and Sando Mur founded Bellabeat in 2013. Since then, it has experienced tremendous growth in popularity and has positioned itself as a tech-driven brand for women. The company creates some of the most beautifully crafted products for women that track many of their fitness trends. The company is able to collect activity on sleep, stress, and reproductive health which in turn have allowed Bellabeat to empower women with knowledge about their own health and habits. Currently, the company's items are offered through a growing number of retailers in addition to their own e-commerce channel on their website. The company has invested in traditional advertising but is mostly focused on digital marketing which include investments in Google Search, maintaining active Facebook and Instagram accounts, and constantly engaging with customers on Twitter. The organization wants to use analytics to expand its marketing strategy further, which will be the subject of this analysis.

### Scenario
I am currently working as a junior data analyst for Bellabeat's marketing analyst team. Our goal is to analyze users trends in order to gain insight into how people are currently utilizing their smart devices. Bellabeat's cofounder and chief creative officer, Urka Sren, thinks that by examining smart devices, we might find new ways for the business to grow. I've been tasked to give the Bellabeat executive team  my analysis and a few high-level suggestions for Bellabeat's marketing plan. The information I find will help guide the future marketing strategy of the business.

## ASK
### Business Task
We seek to understand how people utilize the bellabeat devices differently by analyzing smart device usage from a sample of customers. Using the information from the study, we wish to suggest some new opportunities for the company's growth.

### Our Stakeholders
- Marketing Analyst Team: This is my team, we are a group of data analysts that are in charge of gathering, evaluating, and driving Bellabeat's marketing strategy.
- Bellabeat Executive Team: Group of board members who will decide whether to accept the marketing team's recommendations based on their findings.
- Urška Sršen: Cofounder and Chief Creative Oﬃcer of Bellabeat.


## PREPARE
### Data
Thank you to [MÖBIUS](https://www.kaggle.com/arashnic) for providing this dataset through Kaggle.
- The dataset license has been issued to the public domain on the website Kaggle. 
- [License](https://creativecommons.org/publicdomain/zero/1.0/): CC0: Public Domain

The data is seperated into 18 distinct files, meauring the activity of 30 eligible fitbit users who consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring.

For my analysis, I opted to concentrate on three essential parts of the data: daily activity, weight, and sleep. As a result, in my study, I limited the number of files to just six. Theses are the files used:
1. dailyActivity_merged
2. dailyCalories_merged
3. dailySteps_merged
4. hourlyCalories_merged
5. sleepDay_merged
6. weightLogInfo_merged

ROCCC Method to determine credibility and integrity
- Reliability: The data has been provided by Amazon Mechanical Turk, a site owned by Amazon, Inc. It is a legitimate crowdsourcing platform for businesses. However there are many problems with the data inlcuding the relatively small sample size. We concluded that the data is **NOT** reliable for our analysis.
- Originality: Because the datasets for this investigation were given by Amazon Mechanical Turks, it exhibits **low** levels of originality.
- Comprehensiveness: Many of the datasets used in this study were challenging to understand. There is context missing from many of the variables within our files. We concluded that the level of comprehesivess is **Poor**.
- Current: The data is from 2016. This information appears to be obsolete. We strongly advise using more recent data.
- Cited: There is **NO** citation for these datasets.

### Limits of our data
- Small Sample Size: Our analysis consistently show that our datsets are made up of small sample sizes. For instance, our weight datafile contains only 8 unique individuals. To further understand our results, a larger sample size is advised.
- Missing Context: It was challenging to explore the datasets because many of our variables lacked context. Calories for example were assumed to be burned, but could be easily confused as calories consumed, there is no clear explanation. 
- Outliers: In our analysis, there was a disproportionate number of outliers. We found that many daily activity reports had a significant percentage of idleness and no calories recorded. We may safely presume that they were dormant devices, but there were others that were less obvious.


## PROCESS
### Tools
After carefully examining our data, the preferred methods chosen for analysis were SQL and Excel. We used Tableau to make a dashboard and visualize our results. A presentation with a professional appearance that could be shared with others was made using Google Slides.

### Cleaning the Data
- Using Excel, deleted all duplicate and blank values from our datasets.
- Using Excel, we chose six data files and carefully screened out any outliers that would present bias in our results.
- Dates were also formatted in standard YYYY-MM-DD for SQL.


## ANALYZE
To get a better understanding of how our consumers are already utilizing their devices, we choose to look at three major health trends those being daily activity, body weight, and sleep. We loaded the datasets into Google BigQuery and proceeded to examine each dataset separately or together using a JOIN clause in SQL.

### The Impact of Everyday Activity
Daily activity is vital for our analysis since it allows us to find patterns in our users behavior throughout the day.

### The Importance of Weight
Weight is an important consideration since we feel fitness is one of the primary reasons our consumers will utilize the product. In our investigation, we hope to confirm this hypothesis and build a service around it.

### Prioritizing Sleep
We feel sleep is an essential component because we can determine whether we need to expand our services to accommodate individuals' sleeping habits, and we may be able to determine whether the user receives useful information from such service.


## SHARE 
- All SQL Queries used are availble in [Bellabeat_sql](https://github.com/enriquelara11/Bellabeat/blob/main/Bellabeat_Analysis.sql)
- A Presention made using Google Slides can be found in this [Link](https://github.com/enriquelara11/Bellabeat/blob/main/Bellabeat%20Data%20Analysis%20Presentation.pdf)
- Public Tableau Dashboard is Coming Soon!


## ACT
Based on our analysis, we feel our marketing team should consider these three recommendations.

1. Begin by focusing on the users' well-being. We should ensure that everything we do is geared towards making sure the customer has the best possible experince from our products. By emphasizing the value of the user, we may encourage engagement among our members in the hopes of expanding the service without spending large sums on marketing. 
2. Developing  a wellness program for members within the Bellabeat app, in our analysis we observed that users wear the devices in order to gain insight into their health. We may include a reminder for simple actions, such as taking a specific amount of steps or running the last mile.  Users who need motivation to take charge of their health may benefit from a weight loss option that could be included in our 
3. Focus on sleep. Our observations show that when a person sleeps for 7-8 hours, he or she is considerably more engaged in everyday tasks. We might give a colorful daily statistic that could be readily shared on social media to remind people of the necessity of getting enough sleep. This is a form of free marketing for Bellabeat. By concentrating on sleep, we are able to provide results for our users, which may generate results for us in the long run.


Thank you for taking the time to evaluate my project; I had a great time working on it and hope you appreciate it as much as I did! 😁📊


