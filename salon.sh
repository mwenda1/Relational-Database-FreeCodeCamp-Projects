#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

DISPLAY() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES_OFFERED=$($PSQL "SELECT service_id, name FROM services")

  # display services offered
  echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

MAIN_MENU() {
  DISPLAY "Welcome to My Salon, how can I help you?"

  # ask for service to schedule appointment for
  echo -e "\nWhich service would you like to schedule an appointment for?"
  read SERVICE_ID_SELECTED

  # if service request is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    DISPLAY "I could not find that service. What would you like today?"
  else
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get new customer name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
    fi

    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # get service time
    echo -e "\nWhat time would you like to schedule an appointment?"
    read SERVICE_TIME

    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    # validate appointment
    if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
    then
      echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi

}

MAIN_MENU