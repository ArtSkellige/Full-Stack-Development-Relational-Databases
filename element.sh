#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Query the database and store result
  RESULT=$($PSQL "SELECT elements.atomic_number, elements.symbol, elements.name, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements JOIN properties ON elements.atomic_number = properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE CAST(elements.atomic_number AS VARCHAR) = '$1' OR elements.symbol = '$1' OR elements.name = '$1'")
  # Check if element was found
  if [[ -z $RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    # Parse the result and display the formatted output
    echo "$RESULT" | while IFS="|" read ATOMIC_NUM SYMBOL NAME MASS MELTING BOILING TYPE
do
  # Now you have each value in a separate variable
  echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
  fi
fi