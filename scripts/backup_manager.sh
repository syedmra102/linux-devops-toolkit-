#!/bin/bash

log_dest="/var/log"
dest="backup/nginx_backup"
source="/usr/share/nginx/html/index.html"

backup() {

mkdir -p "$dest"

tar -czvf "$dest/backup-$(date '+%Y-%m-%d_%H-%M-%S').tar.gz" "$source"

echo "$(date) backup completed" >> logs/system.log
}

backup_rotation() {

find "$dest" -type f -name "*.tar.gz" -mtime +7 -delete

echo "$(date) old backups deleted" >> logs/system.log
}

log_rotation() {

find "$log_dest" -type f -name "*.log" -mtime +7 -delete

echo "$(date) old logs deleted" >> logs/system.log
}

backup_menu() {

while true
do
    clear

    echo "1. create backup"
    echo "2. backup rotation"
    echo "3. log rotation"
    echo "4. back"

    read -p "enter choice: " choice

    case $choice in

        1)
            backup
            ;;

        2)
            backup_rotation
            ;;

        3)
            log_rotation
            ;;

        4)
            break
            ;;

        *)
            echo "invalid option"
            ;;
    esac

    read -p "press enter to continue"

done
}
