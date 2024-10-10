#!/bin/bash

# Define color codes ${PINK} for PINK and ${RESET} to reset
PINK='\033[38;2;255;105;180m'  # Pink RGB color
NC='\033[0m'                   # No Color (reset)

# Check if script is run with sudo privileges
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run with sudo privileges. Please run as root or use sudo."
  exit 1
fi

# Check if an IP address was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP=$1
OUTPUT_FILE="nmap_scan.txt"

# Start fresh with the output file
echo "Starting Nmap scan for $IP" > $OUTPUT_FILE

# 1. Run a basic Nmap scan to get initial results (only show in terminal, not in output file)
echo "Running basic Nmap scan (output only in terminal)..."
nmap $IP

# 2. Run an initial scan to find open TCP ports (saving results to the file)
echo "Running full TCP scan on all ports..." | tee -a $OUTPUT_FILE

# Run Nmap and parse the output to get open TCP ports only
OPEN_PORTS=$(nmap -p- --open -T4 $IP -oG - | grep 'Ports:' | awk -F'Ports: ' '{print $2}' | grep -oE '[0-9]+/open' | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//')

# Debugging: Display the content of OPEN_PORTS to check if it's correct
echo "DEBUG: Extracted open TCP ports: ${PINK} $OPEN_PORTS ${RESET}"

# 3. Check if there are any open TCP ports before proceeding
if [ -z "$OPEN_PORTS" ]; then
    echo "No open TCP ports found on $IP." | tee -a $OUTPUT_FILE
else
    echo "Open TCP ports: $OPEN_PORTS" | tee -a $OUTPUT_FILE

    # Ensure port list is formatted correctly before running the detailed scan
    OPEN_PORTS=$(echo "$OPEN_PORTS" | sed 's/,$//')  # Ensure no trailing commas

    # Debugging: Display the command that will be run to ensure correctness
    echo "DEBUG: Running detailed scan with the command: nmap -sC -A -p$OPEN_PORTS $IP"

    # Run the detailed scan on open TCP ports
    echo "Running detailed scan on open TCP ports..." | tee -a $OUTPUT_FILE
    ${PINK} nmap -sC -A -p"$OPEN_PORTS" "$IP"${RESET} >> $OUTPUT_FILE
fi

# 4. Run a UDP scan
echo "Running UDP scan..." | tee -a $OUTPUT_FILE
${PINK} nmap -sU -T4 --top-ports 100 "$IP" ${RESET} >> $OUTPUT_FILE

# 5. Finish up
echo "Scan complete. Results saved in ${PINK} $OUTPUT_FILE " ${RESET}
