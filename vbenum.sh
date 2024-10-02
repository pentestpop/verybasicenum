#!/bin/bash

# Function to print title and run command
run_command() {
  echo -e "\n$1"   # Print title
  eval "$2"         # Execute the command
}

# Enumeration tasks with titles
run_command "HOSTNAME:" "hostname"
run_command "WRITABLE DIRECTORIES:" "find / -writable -type d 2>/dev/null"
run_command "USERS:" "cat /etc/passwd | cut -d : -f 1"
