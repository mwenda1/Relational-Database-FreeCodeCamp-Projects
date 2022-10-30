#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

if [[ $1 =~ ^[0-9]+$ ]]
then
  element=$($PSQL "select atomic_number, name, symbol, t.type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements AS e join properties AS p using(atomic_number) join types AS t using(type_id) where atomic_number = '$1'")
else
  element=$($PSQL "select atomic_number, name, symbol, t.type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements AS e join properties AS p using(atomic_number) join types AS t using(type_id) where name = '$1' or symbol = '$1'")
fi

if [[ -z $element ]]
then
  echo "I could not find that element in the database."
  exit
fi

echo $element | while IFS=" |" read atomic_number name symbol type mass mp bp 
do
  echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
done
