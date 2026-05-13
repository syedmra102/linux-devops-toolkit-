#!/bin/bash

source scripts/package_manager.sh
source scripts/service_manager.sh
source scripts/user_management.sh
source scripts/monitoring.sh
source scripts/backup_manager.sh

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
close="\e[0m"

while true
do
    clear

    echo -e "${blue}linux devops toolkit${close}"
    echo "----------------------------------"
    echo "1. package installation"
    echo "2. service management"
    echo "3. user management"
    echo "4. monitoring"
    echo "5. backup and rotation"
    echo "6. exit"
    echo "----------------------------------"

    read -p "enter choice: " choice

    case $choice in

        1)
            package_install
            ;;

        2)
            status_check
            ;;

        3)
            user_menu
            ;;

        4)
            monitoring_menu
            ;;

        5)
            backup_menu
            ;;

        6)
            exit 0
            ;;

        *)
            echo -e "${red}invalid option${close}"
            ;;
    esac

    read -p "press enter to continue"

done
