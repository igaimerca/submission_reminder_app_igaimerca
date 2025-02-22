# Submission Reminder App

This project is a simple shell script-based application that helps students track their assignment submission deadlines.

## Features
- Alerts students about upcoming assignment deadlines.
- Reads student submissions from a file and identifies those who haven't submitted.
- Fully automated setup script to create the necessary environment.

## Directory Structure
```
submission_reminder_{yourName}/
│── app/
│   └── reminder.sh
│── modules/
│   └── functions.sh
│── assets/
│   └── submissions.txt
│── config/
│   └── config.env
│── startup.sh
```

## Setup Instructions

1. **Clone the repository** (Replace `igaimerca` with yours):
  ```bash
  git clone https://github.com/igaimerca/submission_reminder_app_igaimerca.git
  cd submission_reminder_app_igaimerca
  ```

2. **Make the setup script executable**:
  ```bash
  chmod +x create_environment.sh
  ```

3. **Run the setup script**:
  ```bash
  ./create_environment.sh
  ```

4. **Navigate into the created directory**:
  ```bash
  cd submission_reminder_{yourName}
  ```

5. **Run the application**:
  ```bash
  ./startup.sh
  ```
