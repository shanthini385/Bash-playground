Bash Playground

\================

  

Welcome to the Bash Scripts Hub repository—a collection of useful Bash scripts designed to automate tasks, enhance productivity, and serve as examples for shell scripting enthusiasts.

  

Overview

\--------

This repository contains a variety of Bash scripts that cover:

  
  - Automation: Simplify repetitive tasks and streamline workflows.

  - Utilities: Handy command-line tools for file management, text processing, and system monitoring.

  - DevOps & System Administration: Scripts to help manage deployments and maintain servers.

  - Learning: Examples and best practices for writing efficient shell scripts.

## Script Descriptions

### 1. Elevated Access Notification Script
Automates notifications regarding the revocation of elevated privileges. It parses a CSV file with validity dates and sends out HTML email alerts:
- **Today:** Notifies that privileges will be revoked at noon.
- **3, 7, or 10 days ahead:** Sends reminder emails.
- **Overdue:** Alerts the Unix Team to review expired dates.

### 2. Server Health Monitoring & Alerting
Monitors key server metrics such as CPU, memory, and disk usage. If any metric exceeds its defined threshold, the script automatically sends an alert email to the administrator. Use this to ensure proactive server management.

### 3. Automated Log Rotation and Archiving
Manages log files by compressing and archiving them periodically. The script rotates logs by moving them to an archive directory with a timestamp, then truncates the original logs. This helps maintain disk space and preserves historical data for future reference.

### 4. Continuous Deployment Pipeline
Automates the deployment process by:
- Pulling the latest code from a repository.
- Building and testing the application.
- Deploying the updated code using tools like `rsync`.
This script is designed to streamline continuous integration and deployment workflows.

### 5. Container Cleanup and Maintenance
A simple maintenance tool for Docker environments. It cleans up:
- Stopped containers
- Unused images
- Dangling volumes and networks
Run this script periodically to reclaim disk space and keep your containerized applications running smoothly.

### 6. Backup and Recovery Automation
Creates compressed backups of critical data (directories, databases, etc.) and optionally uploads them to a remote location. This script is ideal for ensuring that backups are up-to-date and recoverable in the event of data loss.


Getting Started

\---------------

1\. Prerequisites:

   - Ensure you are using a Unix-like operating system with Bash installed.

   - Some scripts may require execution permissions. To enable execution, run:

         chmod +x 

  

2\. Installation:

   Clone the repository to your local machine:

         git clone https://github.com/shanthini385/Bash-playground.git

         cd bash-playground

  

3\. Running a Script:

   Navigate to the "scripts/" directory, set execution permissions (if needed), and run the script:

         cd scripts

         chmod +x example.sh

         ./example.sh

  

License

\-------

This repository is licensed under the MIT License. See the LICENSE file for more details.

  

Contact

\-------

If you have any questions or suggestions, feel free to open an issue or contact us at: s10031996@gmail.com

  

Thank you for using Bash Scripts Hub. Happy scripting!
