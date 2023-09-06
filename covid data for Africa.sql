
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






--2. Total cases in each African country across Juanry 2023 to August 2023
SELECT Location, SUM(new_cases) AS new_cases_Jan2023_to_Aug2023
FROM PortfolioProject..Sheet1$
WHERE Continent='Africa' AND date BETWEEN '2023-01-01' AND '2023-08-28'
GROUP BY location




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


-- 5 Total Population vs Vaccinations
Select continent, (MAX(CAST(people_vaccinated AS float))/MAX(CAST(population AS float))*100) as percent_population_vaccinated
From PortfolioProject..Sheet1$
WHERE continent is not null AND date BETWEEN '2023-01-01' AND '2023-07-31'
Group by continent
order by percent_population_vaccinated desc






----1 looking at total cases vs total deaths
--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--where continent is not null 
----Group By date
--order by 1,2


----2 looking at total cases vs population
--SELECT Location, date, Population, total_cases, (CAST(total_cases as float)/CAST(population as float)*100) as CasePercentage
--FROM PortfolioProject..Sheet1$
--Group by Location, population
--order by 1,2






----2 looking at countries with highest infection rates

--Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((CAST(total_cases as float)/ CAST(population as float)))*100 as PercentPopulationInfected
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--Group by Location, Population
--order by PercentPopulationInfected desc





----5 death count by location
--Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--WHERE continent is not null
--Group by location
--order by TotalDeathCount desc




----6 death count by continent
--Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--WHERE continent is not null
--Group by continent
--order by TotalDeathCount desc



-----7 Global total cases ever vs total deaths ever
--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/ SUM(new_cases)*100 as DeathPercentage
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--WHERE continent is not null
--order by 1,2



---- 8 total population vs vaccinated population
--SELECT Location, population, MAX(people_vaccinated)/population*100 as PercentVaccinatedPopulation
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--WHERE continent is not null
--Group by location, population
--order by 3 desc



---- 9 Total Population vs Vaccinations
---- Vacination per continent
--Select continent, MAX(cast(people_vaccinated as int)) as TotalPeopleVaccinated
--From PortfolioProject..Sheet1$
----Where location like '%states%'
--WHERE continent is not null
--Group by continent
--order by TotalPeopleVaccinated desc




