# Bellabeat Data Analysis Case
*Presented by Enrique Lara*

## Introduction
Bellabeat is a high-tech maufacturer of health-focused products for women. Urška Sršen and Sando Mur founded Bellabeat in 2013. Since then, it has experienced tremendous growth in popularity and has positioned itself as a tech-driven brand for women. The company creates some of the most beautifully crafted products for women that track many of their fitness trends. The company is able to collect activity on sleep, stress, and reproductive health which in turn have allowed Bellabeat to empower women with knowledge about their own health and habits. Currently, the company's items are offered through a growing number of retailers in addition to their own e-commerce channel on their website. The company has invested in traditional advertising but is mostly focused on digital marketing which include investments in Google Search, active Facebook and Instagram accounts, and constantly engaging with customers on Twitter. The organization wants to use analytics to expand its marketing strategy further, which will be the subject of this research.

### Scenario
I am currently working as a junior data analyst for Bellabeat's marketing analyst team. Our goal is to analyze users trends in order to gain insight into how people are currently utilizing their smart devices. Bellabeat's cofounder and chief creative officer, Urka Sren, thinks that by examining smart devices, we might find new ways for the business to grow. I've been tasked to give the Bellabeat executive team  my analysis and a few high-level suggestions for Bellabeat's marketing plan. The information I find will help guide the future marketing strategy of the business.

## ASK
### Business Task
We seek to understand how people utilize the bellabeat devices differently by analyzing smart device usage from a sample of customers. Using the information from the study, we wish to suggest some new opportunities for the company's growth.

### Our Stakeholders
- Marketing Analyst Team: My team, this is a group of data analysts that are in charge of gathering, evaluating, and driving Bellabeat's marketing strategy.
- Bellabeat Executive Team: Team who will decide whether to accept the marketing team's recommendations.
- Urška Sršen: Cofounder and Chief Creative Oﬃcer of Bellabeat.


## PREPARE
### Data
Thank you to MÖBIUS [LINK TO HIS PROFILE] for providing this dataset through Kaggle.
- The dataset license has been issued to the public domain on the website Kaggle. 
- License [LICENSE LINK]: CC0: Public Domain

The data is seperated into 18 distinct files, meauring the activity of 30 eligible fitbit users who consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring.

For my analysis, I opted to concentrate on three essential parts of the data: daily activity, weight, and sleep. As a result, in my study, I limited the number of files to just six. The following are the files used:
1. dailyActivity_merged
2. dailyCalories_merged
3. dailySteps_merged
4. hourlyCalories_merged
5. sleepDay_merged
6. weightLogInfo_merged

ROCCC Method to determine credibility and integrity
- Reliability: The data has been provided by Amazon Mechanical Turk, a site owned by Amazon, Inc. It is a legitimate crowdsourcing platform for businesses. However there are many problems with the data inlcuding the relatively small sample size. We concluded that the data is **NOT** reliable for our analysis.
- Originality: Because the datasets for this investigation were given by Amazon Mechanical Turks, they exhibit **low** levels of originality.
- Comprehensiveness: Many of the datasets used in this investigation were difficult to grasp at times. There is context missing from many of the factors within our files. We concluded that the level of comprehesivess is **Poor**.
- Current: The data is from 2016. This information appears to be obsolete. We strongly advise using more recent data.
- Cited: There is **NO** citation for these datasets.

### Limits of our data
- Small Sample Size: Our analysis consistently show that our samples are made up of small sample sizes. In our weight datafile, for example, there are just 8 distinct individuals. A higher sample size would be recommended to have a better grasp of our findings.
- Missing Context: Exploring the datasets was hard since many of our variables lacked context. Calories for example were assumed to be burned, but could also be easily confused as calories consumed, there is no clear explanation. 
- Outliers: In our analysis, there were a disproportionate number of outliers. We noticed that many entries for daily activity recorded no calories and a high number of inactivity. It was safe for us to assume that these were inactive devices, but there were others that were less obvious.


## PROCESS
### Tools
After close examination of our data, SQL and Excel were chosen as the preffered method for analyzing. Tableau would be used to create a dashboard and visualize our results. Google slides would also be used to create a presentation that could eaisly be shared.

### Cleaning the Data
- Using Excel, deleted all duplicate and blank values from our datasets
- Using Excel, we chose six data files and carefully screened out any outliers that would present bias our results
- Dates were also formatted in standard YYYY-MM-DD for SQL


## ANALYZE
To get a better understanding of how our consumers are already utilizing their devices, we choose to look at three major health trends those being daily activity, body weight, and sleep. We loaded the datasets into Google BigQuery and proceeded to examine each dataset separately or together using a JOIN clause.

### The Impact of Everyday Activity
Daily activity is vital for our analysis since it allows us to find patterns in our users' behavior throughout the day.

### The Importance of Weight
Weight is an important consideration since we feel fitness is one of the primary reasons our consumers will utilize the product. In our investigation, we hope to confirm this hypothesis and build a service around it.

### Prioritizing Sleep
We feel sleep is an essential component because we can determine whether we need to expand our services to accommodate individuals' sleeping habits, and we may be able to determine whether the user receives useful information from such service.


## SHARE 
- All SQL Queries used are availble in Bellabeat_sql
- Google Slides Presentation 
- Public Tableau Dashboard is available here


## ACT
Based on our analysis, we feel our marketing team should consider these three recommendations.

1. Begin by focusing on the users' well-being. By emphasizing the value of the user, we may encourage engagement among our members in the hopes of expanding the service without spending large sums on marketing. 
2. Developing  a wellness program for members, in our analysis we observed that users wear the devices in order to gain insight into their health. We may include a reminder for simple actions, such as taking a specific amount of steps or running the last mile.  Users who need motivation  to take charge of their health may benefit from a weight loss option.
3. Focus on sleep. Our observations show that when a person sleeps for 7-8 hours, he or she is considerably more engaged in everyday tasks. We might give a colorful daily statistic that could be readily shared on social media to remind people of the necessity of getting enough sleep.


Thank you for taking the time to evaluate my project; I had a great time working on it and hope you appreciate it as much as I did! 😁📊


