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

    #update games_played
    UPDATE_GAME_PLAYED=$($PSQL "UPDATE username SET games_played=1 WHERE username='$USERNAME_PROMPT'")

  else
    #get username, games_played, best_game
    DATA_RESULT=$($PSQL "SELECT username, games_played, best_game FROM username WHERE username='$USERNAME_PROMPT'")
    echo "$DATA_RESULT" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      
      #update games_played
      UPDATE_GAME_PLAYED=$($PSQL "UPDATE username SET games_played=games_played+1 WHERE username='$USERNAME_PROMPT'")
    done
  fi

  #go to number guessing games
  NUMBER_GUESSING_GENERATOR
}

NUMBER_GUESSING_GENERATOR() {
  #random number generator
  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

  #get guesses number
  echo -e "\nGuess the secret number between 1 and 1000:"

  NUMBER_TRY=0

  while true
  do
    #input guesses number user
    read USER_GUESS_NUMBER

    # Increment the number of tries
    NUMBER_TRY=$((NUMBER_TRY + 1))

    #if not integer 
    if [[ ! $USER_GUESS_NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    
    #if user guess number lower than number
    elif [[ $USER_GUESS_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    
    #if user guess number greater than number
    elif [[ $USER_GUESS_NUMBER -gt $SECRET_NUMBER ]] 
    then
      echo -e "\nIt's lower than that, guess again:"
    
    #if right guess
    else
      echo -e "\nYou guessed it in $NUMBER_TRY tries. The secret number was $SECRET_NUMBER"
      break
    fi
  done

  #get username, games_played, best_game
  DATA_RESULT=$($PSQL "SELECT username, games_played, best_game FROM username WHERE username='$USERNAME_PROMPT'")
  echo "$DATA_RESULT" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
  do
    #update best game
    if [[ -z $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE username SET best_game=$NUMBER_TRY WHERE username='$USERNAME'")
    elif [[ $NUMBER_TRY -gt $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE username SET best_game=$NUMBER_TRY WHERE username='$USERNAME'")
    else :
      #break from the loop
    fi
  done

}

MAIN_MENU
