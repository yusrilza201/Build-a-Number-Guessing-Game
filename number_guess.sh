#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  # Print 1st argument if given
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

}

NUMBER_GUESSING_GENERATOR() {
  #random number generator
  NUMBER=$(( RANDOM % 100 + 1 ))

}
