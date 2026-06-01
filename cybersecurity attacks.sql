CREATE TABLE cyber_attacks (
    Country TEXT,
    Year INT,
    Attack_Type TEXT,
    Target_Industry TEXT,
    Financial_Loss NUMERIC,
    Affected_Users BIGINT,
    Attack_Source TEXT,
    Vulnerability_Type TEXT,
	Defense_Mechanism TEXT,
	Resolution_time INT,
	Risk_score Numeric,
	Threat_level TEXT,
	Attack_severity TEXT
);

select * from cyber_attacks

--1.Which country faces the most cyberattacks?

SELECT Country, COUNT(*) AS total_attacks
FROM cyber_attacks
GROUP BY Country
ORDER BY total_attacks DESC;

--2.How have cyberattacks changed over time?
SELECT Year, COUNT(*) AS total_attacks
FROM cyber_attacks
GROUP BY Year
ORDER BY Year;
--3.Which attack type is most common?
select attack_type, COUNT(*) as attacks
from cyber_attacks
group by attack_type 
ORDER BY attacks DESC;
--4.Which industry is most targeted?
SELECT Target_Industry, COUNT(*) AS total_attacks
FROM cyber_attacks
GROUP BY Target_Industry
ORDER BY total_attacks DESC;
--5.Which attack type causes the highest financial loss?
SELECT Attack_Type, SUM(Financial_Loss) AS total_loss
FROM cyber_attacks
GROUP BY Attack_Type
ORDER BY total_loss DESC; 

--6.What are the most common vulnerabilities?
select vulnerability_type, count(*) as vulnerability
from cyber_attacks
group by vulnerability_type
order by vulnerability desc;
--7.Which industries face the most severe attacks?
SELECT Target_Industry, COUNT(*) AS critical_attacks
FROM cyber_attacks
WHERE Attack_Severity = 'Critical'
GROUP BY Target_Industry
ORDER BY critical_attacks DESC;

--8.Top 5 most dangerous attack combinations
SELECT Country, Attack_Type,
SUM(Risk_score) AS total_risk
FROM cyber_attacks
GROUP BY Country, Attack_Type
ORDER BY total_risk DESC
LIMIT 5;
--9.Which industry has highest average resolution time?
SELECT Target_Industry, AVG(Resolution_Time) AS avg_resolution_time
FROM cyber_attacks
GROUP BY Target_Industry
ORDER BY avg_resolution_time DESC
LIMIT 1;
--10.Which defense mechanism is most used for each attack type?
SELECT Attack_Type, Defense_Mechanism, COUNT(*) AS total
FROM cyber_attacks
GROUP BY Attack_Type, Defense_Mechanism
ORDER BY total DESC;

--11.Which vulnerabilities are most exploited by each attack type?

SELECT Attack_Type, Vulnerability_Type, COUNT(*) AS total
FROM cyber_attacks
GROUP BY Attack_Type, Vulnerability_Type
ORDER BY total DESC;
--12.Which attack type causes highest loss for a specific vulnerability?
SELECT Vulnerability_Type, Attack_Type,
SUM(Financial_Loss) AS total_loss
FROM cyber_attacks
GROUP BY Vulnerability_Type, Attack_Type
ORDER BY total_loss DESC;