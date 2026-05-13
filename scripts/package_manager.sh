#!/bin/bash

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
close="\e[0m"

package_install() {

echo -e "${blue}what package do you want to install?${close}"

read package

if rpm -q "$package" &>/dev/null
then
    echo -e "${yellow}$package is already installed${close}"

else

    echo -e "${blue}installing $package${close}"

    if sudo dnf install "$package" -y
    then
        echo -e "${green}$package installed successfully${close}"

        echo "$(date) installed package $package" >> logs/system.log

    else
        echo -e "${red}failed to install $package${close}"

        echo "$(date) failed package installation $package" >> logs/system.log
    fi

fi
}
