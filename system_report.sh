#!/usr/bin/env bash
# Linux System Health Reporter
# Collects basic system information and writes it to system-report.txt.

set -u

REPORT_FILE="${1:-system-report.txt}"

get_value() {
    # Run a command if available; show a helpful fallback if it is not.
    "$@" 2>/dev/null || printf 'Not available\n'
}

{
    echo "=================================="
    echo "       Linux System Health Report"
    echo "=================================="
    echo
    printf 'Hostname: '
    get_value hostname
    printf 'Date: '
    get_value date
    printf 'Kernel: '
    get_value uname -r
    printf 'Operating System: '
    if [ -r /etc/os-release ]; then
        . /etc/os-release
        printf '%s\n' "${PRETTY_NAME:-Unknown}"
    else
        echo "Unknown"
    fi
    echo

    echo "Disk Usage:"
    if command -v df >/dev/null 2>&1; then
        df -h / 2>/dev/null | awk 'NR == 1 || NR == 2'
    else
        echo "df command not available"
    fi
    echo

    echo "Memory Usage:"
    if command -v free >/dev/null 2>&1; then
        free -h 2>/dev/null
    elif [ -r /proc/meminfo ]; then
        grep -E '^(MemTotal|MemAvailable|MemFree):' /proc/meminfo
    else
        echo "Memory information not available"
    fi
    echo

    echo "Top Processes (by CPU):"
    if command -v ps >/dev/null 2>&1; then
        ps -eo pid,comm,%cpu,%mem --sort=-%cpu 2>/dev/null | head -n 6
    else
        echo "ps command not available"
    fi
    echo
    echo "=================================="
    echo "Report generated successfully."
} > "$REPORT_FILE"

printf 'System health report saved to: %s\n' "$REPORT_FILE"
