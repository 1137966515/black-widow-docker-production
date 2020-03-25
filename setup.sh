#!/bin/bash

# This script helps with the setup of the configuration that will be part of the black widow system.

server_file_path='./black_widow/main_server/src/'

rm -f .env
touch .env

rm -f $server_file_path.env
touch $server_file_path.env




reg='^[+]?[0-9]{0,5}$'

read -p 'Enter the port number that will be used by the Black Widow container, else press enter [Default=8080]: '  BW_CON_PORT
until [[  $BW_CON_PORT =~ $reg || $BW_CON_PORT == "" ]] ; do 
    echo 'Oops! Use input was not 5 digits as it should be'
    echo 
    read -p 'Enter the Black Widow container port once again' $BW_CON_PORT
done
if [[ $BW_CON_PORT = "" ]]; then 
    echo BW_CON_PORT=8080 | tee -a .env 
else 
    echo BW_CON_PORT=$BW_CON_PORT  | tee -a .env 
fi 

read -p 'Enter the port number that will be used by the Black Widow APP, else press enter [Default=5000]: '  BW_APP_PORT
until [[  $BW_APP_PORT =~ $reg || $BW_APP_PORT == "" ]] ; do 
    echo 'Oops! Use input was not 5 digits as it should be'
    echo 
    read -p 'Enter the Black Widow container port once again' $BW_APP_PORT
done
if [[ $BW_APP_PORT = "" ]]; then 
    echo BW_APP_PORT=5000  | tee -a .env $server_file_path.env
else 
    echo BW_APP_PORT=$BW_APP_PORT  | tee -a .env $server_file_path.env
fi 


DOCKER_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
echo DOCKER_HOST=$DOCKER_HOST >> $server_file_path.env



