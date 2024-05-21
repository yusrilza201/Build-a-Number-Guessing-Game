#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  # Print 1st argument if given
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  #get username
  echo -e "\nEnter your username:"
  read USERNAME

  #query from username_result by username
  USERNAME_RESULT=$($PSQL "SELECT username FROM username WHERE username='$USERNAME'")

    #if not found
  if [[ -z $USERNAME_RESULT ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    
    #insert username
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO username(username) VALUES('$USERNAME')")
  fi
    

}

NUMBER_GUESSING_GENERATOR() {
  #random number generator
  NUMBER=$(( RANDOM % 100 + 1 ))

}

MAIN_MENU
