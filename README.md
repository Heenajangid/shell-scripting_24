# Memory Usage Reporting Script

This script collects memory usage data on a Linux system and logs it to a `.tsv` file with the current time and memory usage percentage.

## Features

- Logs memory usage percentage along with the date and time.
- Data is saved in a `.tsv` (tab-separated values) format, which can be opened in any text editor or spreadsheet software.

## Prerequisites

Before running the script, ensure the following:

- A Linux-based operating system.
- Bash shell (this is the default on most Linux distributions).
- Basic command-line knowledge.

## Installation

### 1. Clone the Repository

Clone the repository to your local machine using Git. Open a terminal and run the following command:

```bash
git clone https://github.com/your-username/repository-name.git
```
## Bash File
```
#!/bin/bash

# Step 1: Get the amount of used memory (in MB)
memUsed=$(free -m | head -2 | tail -1 | awk '{print $3}')

# Step 2: Get the total memory (in MB)
totalMem=$(free -m | head -2 | tail -1 | awk '{print $2}')

# Step 3: Calculate the percentage of memory used
memUsedPercentage=$(expr $memUsed \* 100 / $totalMem)

# Step 4: Log the date, time, and memory usage percentage to a file (mem_report.tsv)
echo -e "$(date +"%r %D")\t$memUsedPercentage" >> mem_report.tsv
```
## Commands Usage
`free -m`: Displays memory usage in megabytes. The command is used to extract used memory ($3) and total memory ($2).
`head -2 | tail -1`: These commands are used to select the second line of the free -m output, where the memory information is located.
`awk '{print $3}'`: Extracts the third column (used memory) from the free -m output.
`awk '{print $2}'`: Extracts the second column (total memory) from the free -m output.
`expr $memUsed \* 100 / $totalMem`: Calculates the memory usage percentage.
`echo -e "$(date +"%r %D")\t$memUsedPercentage" >> mem_report.tsv`: Logs the date and memory usage percentage to the mem_report.tsv file in tab-separated format.
