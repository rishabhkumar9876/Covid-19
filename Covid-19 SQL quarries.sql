--World wise total data

select Max(population) as Total_Population,max(total_cases) as total_cases,max(total_deaths) as Total_deaths,
round(100*max(total_cases)/Max(population),2) World_infection_Rate,round(100*max(total_deaths)/max(total_cases),2)  World_death_rate
from covid_data where location='World';

--Continent Wise death

with cte as (select continent ,max(cast(total_deaths as int)) as total_death from covid_data
where continent is not null group by continent,location)
select continent, sum(total_death) as total_death from cte group by continent;

--country wise infection data

select location,Max(population) as Total_Population,isnull(max(total_cases),0) as total_cases,
isnull(round(100*max(total_cases)/Max(population),2),0) percentage_population_infected
from covid_data where continent is not null group by location order by location;

--country wise new cases

 
select location,date,isnull(new_cases,0) as new_cases
from covid_data where continent is not null order by location;
