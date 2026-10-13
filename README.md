# QueryQuest — Smart Campus Resource Management System

## Overview
QueryQuest is a MySQL-based database project for managing student records, campus resources, and borrowing transactions.

## Features
- Student and department management
- Campus resource inventory
- Borrowing, due-date, and return-date records
- Overdue-resource reports
- SQL queries for analysing borrowing activity

## Database Schema
The project contains four tables:
- `departments`
- `students`
- `resources`
- `borrow_transactions`

Primary keys, foreign keys, and CHECK constraints help maintain data integrity.

## Technologies
- MySQL 8.4
- SQL
- Git and GitHub

## Project Structure
```text
QueryQuest/
├── README.md
├── .gitignore
└── sql/
    ├── 01_create_tables.sql
    ├── 02_sample_data.sql
    ├── 03_reports.sql
    └── queryquest_backup.sql
```

## Setup Instructions

1. Install MySQL Server.
2. Open Terminal and log in to MySQL:

   ```bash
   mysql -u root -p
   ```

3. Exit the MySQL prompt with `exit;`.
4. Import the complete database backup from Terminal:

   ```bash
   mysql -u root -p < sql/queryquest_backup.sql
   ```

5. Run the reports:

   ```bash
   mysql -u root -p < sql/03_reports.sql
   ```

Run these commands from the QueryQuest project directory.

**Note:** The backup is the complete dataset for the current project. The other SQL files document the schema, starter data, and reports.

## Sample Data
The database contains fictional student records, three departments, eight campus resources, and borrowing transactions for demonstration.

## Future Improvements
- Automatically update available quantities when resources are borrowed or returned.
- Add a web-based dashboard.
- Add user authentication and borrowing history.

## Author
Student database management project.
