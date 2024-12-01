#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERNAME_QUERY_RESULT=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
if [[ -z $USERNAME_QUERY_RESULT ]]
then
  GAMES_PLAYED=0
  BEST_SCORE=null;
  # add into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")
  echo $USER_DATA
  IFS='|' read GAMES_PLAYED BEST_GAME <<< $USER_DATA
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate random number between 1 and 1000
RANDOM_NUMBER=$((RANDOM%1000))

NUMBER_OF_GUESSES=1

echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS
while [[ ! $USER_GUESS == $RANDOM_NUMBER ]]
do
  if [[ ! $USER_GUESS =~ ^([0-9]+)$ ]]
  then
    echo -e "\n That is not an integer, guess again:"
  elif [[ $USER_GUESS > $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  else
    echo -e "\nIt's higher than that, guess again:"
  fi
  ((NUMBER_OF_GUESSES++))
  read NEW_USER_GUESS
  USER_GUESS=$NEW_USER_GUESS
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

((GAMES_PLAYED++))

# update number of games played
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
if [[ -z $BEST_SCORE || $NUMBER_OF_GUESSES < $BEST_SCORE ]]
then
  # update best score
  UPDATE_BEST_SCORE=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
fi
