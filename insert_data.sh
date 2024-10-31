#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE_TABLES="$($PSQL "TRUNCATE TABLE games, teams")"

cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != "winner" ]]
  then
    WINNER_ID_SELECT="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
    if [[ -z $WINNER_ID_SELECT ]]
    then 
      ADD_WINNER_ID="$($PSQL "INSERT INTO teams(name) VALUES('$winner')")"
      echo "Inserted into teams, team $winner."
      WINNER_ID_SELECT="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
    fi

    OPPONENT_ID_SELECT="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"
    if [[ -z $OPPONENT_ID_SELECT ]]
    then 
      ADD_OPPONENT_ID="$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")"
      echo "Inserted into teams, team $opponent."
      OPPONENT_ID_SELECT="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"
    fi

    ADD_GAME_QUERY="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year,'$round',$WINNER_ID_SELECT,$OPPONENT_ID_SELECT,$winner_goals,$opponent_goals);")"
    echo "Inserted into games, $round of $year: $winner $winner_goals : $opponent_goals $opponent."
  fi
done