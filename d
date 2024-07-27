** 1. Introduction **
Bellabeat a high-tech company that manufactures health-focused sma products. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.

*1.2 Company Products *
The company’s wearable products include:

Ivy – “a health tracker disguised as smart jewelry”
Time – “an elegant hybrid wellness watch”
Leaf – available in three styles: chakra, urban, & crystal and can be worn as a necklace, bracelet or clip. This was Bellabeat’s classic wellness tracker.
Spring – a “smart water bottle” designed to track your drinking / hydration habits.
All of the company’s wearables sync to their Bellabeat app where members can check their metrics. The wearables track activity (steps taken, distanced traveled, calories burned and activity minutes) & sleep and through the app you can also track your menstrual cycle, hydration (if not using Spring) & meditation. Their IVY wearable also tracks heart rate metrics.

Bellabeat also offers a Wellness Coach app with “unlimited access to 400+ education video, written, and audio content from areas of beauty, fitness, mindfulness, women’s health and more” through their Bellabeat+ membership.

2. Ask Phase
2.1 Guiding Questions:

What are some trends in smart device usage?
How could these trends apply to Bellabeat customers?
How could these trends help influence Bellabeat marketing strategy?
2.2 Clear Statement Of Business Task:

Using data from Fitbit Fitness Trackers, identify trends in smart device usage and explore how these insights can be applied to Bellabeat’s customer base. Additionally, determine how these trends can inform and enhance Bellabeat’s marketing strategy.

2.3 Stakeholders:

Urška Sršen – Bellabeat’s cofounder and Chief Creative Officer
Sando Mur – Mathematician and Bellabeat’s cofounder
Bellabeat’s marketing analytics team – a team of data analytics
3. Prepare Phase
3.1 Data Used/Stored

The data utilized for this case study is from FitBit Fitness Trackers. This dataset was sourced from Kaggle, where it was uploaded by Möbius.

3.2 Accessibility/Privacy/Usage of Data

The dataset was published by Möbius to Kaggle.com under the CC0: Public Domain Creative Common License. Thirty eligible Fitbit users consented to share their personal tracker data, which includes minute-level details on physical activity, heart rate, and sleep monitoring. The dataset contains information about daily activity, steps, and heart rate, allowing for an in-depth exploration of users' habits.

3.3 Data Organization

18 datasets/tables were downloaded from the FitBit Fitness Tracker Data. The datasets downloaded in .csv file format and included long and wide formats. The datasets chosen for analysis below included a user count of 33 participants over a 31 day period of time.

EXCEL ANALYSIS: Here I took the main daily_activity dataset and did COUNTUNIQUE for both ID and Date column

3.4 Data Limitations

The FitBit Fitness Tracker Data was collected in 2016, making it outdated for current trend analysis. According to file formatting standards, it was indicated testing occured from 03-12-2016 to 05-12-2016; however, after verification, it was found that the data was actually collected over a 31-day period (04-12-2016 to 05-12-2016). Given this limited timeframe, the potential for insightful analysis is relatively small. sleepDay data only displays 24 unique IDs.

Additionally, the sample size may introduce sample bias. Although a sample size of 30 (with our data showing a sample size of 33) is sufficient according to the Central Limit Theorem, a larger sample size would better represent the population and increase the confidence interval. The lack of demographic information also hinders our ability to determine if the sample accurately represents a national or global population. This absence of demographic details limits recommendations regarding the target audience (including gender, location, age, and job status) and where to market to them. Recommendations would be further supported and concrete if demographic info was known as Bellabeat is a women’s healthcare brand tracking menstruation and sleep cycles.

DELIVERABLE: Highlighted in bold will be the datasets used. image.png

4. Process Phase
4.1 Datasets used will be:

Daily_Activity_Merged
Daily_Sleep_Merged
Hourly_Steps_Merged
Hourly_Intensity_Merged
Hourly_Calories_Merged
Heart_Rate_Merged
Weight_Log_Merged
4.2 Tools used:

I will be using Excel to clean, transform and verify data. SQL to analyze data and Tableau for visualizations.

4.3 Excel Cleaning Process

