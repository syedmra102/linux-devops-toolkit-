#!/bin/bash

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
close="\e[0m"

status_check() {

echo -e "${blue}what service do you want to check?${close}"

read service

if systemctl is-active --quiet "$service"
then

    echo -e "${green}$service is already running${close}"

    echo -e "${yellow}do you want to restart it? (y/n)${close}"

    read restart_status

    if [ "$restart_status" == "y" ]
    then
        sudo systemctl restart "$service"

        echo -e "${green}$service restarted successfully${close}"

        echo "$(date) restarted service $service" >> logs/system.log

    else
        echo -e "${blue}no restart performed${close}"
    fi

else

    echo -e "${yellow}$service is not running${close}"

    sudo systemctl enable "$service"

    sudo systemctl start "$service"

    echo -e "${green}$service started successfully${close}"

    echo "$(date) started service $service" >> logs/system.log

fi
}
