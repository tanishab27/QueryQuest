-- QueryQuest: Smart Campus Resource Management System
-- SQL Reports

USE queryquest;

-- 1. Display all students with their departments
SELECT s.student_id, s.student_name, s.email, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id
ORDER BY s.student_id;

-- 2. Display available campus resources
SELECT resource_name, category, total_quantity, available_quantity
FROM resources
ORDER BY resource_name;

-- 3. Show borrowing transactions with student and resource details
SELECT bt.transaction_id, s.student_name, r.resource_name,
       bt.borrow_date, bt.due_date, bt.return_date
FROM borrow_transactions bt
JOIN students s ON bt.student_id = s.student_id
JOIN resources r ON bt.resource_id = r.resource_id
ORDER BY bt.transaction_id;

-- 4. Show overdue unreturned resources
SELECT bt.transaction_id, s.student_name, r.resource_name, bt.due_date
FROM borrow_transactions bt
JOIN students s ON bt.student_id = s.student_id
JOIN resources r ON bt.resource_id = r.resource_id
WHERE bt.return_date IS NULL
  AND bt.due_date < CURRENT_DATE()
ORDER BY bt.due_date;

-- 5. Count students in each department
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC;

-- 6. Count borrowing transactions for each resource
SELECT r.resource_name, COUNT(bt.transaction_id) AS times_borrowed
FROM resources r
LEFT JOIN borrow_transactions bt ON r.resource_id = bt.resource_id
GROUP BY r.resource_id, r.resource_name
ORDER BY times_borrowed DESC;