Used COUNTUNIQUE function to get unique values of participants for each table for overarching study analysis.
Check for any duplicate data- How to check for duplicated data entries and delete them: Click on the "Data" tab at the top of Excel, then select the "Remove Duplicates" function.
Checked ID entries for length (LEN) to make sure the data was correct and uniform in length.
(Ran into issues loading dataset for multiple tables-Fixed this error by seperating space in Date and Time columns. SPLIT function Time data from Date and then CONCATENATE Time as a String and AM as a string to combine)
Adjust Numerical Data format for all tables with numbers. (Made them no decimals or at least 2 decimals for large digit values) (Process: Menu → More Formats → Numbers)
Make sure Time data is formatted in 00:00:00 for consistency for analysis.
Change data type Date to MM/DD/YY format since entire dataset is from 2016. (Easier reading. Process: Highlight column → More Formats Data and Time)
*5. Analyze *
Uploaded FitBit Fitness Tracker Data into BigQuery under the project Bellabeat FitBit Analysis

5.1 Uploaded the following clean data sets: (Ran into issues loading dataset for multiple tables-Fixed this error by seperating space in Date and Time columns. SPLIT function Time data from Date and then CONCATENATE Time as a String and AM as a string to combine)

dailyActivity_merged
sleepDay_merged
heartrate_seconds_merged
hourlyCalroie_merged
hourlyIntensity_merged
hourlySteps_merged
weightLogInfo_merged
5.2 Checking Unique Number Of Users

add Codeadd Markdown
SELECT COUNT (DISTINCT Id) AS UniqueParticapants
FROM `bellabeat-fit-bit-analysis.fitbitanalysis.sleepday`
add Codeadd Markdown
Both the Heart Rate and Weight Log datasets do not include enough data to move forward with analysis (7 and 8). These datasets will not be used.

5.3 Device Usage/ User Insight

I'd like to know the device usage of each user and divide them into three groups: 1-10 days, 11-20 days and 21-30 days. This way we can understand how to target those people who were INACTIVE USERS.

add Codeadd Markdown
SELECT Id,
COUNT(ID) AS TotalID
FROM `bellabeat-fit-bit-analysis.fitbitanalysis.dailyactivity` 
GROUP BY Id;
add Codeadd Markdown
Link To Google Sheets From BigQuery SQL

Image
64% of users logged data for the entire data time period (04-12-2016 to 05-12-2016). If we include the dataset of users who only missed 1-3 days, the perecentage becomes 82% of users who logged data or wore their FitBit Tracker consistently over the month long period.

5.3.2 User Type Personas Based On Device Usage

Next, I wanted to breakdown the users by how much they wore their FitBit Fitness Tracker. I created three user types:

Active User - wore their tracker for 25-31 days
Moderate User - wore their tracker for 15-24 days
Light User - wore their tracker for 0 to 14 days
add Codeadd Markdown
SELECT Id,
COUNT(Id) AS Total_Logged_Users,
CASE
WHEN COUNT(Id) BETWEEN 25 AND 31 THEN 'Active User'
WHEN COUNT(Id) BETWEEN 15 AND 25 THEN 'Average User'
WHEN Count(Id) BETWEEN 0 AND 14 THEN 'Inactive User'
END Device_Usage_Personas
FROM `bellabeat-fit-bit-analysis.fitbitanalysis.dailyactivity` 
GROUP BY Id
add Codeadd Markdown
Google Sheets Result Link:

Image
We can see that a large number of users who opted into the survey are active users.

5.3 User Type Based On Calorie Consumption

Analysis Question: Determine the percentage of users at each activity level. With this information, we can identify the proportion of users who are inactive. This will help us develop initiatives to encourage increased activity and exercise among them.
According to US Dietary Guidelines an average adult woman aged 26-45 should adhere to these calorie standards:

Inactive (light exercise) - < 2000 calories a day
Moderately Inactive - 2000-2200 calories a day
Active (high intensity exercise) - > 2200 calories
add Codeadd Markdown
Type Markdown and LaTeX:  α2
 
add Codeadd Markdown
--Outer Query: Calculates percentage of each user activity level relative to total user and rounds the percentage.
SELECT 
      User_Activity_Level,
      Number_of_Users,
      CONCAT(ROUND(((Number_of_users)/(sum(Number_of_users) OVER())*100),2),'%') AS Percentage
  FROM (
    --Subquery: Classisies each user into an activity level based on average calories. Counts number of users.
        SELECT
              CASE WHEN AVG_Calories < 2000 Then "Inactive (less exercise)"
                   WHEN  AVG_Calories BETWEEN 2000 AND 2200 Then "Moderately active (moderate exercise)"
                    ELSE "Active (high-intensity exercise)"
              END AS User_Activity_Level,
              COUNT (*) AS Number_of_Users,
          FROM (
            --Inner Subquery:Calculates the percentage of users in each activity level relative to the total number of users.
                  SELECT 
                        Id,
                        ROUND(AVG(Calories),0) AS AVG_Calories
                    FROM `bellabeat-fit-bit-analysis.fitbitanalysis.dailyactivity` 
                  GROUP BY Id
              ) 
          GROUP BY User_Activity_Level
       ) 
