--Looking at total_cases vs Population
Select location, date, total_cases, Population, (total_cases/population)*100 as cases_Percentage From covids_deaths_data order by 1,2;
-- Looking at countries with the highest infection rate compared to population
SELECT location, total_cases, Population, MAX(total_cases) as Highest_Infection_count, 
MAX(total_cases/population)*100 as percent_population_infected FROM covids_deaths_data GROUP BY  location,population, total_cases order by percent_population_infected DESC;
-- Showing continent with highest death counts per population 
SELECT continent, MAX(total_deaths) as Total_death_counts FROM covids_deaths_data WHERE continent is NOT NULL GROUP BY continent order by total_death_counts DESC;
--Seeing a general overview of the data
SELECT * FROM covids_deaths_data LIMIT 1000;
--Showing countries with highest death counts per population
SELECT location , MAX(total_deaths) as Total_death_counts FROM covids_deaths_data GROUP BY location;



SELECT location, new_vaccinations, new_people_vaccinated_smoothed, new_vaccinations/ new_people_vaccinated_smoothed as people_vaccinated FROM covids_deaths_data
WHERE location is NOT NULL GROUP BY location, new_vaccinations, new_people_vaccinated_smoothed order by people_vaccinated ASC;
-- Global numbers by date
SELECT date, SUM(new_cases) FROM covids_deaths_data WHERE continent is NOT NULL GROUP BY date
order by 1,2;
-- Global numbers of deaths by date
SELECT date, SUM(new_deaths) as total_deaths FROM covids_deaths_data WHERE continent is NOT NULL GROUP BY date
order by 1,2;
-- Finding the death percentage based on new cases.
SELECT SUM(new_deaths) as total_deaths_new, SUM(new_cases) as new_cases_new , (SUM(new_deaths)/ SUM(new_cases))*100 as death_percentage FROM covids_deaths_data WHERE continent is NOT NULL order by 1,2;

-- Viewing new_tests, total_tests 
SELECT location, new_tests, total_tests FROM covids_deaths_data;

-- Calculating the new_tests percent from the total_tests
SELECT location, new_tests, total_tests, MAX((new_tests/total_tests)*100) AS new_tests_percentage FROM  covids_deaths_data GROUP BY location, new_tests, total_tests;


-- Positive rate with respect to location
SELECT location, date, positive_rate FROM covids_deaths_data order by 1,2;
-- Number of smokers with respect to continents in the covids_deaths_data
SELECT continent, male_smokers, female_smokers FROM covids_deaths_data order by 2,1;

-- Estimating the financial situation of a country and its covid cases
SELECT location, total_cases, MAX(gdp_per_capita) FROM covids_deaths_data GROUP BY location, total_cases order by 2,1;
--- Estimating total_deaths_per_million 
SELECT location, total_cases_per_million, total_deaths_per_million, (total_deaths_per_million/NULLIF(total_cases_per_million,0))*100 AS death_percentage_per_million FROM covids_deaths_data GROUP BY location, total_cases_per_million, total_deaths_per_million order by 2,1; 

--Calculating people vaccinated 
SELECT location, total_vaccinations, people_vaccinated, (people_vaccinated/nullif(total_vaccinations,0))*100 as percentage_vaccination_of_people FROM covids_deaths_data order BY 2,1;

-- Estimating total_Deaths with respect to the life expecatancy in the given data-set
SELECT location, life_expectancy, total_deaths FROM covids_deaths_data;

--Finding out particular relations between handwashing facilities and new_cases

SELECT location, handwashing_facilities, new_cases FROM covids_deaths_data; 


-- human_development_index and total_Cases
SELECT location, human_development_index, total_cases FROM covids_deaths_data;

--People vaccinated per hunderd and new_Cases 
SELECT continent, people_vaccinated_per_hundred, new_cases FROM covids_deaths_data;



--Seeing percentage of male_smokers of total_population of males
SELECT location, male_smokers, population, (male_smokers/population)*100 AS percent_population_male_smokers
FROM covids_deaths_data GROUP BY male_smokers, population,location;
--Seeing percentage of female_smokers
SELECT location, female_smokers, population, (female_smokers/population)*100 AS percent_population_female_smokers
FROM covids_deaths_data GROUP BY female_smokers, population, location;

--Hospitals beds per thousand
SELECT location, hospital_beds_per_thousand,population, (hospital_beds_per_thousand/population) *100 AS percent_of_hospitals_with_respect_to_population FROM covids_deaths_data GROUP BY location,
hospital_beds_per_thousand, population;