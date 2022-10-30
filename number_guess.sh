#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  #Get username of player
  echo -e "\nEnter your username:"
  read USERNAME
  #echo $USERNAME

  # Check if user is new or has played before
  USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

  if [[ ! $USER ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    #insert player since it's first time
    INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  else
    GAMES_PLAYED=$($PSQL "SELECT count(game_id) FROM games WHERE username='$USERNAME'")

    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE username='$USERNAME'")

    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  NUMBER_GUESSING_GAME

}

NUMBER_GUESSING_GAME() {

  # Generate a number between 1 to 1000
  SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))

  #number of tries
  TRIES=0

  #read guessed number
  GUESSED=0
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]; do
    read GUESSED_NUMBER
    #echo $GUESSED_NUMBER

    #check if not integer
    if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]] 
    then
      echo -e "\nThat is not an integer, guess again:"
    #When number is guessed
    elif [[ $SECRET_NUMBER = $GUESSED_NUMBER ]];
    then
      TRIES=$(($TRIES + 1))
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      INSERT_TO_GAMES=$($PSQL "insert into games(username, guesses) values('$USERNAME', $TRIES)")
      GUESSED=1
    #check if guessed number is greater than secret number
    elif [[ $SECRET_NUMBER -gt $GUESSED_NUMBER ]] 
    then
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's higher than that, guess again:"
    #check if guessed number is less than secret number
    else
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi

  done
}

MAIN_MENU