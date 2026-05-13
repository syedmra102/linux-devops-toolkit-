# linux devops toolkit

linux devops toolkit is a bash based automation project built for linux administration and junior devops operations.

this project automates common linux operational tasks like:

- package installation
- service management
- user and group management
- system monitoring
- backup automation
- backup rotation
- log cleanup
- alerting and logging

the toolkit is fully menu driven and designed for beginners learning linux, shell scripting, devops, and cloud operations.

---

# features

## package management
- install packages using dnf
- check if package already exists
- log installation activity

## service management
- check service status
- restart services
- enable and start stopped services

## user management
- create users
- create groups
- add users to groups
- create multiple users at once

## monitoring
- disk usage monitoring
- memory usage monitoring
- cpu usage monitoring
- nginx monitoring
- port monitoring
- alert logging
- email alerts

## backup management
- create compressed backups
- automatic backup rotation
- automatic log cleanup

---

# technologies used

- bash scripting
- linux
- systemctl
- cron jobs
- awk
- grep
- sed
- tar
- ssh
- dnf

---

# project structure

```bash
linux-devops-toolkit/

main.sh

scripts/
├── backup_manager.sh
├── monitoring.sh
├── package_manager.sh
├── service_manager.sh
├── user_management.sh

logs/
├── system.log

backup/
```

---
# how to run
-clone repository

-git clone https://github.com/yourusername/linux-devops-toolkit.git

# move into project
-cd linux-devops-toolkit

# give execute permissions
-chmod +x main.sh

-chmod +x scripts/*.sh

# run project
-./main.sh

# screenshots

# future improvements
-aws cli integration

-docker monitoring

-terraform automation

-slack alerts

-email notification improvements

-logrotate integration

-kubernetes monitoring

# author
-imran

# github:



