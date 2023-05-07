

--giving unique row numbers to each entry
SELECT *, row_number() over () as rn 
FROM Accidental_Drug_Related_Deaths_20122021

--number of male deaths vs female deaths
Select Sex, count(rn) as number_of_deaths 
from 
  (SELECT *, row_number() over () as rn 
  FROM Accidental_Drug_Related_Deaths_20122021)
group by Sex;

--number of deaths according to the cause of death
Select cause_of_death, count(rn) as number_of_deaths FROM
	(SELECT *, row_number() over () as rn 
 		 FROM Accidental_Drug_Related_Deaths_20122021)
group by cause_of_death
order by number_of_deaths desc;

--Top 5 cities according to death from drugs
Select death_city, count(rn) as number_of_deaths  FROM 
		(SELECT *,row_number() over () as rn FROM Accidental_Drug_Related_Deaths_20122021)

group by death_city
order by number_of_deaths desc
limit 5;


--number of deaths from drugs according to age
Select age, count(rn) as number_of_deaths from 
		(SELECT *,row_number() over () as rn FROM Accidental_Drug_Related_Deaths_20122021)
group by age
order by number_of_deaths desc; 


--number of deaths from drugs according to manner of death
Select manner_of_death, count(rn) as number_of_deaths from 
		(SELECT *,row_number() over () as rn FROM Accidental_Drug_Related_Deaths_20122021)
group by manner_of_death
order by number_of_deaths desc; 