GROUP BY User_Activity_Level,Number_of_Users;
add Codeadd Markdown
Query Result:

Image
add Codeadd Markdown
Summary for 5.3 section: Based on the query result or the pie chart, it is clear to see that around 39% users are inactive and 18% users are moderately active. We can target at these two groups to encourage them to be more active and stay active by messaging them.

5.4 Verify Activity Level Personas From Calories With Steps

Purpose: I'd like to know what causes users to be inactive. First, I'll check the relationship between TotalSteps and Calories.
I retrived TotalSteps and Calories information and added User_Activity_Level from dailyActivity dataset using SQL.
The SQL code is shown in the block below:

add Codeadd Markdown
SELECT
      Id,
      TotalSteps,
      Calories,
      CASE WHEN Calories < 2000 Then "Inactive (less exercise)"
           WHEN Calories BETWEEN 2000 AND 2200 Then "Moderately active (moderate exercise)"
           ELSE "Active (high-intensity exercise)"
       END AS User_Activity_Level
  FROM `case-study-bellabeat-20240626.fitbit_data.dailyActivity
add Codeadd Markdown
Query Result:

Image
Tableau Visualization:

ImageImage
Summary for section 5.4: Based on the scatter chart, although there is a positive correlation for Total Steps and Calories, it does not necessarily mean that there is a strong relationship between the two. If the correlation is strong (points are closely clustered along an upward sloping line), it suggests that steps have a significant impact on calorie burn. If the correlation is weaker (points are more scattered) there is not a significant difference in the TotalSteps among the three groups of users. For an average of 7,637 steps, users are distributed into three different calorie groups. This means that the number of steps is not the reason for the high calories. Next, I'll check if inactive users have lower active minutes.

5.5 Activity Level Correlation With Active Minutes Analysis

Based on our previous analysis, it is still not decsisive that TotalSteps is the key factor for low calories expenditure in inactive users. So, I decided to investigate if active minutes is another reason that can factor largely into calorie expeindutres.
I retrived the Active_Minutes and AVG_Calories information, and added User_Activity_Level from dailyActivity dataset using SQL. CUSTOM INPUT: As there wasn't a column for me to check active minutes status, I added weight 0.8, 0.6, 0.4 and 0.2 for the columns VeryActiveMinutes,FairlyActiveMinutes, LightlyActiveMinutes and SedentaryMinutes respectively to produce a new column Active_Minutes.

The SQL code is shown in the block below:

add Codeadd Markdown
SELECT
      Id,
      ROUND(AVG(((0.8*VeryActiveMinutes)+ (0.6*FairlyActiveMinutes) + (0.4* LightlyActiveMinutes) + (0.2*SedentaryMinutes))),0) AS Active_Minutes,
      ROUND(AVG(Calories),0) AS AVG_Calories,
      CASE WHEN AVG(Calories) < 2000 Then "Inactive (less exercise)"
           WHEN AVG(Calories) BETWEEN 2000 AND 2200 Then "Moderately active (moderate exercise)"
           ELSE "Active (high-intensity exercise)"
       END AS User_Activity_Level
  FROM `bellabeat-fit-bit-analysis.fitbitanalysis.dailyactivity` 
  GROUP BY Id
add Codeadd Markdown
Query Results:

Image
Tableau Boxplot:

Image
Summary for section 5.5: Based on the box plot, it's clear that the average active minutes are related to activity levels. The more active a person is, the higher their active minutes. Conversely, the less active a person is, the lower their active minutes.

Additionally, compared to our previous analysis, although active minutes and activity levels have a positive correlation similar to steps and activity levels, this box plot shows us that average minutes you are active has a further substantive impact on your caloric expenditures.
5.6 Examining Sleep Patterns

Finally, I wanted to look into the sleeping patterns of individuals and compare it to their steps. I would predict that increased total steps would thus display better sleep quality trends.
InnerJoin was performed between the dailyActivity table and the sleepDay table deriving subsequent rounded averaged functions based on steps, calories and minutes slept.

The SQL code is shown in the block below:

add Codeadd Markdown
