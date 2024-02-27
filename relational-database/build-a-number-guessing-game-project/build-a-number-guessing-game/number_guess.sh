#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER_ID=-1
USER_NAME=""
GAME_PLAYED=0
BEST_GAME=0

#INPUT_NAME
LEN=0
while [[ ! "$LEN" -le 22 ]] || [[ ! "$LEN" -gt 0 ]]
do
  echo -e "Enter your username:"
  read NAME
  LEN=${#NAME}
done

#FIND_USER 
USER_RESULT=$($PSQL "SELECT u.user_id, u.username, u.frequent_games, COALESCE(MIN(g.best_guess),0) AS best_guess 
FROM users AS u 
LEFT JOIN games AS g USING(user_id) 
WHERE u.username='$NAME' 
GROUP BY u.user_id, u.username, u.frequent_games 
LIMIT 1;")
IFS=$"|" read -r USER_ID USER_NAME GAME_PLAYED BEST_GAME <<< "$USER_RESULT"
if [[ ! -z $USER_ID ]]
then
  echo "Welcome back, $USER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
else
  USER_NAME="$NAME"
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  
  #ADD_USER  
  RESULT=$($PSQL "INSERT INTO users (username) VALUES('$USER_NAME');")
  if [[ "$RESULT" == "INSERT 0 1" ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME' LIMIT 1;")
  fi
fi

#NEW_GAME
GAME_COUNT=0
GAME_END=0
GAME_ANSWER=$(( $RANDOM % 1000 + 1 ))

while [[ $GAME_END -eq 0 ]]
do
  if [[ -z $GAME_GUESS ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  elif [[ ! $GAME_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GAME_GUESS -gt $GAME_ANSWER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GAME_GUESS -lt $GAME_ANSWER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $GAME_GUESS -eq $GAME_ANSWER ]]
  then
    GAME_END=1
  fi

  if [[ $GAME_END -eq 0 ]]
  then
    read GAME_GUESS
    GAME_COUNT=$(( $GAME_COUNT + 1 ))
  fi
done

#SAVE_GAME
RESULT=$($PSQL "INSERT INTO games (user_id, best_guess) values($USER_ID, $GAME_COUNT);")
if [[ "$RESULT" == "INSERT 0 1" ]]
then
  RESULT=$($PSQL "UPDATE users SET frequent_games = frequent_games + 1 WHERE user_id = $USER_ID;")
fi

echo "You guessed it in $GAME_COUNT tries. The secret number was $GAME_ANSWER. Nice job!"
