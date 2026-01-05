#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  # Display services
  $PSQL "SELECT service_id || ') ' || name FROM services"
  
  # Prompt for service
  echo -e "\nWhich service would you like?"
  read SERVICE_ID_SELECTED
  
  # Check if service exists
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # If not found
  if [[ -z $SERVICE_NAME ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MAIN_MENU
    return
  fi
  # Get customer phone
  echo -e "\Please enter your phone number?"
  read CUSTOMER_PHONE
# Check if customer exists
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# If customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
  # Get new customer name
  echo -e "\nI don't have a record for the phone number, please, let us know your name?"
  read CUSTOMER_NAME

  # Insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi
  # Get appointment time
  echo -e "\nWhat time would you like your appointment?"
  read SERVICE_TIME
  
  # Get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # Insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  # Confirmation message
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}
# Start the program
MAIN_MENU