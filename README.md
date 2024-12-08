# **Football Analysis (SQL)**  

## **Overview**  
This project analyzes football match data to derive meaningful insights about players, teams, and performance metrics.  

## **Objective**  
- Identify top-performing players and teams.  
- Understand win/loss patterns.  
- Explore scoring trends, penalties, and game outcomes.  

## **Skills and Tools Used**  
- **Skills**: SQL queries for joins, aggregations, filtering, and window functions.  
- **Tools**: MySQL/SQL Server.  

## **Key Insights**  
- Player rankings based on goals and assists.  
- Teams with the highest win rates.  
- Analysis of penalty success rates and scoring trends.  

## **Dataset Details**  
- **Source**: Sample football dataset.  
- **Contents**:  
  - Match details (date, teams, scores).  
  - Player statistics (goals, assists, penalties).  
  - Team performance records (wins, losses, draws).  

## **Sample Queries**  
```sql
-- Top 5 players by goals scored
SELECT Player_Name, SUM(Goals) AS Total_Goals
FROM Player_Stats
GROUP BY Player_Name
ORDER BY Total_Goals DESC
LIMIT 5;

-- Teams with the highest win rates
SELECT Team_Name, COUNT(*) AS Wins
FROM Match_Results
WHERE Result = 'Win'
GROUP BY Team_Name
ORDER BY Wins DESC;
