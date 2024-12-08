CREATE DATABASE IF NOT EXISTS sports_analysis;
USE sports_analysis;
CREATE TABLE IF NOT EXISTS playersss (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50),
    team_name VARCHAR(30),
    position VARCHAR(20),
    age INT,
    nationality VARCHAR(30)
);
CREATE TABLE IF NOT EXISTS matchesss (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    match_date DATE,
    home_team VARCHAR(30),
    away_team VARCHAR(30),
    home_team_score INT,
    away_team_score INT,
    location VARCHAR(50),
    attendance INT
);
CREATE TABLE IF NOT EXISTS playersss_stats (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    player_id INT,
    goals INT,
    assists INT,
    yellow_cards INT,
    red_cards INT,
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);
INSERT INTO playersss (player_name, team_name, position, age, nationality) VALUES
('Lionel Messi', 'Paris Saint-Germain', 'Forward', 36, 'Argentina'),
('Cristiano Ronaldo', 'Al-Nassr', 'Forward', 39, 'Portugal'),
('Neymar Jr', 'Paris Saint-Germain', 'Midfielder', 32, 'Brazil'),
('Luka Modric', 'Real Madrid', 'Midfielder', 38, 'Croatia'),
('Virgil van Dijk', 'Liverpool', 'Defender', 32, 'Netherlands');
INSERT INTO matchesss (match_date, home_team, away_team, home_team_score, away_team_score, location, attendance) VALUES
('2024-10-15', 'Paris Saint-Germain', 'Al-Nassr', 3, 1, 'Parc des Princes', 48712),
('2024-10-20', 'Real Madrid', 'Liverpool', 2, 2, 'Santiago Bernabéu', 81044);
INSERT INTO playersss_stats (match_id, player_id, goals, assists, yellow_cards, red_cards) VALUES
(1, 1, 2, 1, 0, 0), -- Lionel Messi
(1, 3, 1, 1, 0, 0), -- Neymar Jr
(1, 2, 1, 0, 1, 0), -- Cristiano Ronaldo
(2, 4, 1, 1, 0, 0), -- Luka Modric
(2, 5, 0, 1, 1, 0); -- Virgil van Dijk
SELECT p.player_name, SUM(ps.goals) AS total_goals
FROM playersss_stats ps
JOIN playersss p ON ps.player_id = p.player_id
GROUP BY ps.player_id
ORDER BY total_goals DESC
LIMIT 1;
SELECT team_name, SUM(ps.goals) AS team_goals
FROM playersss_stats ps
JOIN playersss p ON ps.player_id = p.player_id
GROUP BY team_name
ORDER BY team_goals DESC;
SELECT match_id, 
       CONCAT(home_team, ' vs ', away_team) AS match_details,
       CONCAT(home_team_score, '-', away_team_score) AS result,
       location, attendance
FROM matchesss;
SELECT nationality, SUM(ps.goals) AS total_goals
FROM playersss_stats ps
JOIN playersss p ON ps.player_id = p.player_id
GROUP BY nationality
ORDER BY total_goals DESC;
SELECT match_date, location, attendance
FROM matchesss
ORDER BY attendance DESC
LIMIT 1;
SELECT 
    CASE
        WHEN age < 30 THEN 'Below 30'
        WHEN age BETWEEN 30 AND 35 THEN '30-35'
        ELSE 'Above 35'
    END AS age_group,
    COUNT(*) AS player_count
FROM playersss
GROUP BY age_group;
