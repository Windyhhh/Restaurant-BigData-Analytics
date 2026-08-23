#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Restaurant Analysis System - Interactive Demo Menu (Python Version)
Support Windows and Linux systems
"""

import os
import sys
import subprocess
from pathlib import Path

# Color definitions (Windows and Linux compatible)
class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def clear_screen():
    """Clear screen"""
    os.system('cls' if os.name == 'nt' else 'clear')

def print_menu():
    """Display menu"""
    clear_screen()
    print(f"{Colors.BLUE}{'='*60}{Colors.ENDC}")
    print(f"{Colors.BLUE}  Restaurant Analysis System - Interactive Demo Menu{Colors.ENDC}")
    print(f"{Colors.BLUE}{'='*60}{Colors.ENDC}")
    print()

    print(f"{Colors.GREEN}[Phase 1] Service Startup & Data Preparation{Colors.ENDC}")
    print("  1. Start all big data services (Hadoop/HBase/Hive)")
    print("  2. Upload raw data to HDFS")
    print("  3. Query raw data in HDFS")
    print()

    print(f"{Colors.GREEN}[Phase 2] Data Cleaning & Processing{Colors.ENDC}")
    print("  4. Run MapReduce data cleaning task")
    print()

    print(f"{Colors.GREEN}[Phase 3] HBase Real-time Storage & Query{Colors.ENDC}")
    print("  5. Create HBase table")
    print("  6. Import cleaned data to HBase")
    print("  7. Query HBase data")
    print()

    print(f"{Colors.GREEN}[Phase 4] Hive Data Analysis{Colors.ENDC}")
    print("  8. Create Hive table and load data")
    print("  9. Execute Hive data analysis query")
    print()

    print(f"{Colors.GREEN}[Service Management]{Colors.ENDC}")
    print("  10. Stop all services")
    print("  0.  Exit program")
    print()
    print(f"{Colors.BLUE}{'='*60}{Colors.ENDC}")

def run_command(cmd, description):
    """Run command"""
    print(f"{Colors.YELLOW}Running: {description}...{Colors.ENDC}")
    print(f"Command: {cmd}")
    print()

    try:
        result = subprocess.run(cmd, shell=True, cwd='.')
        if result.returncode == 0:
            print(f"{Colors.GREEN}[OK] {description} completed successfully{Colors.ENDC}")
        else:
            print(f"{Colors.RED}[FAILED] {description} failed{Colors.ENDC}")
    except Exception as e:
        print(f"{Colors.RED}[ERROR] Execution error: {e}{Colors.ENDC}")

def execute_option(choice):
    """Execute selected operation"""
    options = {
        '1': ('Start all big data services', './start_all_services.sh'),
        '2': ('Upload raw data to HDFS', './hdfs_setup.sh'),
        '3': ('Query raw data in HDFS', './hdfs_query.sh'),
        '4': ('Run MapReduce data cleaning task', './run_mapreduce.sh'),
        '5': ('Create HBase table', './hbase_setup.sh'),
        '6': ('Import data to HBase', './hbase_import.sh'),
        '7': ('Query HBase data', './hbase_query.sh'),
        '8': ('Create Hive table and load data', 'hive -f hive_setup.sql'),
        '9': ('Execute Hive data analysis query', 'hive -f hive_analysis.sql'),
        '10': ('Stop all services', './stop_all_services.sh'),
    }

    if choice in options:
        description, cmd = options[choice]
        run_command(cmd, description)
    elif choice == '0':
        print(f"{Colors.GREEN}Thank you for using. Goodbye!{Colors.ENDC}")
        sys.exit(0)
    else:
        print(f"{Colors.RED}Invalid choice. Please try again!{Colors.ENDC}")

def main():
    """Main program"""
    while True:
        print_menu()
        try:
            # Get user input with EOF exception handling
            try:
                choice = input(f"{Colors.CYAN}Select operation (0-10): {Colors.ENDC}").strip()
            except EOFError:
                print(f"\n{Colors.RED}[ERROR] Input stream closed. Exiting...{Colors.ENDC}")
                sys.exit(1)

            if not choice:
                continue

            print()
            execute_option(choice)

            print()
            # Wait for user to continue with EOF exception handling
            try:
                input(f"{Colors.GREEN}Press Enter to continue...{Colors.ENDC}")
            except EOFError:
                print(f"\n{Colors.RED}[ERROR] Input stream closed. Exiting...{Colors.ENDC}")
                sys.exit(1)

        except KeyboardInterrupt:
            print(f"\n{Colors.YELLOW}Program interrupted{Colors.ENDC}")
            sys.exit(0)
        except Exception as e:
            print(f"{Colors.RED}Error occurred: {e}{Colors.ENDC}")
            try:
                input(f"{Colors.GREEN}Press Enter to continue...{Colors.ENDC}")
            except EOFError:
                sys.exit(1)

if __name__ == '__main__':
    main()

