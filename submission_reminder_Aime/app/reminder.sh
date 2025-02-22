#!/bin/bash

# Source environment variables and functions
source ./config/config.env
source ./modules/functions.sh

# Define the submissions file path
submissions_file="./assets/submissions.txt"

# Display assignment details
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

# Check submissions
check_submissions $submissions_file
