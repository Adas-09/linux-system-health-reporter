# Linux System Health Reporter

A beginner-friendly Bash project that collects basic Linux system information and saves it in a readable text report.

## Features

- Shows the computer's hostname, date, kernel version, and operating system.
- Displays disk usage for the root filesystem.
- Displays memory usage.
- Lists the five processes using the most CPU.
- Saves the output to `system-report.txt` (or a filename you choose).

## Requirements

- A Linux system or Linux-compatible shell environment.
- Bash and common Linux utilities: `hostname`, `date`, `uname`, `df`, `free`, `ps`, and `head`.
- Git and a GitHub account if you want to publish the project.

## Files

- `system_report.sh` — the Bash script.
- `system-report.txt` — an example generated report. Your own report will vary by computer.
- `README.md` — this documentation.

## How to run

1. Open a terminal in this project folder.
2. Make the script executable:

   ```bash
   chmod +x system_report.sh
   ```

3. Run it:

   ```bash
   ./system_report.sh
   ```

4. Read the generated report:

   ```bash
   cat system-report.txt
   ```

You can also choose a different output filename:

```bash
./system_report.sh my-report.txt
```

## Example output

The exact values depend on the Linux computer where the script runs.

```text
==================================
       Linux System Health Report
==================================

Hostname: workshop-pc
Date: Tue Oct 13 12:00:00 UTC 2026
Kernel: 6.x.x
Operating System: Example Linux distribution

Disk Usage:
/dev/sda1       100G   45G   55G  45% /

Memory Usage:
               total        used        free      shared  buff/cache   available
Mem:             8Gi        3.2Gi       2.1Gi       200Mi       2.7Gi       4.5Gi
Swap:              0B          0B          0B

Top Processes (by CPU):
    PID COMMAND         %CPU %MEM
   1234 example          4.0  1.2

==================================
Report generated successfully.
```

The example values above are illustrative, not readings from your computer.

## Safety and privacy

Run this script only on a computer you own or are authorized to inspect. The script only reads basic system information and writes a local text report. Review the report before publishing it: hostnames, process names, and system details may reveal information about your computer. Do not publish a machine-specific report publicly unless you have checked it and intend to share it.

## Learning goals

- Practise running Linux commands.
- Learn how to combine commands in a Bash script.
- Redirect command output into a text file.
- Use Git and GitHub to keep and share a project.
