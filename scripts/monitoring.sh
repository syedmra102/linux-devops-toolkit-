#!/bin/bash

threshold_disk=80
threshold_mem=80
threshold_cpu=80

log_file="logs/system.log"
email="zada44919@gmail.com"
host="ubuntu"

check_disk() {

disk=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$disk" -gt "$threshold_disk" ]
then
    message="$(date) [$host] disk alert usage ${disk}%"

    echo "$message" >> "$log_file"

    echo "$message" | mail -s "disk alert" "$email"

    echo "$message"
fi
}

check_memory() {

mem=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

if [ "$mem" -gt "$threshold_mem" ]
then
    message="$(date) [$host] memory alert usage ${mem}%"

    echo "$message" >> "$log_file"

    echo "$message" | mail -s "memory alert" "$email"

    echo "$message"
fi
}

check_cpu() {

cpu=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}')

cpu_int=${cpu%.*}

if [ "$cpu_int" -gt "$threshold_cpu" ]
then
    message="$(date) [$host] cpu alert usage ${cpu}%"

    echo "$message" >> "$log_file"

    echo "$message" | mail -s "cpu alert" "$email"

    echo "$message"
fi
}

check_nginx() {

if systemctl is-active --quiet nginx
then
    echo "$(date) [$host] nginx running" >> "$log_file"

else
    message="$(date) [$host] nginx down"

    echo "$message" >> "$log_file"

    echo "$message" | mail -s "nginx down" "$email"

    sudo systemctl restart nginx
fi
}

check_port() {

if ss -tuln | grep -q ":80"
then
    echo "$(date) [$host] port 80 open" >> "$log_file"

else
    message="$(date) [$host] port 80 closed"

    echo "$message" >> "$log_file"

    echo "$message" | mail -s "port 80 down" "$email"
fi
}

monitoring_menu() {

check_disk
check_memory
check_cpu
check_nginx
check_port

echo "monitoring completed"
}
