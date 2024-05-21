#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  # Print 1st argument if given
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  #get username
  echo -e "\nEnter your username:"
  read USERNAME_PROMPT

  #query from username_result by username_prompt
  USERNAME_RESULT=$($PSQL "SELECT username FROM username WHERE username='$USERNAME_PROMPT'")

    #if not found
  if [[ -z $USERNAME_RESULT ]]
  then
    echo -e "\nWelcome, $USERNAME_PROMPT! It looks like this is your first time here."
    
    #insert username
    INSERT_USERNAME_PROMPT_RESULT=$($PSQL "INSERT INTO username(username) VALUES('$USERNAME_PROMPT')")

    else
      #get username, games_played, best_game
      DATA_RESULT=$($PSQL "SELECT username, games_played, best_game FROM username WHERE username='$USERNAME_PROMPT'")
      echo "$DATA_RESULT" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
      do
        echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      done
  fi

  #go to number guessing games
  NUMBER_GUESSING_GENERATOR
}

NUMBER_GUESSING_GENERATOR() {
  #random number generator
  NUMBER=$(( RANDOM % 100 + 1 ))

}

MAIN_MENU
