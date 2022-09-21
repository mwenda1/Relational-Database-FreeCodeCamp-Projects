#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select SUM(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select AVG(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select ROUND(AVG(winner_goals), 2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select MAX(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name from teams full join games ON teams.team_id = games.winner_id WHERE games.year = 2018 AND games.round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT t.team FROM ((SELECT w.name AS team, g.round AS round, g.year AS year FROM games AS g LEFT JOIN teams AS w ON g.winner_id = w.team_id) 
UNION (SELECT l.name AS team, g.round AS round, g.year AS year FROM games AS g LEFT JOIN teams AS l ON g.opponent_id = l.team_id)) AS t 
WHERE t.round LIKE 'Eighth-Final' AND t.year = 2014 ORDER BY t.team")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct(teams.name) from games left join teams on games.winner_id = teams.team_id ORDER BY teams.name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select CONCAT(g.year,'|', t.name) from games AS g LEFT JOIN teams AS t ON g.winner_id = t.team_id WHERE g.round = 'Final' ORDER BY g.year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"