-- QueryQuest: Smart Campus Resource Management System
-- Database schema

CREATE DATABASE IF NOT EXISTS queryquest;
USE queryquest;

CREATE TABLE IF NOT EXISTS departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE IF NOT EXISTS resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    resource_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    total_quantity INT NOT NULL DEFAULT 1,
    available_quantity INT NOT NULL DEFAULT 1,
    CHECK (total_quantity >= 0),
    CHECK (available_quantity >= 0),
    CHECK (available_quantity <= total_quantity)
);

CREATE TABLE IF NOT EXISTS borrow_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    resource_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id),
    CHECK (due_date >= borrow_date),
    CHECK (return_date IS NULL OR return_date >= borrow_date)
);
