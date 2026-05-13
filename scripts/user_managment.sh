#!/bin/bash

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
close="\e[0m"

user_creation() {

echo -e "${blue}enter username${close}"

read user

if id "$user" &>/dev/null
then
    echo -e "${yellow}user already exists${close}"

else

    sudo adduser "$user"

    if [ $? -eq 0 ]
    then
        sudo passwd "$user"

        echo -e "${green}user created successfully${close}"

        echo "$(date) created user $user" >> logs/system.log

    else
        echo -e "${red}failed to create user${close}"
    fi

fi
}

group_creation() {

echo -e "${blue}enter group name${close}"

read group

if getent group "$group" &>/dev/null
then
    echo -e "${yellow}group already exists${close}"

else

    sudo groupadd "$group"

    if [ $? -eq 0 ]
    then
        echo -e "${green}group created successfully${close}"

        echo "$(date) created group $group" >> logs/system.log

    else
        echo -e "${red}failed to create group${close}"
    fi

fi
}

add_user_to_group() {

echo -e "${blue}enter group name${close}"

read group_add

if ! getent group "$group_add" &>/dev/null
then
    sudo groupadd "$group_add"
fi

echo -e "${blue}enter username${close}"

read user_add

if ! id "$user_add" &>/dev/null
then
    sudo adduser "$user_add"
    sudo passwd "$user_add"
fi

sudo gpasswd -a "$user_add" "$group_add" &>/dev/null

if [ $? -eq 0 ]
then
    echo -e "${green}user added to group successfully${close}"

    echo "$(date) added user $user_add to group $group_add" >> logs/system.log

else
    echo -e "${red}failed to add user to group${close}"
fi
}

multiple_users_creation() {

echo -e "${blue}enter usernames${close}"

read -a users

for u in "${users[@]}"
do

    if id "$u" &>/dev/null
    then
        echo -e "${yellow}$u already exists${close}"

    else

        sudo adduser "$u"

        if [ $? -eq 0 ]
        then
            sudo passwd "$u"

            echo -e "${green}$u created successfully${close}"

            echo "$(date) created user $u" >> logs/system.log

        else
            echo -e "${red}failed to create $u${close}"
        fi

    fi

done
}

user_menu() {

while true
do
    clear

    echo "1. create user"
    echo "2. create group"
    echo "3. add user to group"
    echo "4. create multiple users"
    echo "5. back"

    read -p "enter choice: " choice

    case $choice in

        1)
            user_creation
            ;;

        2)
            group_creation
            ;;

        3)
            add_user_to_group
            ;;

        4)
            multiple_users_creation
            ;;

        5)
            break
            ;;

        *)
            echo -e "${red}invalid option${close}"
            ;;
    esac

    read -p "press enter to continue"

done
}
