### COVID-19-in-Africa-Analysis

**Monitor COVID-19 trends from January 2023 to July 2023 in Africa.**

It’s August 2023, and headlines and rumors are starting to fly around about a new wave of COVID-19. Being a data enthusiast, I wanted to see for myself. I decided to analyze the COVID-19 trends in Africa (where I live) and deduce if I have reasons to be concerned about a pandemic in the near future.


**Project Objective:** Monitor COVID-19 trends from January 2023 to July 2023 in Africa.


**Data Source:** https://ourworldindata.org/covid-deaths


**Tools:** SQL, Excel, Tableau


## Data Exploration in SQL
Questions to answer with SQL:

**Total cases from January to July in Africa:** This query helped me analyze the COVID-19 trends in Africa during the specified time frame, allowing me to track the monthly total cases and draw meaningful insights from the data
```
--1. Total cases in Africa across January 2023 to August 2023

SELECT 
 CASE 
        WHEN MONTH(date) = 1 THEN 'January'
        WHEN MONTH(date) = 2 THEN 'February'
        WHEN MONTH(date) = 3 THEN 'March'
        WHEN MONTH(date) = 4 THEN 'April'
        WHEN MONTH(date) = 5 THEN 'May'
        WHEN MONTH(date) = 6 THEN 'June'
        WHEN MONTH(date) = 7 THEN 'July'
    END AS Month,
 SUM(new_cases) AS new_cases
FROM PortfolioProject..Sheet1$
WHERE continent='Africa' AND date BETWEEN '2023-01-01' AND '2023-07-31'
GROUP BY month(date)
ORDER BY month(date) ;
```


**2. Total cases in each African country:** This query provided me with the total cases for each African country during the specified time frame, enabling me to analyze how the pandemic has affected different countries in Africa. It’s a valuable piece of information for understanding the regional impact of COVID-19.

```
--2. Total cases in each African country across Juanry 2023 to August 2023
SELECT Location, SUM(new_cases) AS new_cases_Jan2023_to_Aug2023
FROM PortfolioProject..Sheet1$
WHERE Continent='Africa' AND date BETWEEN '2023-01-01' AND '2023-08-28'
GROUP BY location
```


**3. Total deaths from January to July in Africa:** This query allowed me to analyze the total COVID-19 deaths in Africa every month for the specified period, providing insights into the severity of the pandemic over these months. It’s essential data for understanding the impact of COVID-19 on mortality rates in the region.

```
--3. Total deaths in Africa  across Janury to Augsut
SELECT 
 CASE 
        WHEN MONTH(date) = 1 THEN 'January'
        WHEN MONTH(date) = 2 THEN 'February'
        WHEN MONTH(date) = 3 THEN 'March'
        WHEN MONTH(date) = 4 THEN 'April'
        WHEN MONTH(date) = 5 THEN 'May'
        WHEN MONTH(date) = 6 THEN 'June'
        WHEN MONTH(date) = 7 THEN 'July'
    END AS Month,
 SUM(new_deaths) AS new_deaths
FROM PortfolioProject..Sheet1$
WHERE continent='Africa' AND date BETWEEN '2023-01-01' AND '2023-07-31'
GROUP BY month(date)
ORDER BY month(date) ;
```


**4. Infection cases across the continents from January to August:** This provided me with a summary of infection cases for each continent on a monthly basis, allowing me to analyze how the COVID-19 pandemic has evolved across different continents during the specified time period. This is good for perspective and understanding how severe or mild COVID-19 is in Africa compared with other continents.

```
--4. Infection Cases across all continents
SELECT 
 continent, 
 SUM(CASE WHEN MONTH(date) = 1 THEN new_cases ELSE 0 END) AS january,
 SUM( CASE WHEN MONTH(date) = 2 THEN new_cases ELSE 0 END) AS feburary,
 SUM(CASE WHEN MONTH(date) = 3 THEN new_cases ELSE 0 END) AS march,
 SUM(CASE WHEN MONTH(date) = 4 THEN new_cases ELSE 0 END) AS april,
 SUM(CASE WHEN MONTH(date) =5 THEN new_cases ELSE 0 END) AS may,
 SUM(CASE WHEN MONTH(date) =6 THEN new_cases ELSE 0 END) AS june,
 SUM(CASE WHEN MONTH(date) =7 THEN new_cases ELSE 0 END) AS july


FROM PortfolioProject..Sheet1$
WHERE continent is not null AND date BETWEEN '2023-01-01' AND '2023-07-31'
GROUP BY continent
```


### Data Visualizations

I used Tableau to create data visualizations by exporting the results of my SQL queries and saving them as tables.

Tableau added interactivity to my dashboard, enhancing the user experience and enabling viewers to explore the data interactively. Click this link to view my interactive dashboard on Tableau: Link to Tableau Dashboard.


1. Total cases in Africa across January 2023 to August 2023

2. Total cases in each African country


3. Total deaths from January to July in Africa:


4. Infection cases across the continents from January to August





Conclusions
Here are consolidated insights and conclusions drawn from the tables :


**1. Decreasing Trend:** After January, there was a general decrease in the number of new cases each month, suggesting that measures taken to control the pandemic might have been effective or seasons affect the prevalence of the virus.

**2. Differential Impact:** COVID-19 impacted African countries differently, with varying levels of infection rates. Factors such as population density, healthcare infrastructure, and public health measures likely played a role.

**3. Continental Variation:** The data demonstrated significant variations in the number of COVID-19 cases across different continents. Asia consistently had the highest case numbers, followed by North America and Europe.


In conclusion, while there have been fluctuations in COVID-19 cases in Africa, the overall trend has been a decrease in cases since the beginning of 2023. While concerns should not be dismissed, the data suggests that Africa has made progress in managing the pandemic, which is a positive sign.
