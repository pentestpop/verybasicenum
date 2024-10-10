#!/bin/bash

# Function to print title and run command
run_command() {
  echo -e "\n$1"   # Print title
  eval "$2"         # Execute the command
}

# Enumeration tasks with titles
run_command "HOSTNAME:" "hostname"
run_command "SYSTEM INFO:" "cat /etc/issue; cat /etc/*-release; uname -r; arch"
run_command "ANYTHING IN /OPT:" "ls /opt"
run_command "ANYTHING IN /VAR/MAIL:" "ls /var/mail"
run_command "ANYTHING IN /HOME:" "ls home"
run_command "USERS:" "cat /etc/passwd | cut -d : -f 1"
run_command "SUID BINARIES:" "find / -perm -u=s -type f 2>/dev/null"
run_command "ODD FILES:" "find / -type f -name -o -name "*.txt" -o -name "*.kdbx" -o -name "*.zip" 2>/dev/null"
run_command "WRITABLE DIRECTORIES:" "find / -writable -type d 2>/dev/null"
run_command "ROOT Processes:" "ps aux | grep -i 'root' --color=auto"

echo "Now run 'sudo -l', 'pspy64', and 'linpeas.sh'."


# consider adding "crontab -l" and "ls -lah /etc/cron*" among others
    
