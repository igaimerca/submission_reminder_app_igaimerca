#!/bin/bash

# Prompt the user to enter their name
read -p "Enter your name: " userName

# Define the base directory name using the user's name
BASE_DIR="submission_reminder_${userName}"

# Create necessary directories
mkdir -p "$BASE_DIR/app"
mkdir -p "$BASE_DIR/modules"
mkdir -p "$BASE_DIR/assets"
mkdir -p "$BASE_DIR/config"

# Create the main reminder script
echo '#!/bin/bash

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
check_submissions $submissions_file' > "$BASE_DIR/app/reminder.sh"

# Create the functions script
echo '#!/bin/bash

# Function to check submissions
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Read the submissions file line by line
    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if the assignment is not submitted
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}' > "$BASE_DIR/modules/functions.sh"

# Create the environment configuration file
echo 'ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > "$BASE_DIR/config/config.env"

# Create the submissions file
echo 'student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
John, Shell Navigation, submitted
Emma, Git, not submitted
Liam, Shell Basics, submitted
Olivia, Git, submitted
Noah, Shell Navigation, not submitted
Sophia, Shell Basics, submitted' > "$BASE_DIR/assets/submissions.txt"

# Create the startup script
echo '#!/bin/bash

# Start the Submission Reminder App
echo "Starting Submission Reminder App..."
bash ./app/reminder.sh' > "$BASE_DIR/startup.sh"

# Make the scripts executable
chmod +x "$BASE_DIR/app/reminder.sh"
chmod +x "$BASE_DIR/modules/functions.sh"
chmod +x "$BASE_DIR/startup.sh"

# Notify the user that the environment setup is complete
echo "Environment setup complete. Navigate to $BASE_DIR and run ./startup.sh to start the app."
