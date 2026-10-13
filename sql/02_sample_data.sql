-- QueryQuest: Sample Data
USE queryquest;

INSERT IGNORE INTO departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics');

INSERT IGNORE INTO students (student_id, student_name, email, department_id) VALUES
(1, 'Supriya Patel', 'supriya234@example.com', 1),
(2, 'Sandeep Shetty', 'sandeep09@example.com', 2),
(3, 'Sanjana Dixit', 's.dixit@example.com', 1),
(4, 'Rohan Rao', 'rohan56@example.com', 3),
(5, 'Ishani Sharma', 'ishani88@example.com', 2);

INSERT IGNORE INTO resources
(resource_id, resource_name, category, total_quantity, available_quantity) VALUES
(1, 'Database Systems Textbook', 'Book', 10, 10),
(2, 'Arduino Starter Kit', 'Equipment', 5, 5),
(3, 'Raspberry Pi Kit', 'Equipment', 4, 4),
(4, 'Computer Networks Textbook', 'Book', 8, 8),
(5, 'Wireless Mouse', 'Accessory', 12, 12),
(6, 'Web Development Textbook', 'Book', 6, 6),
(7, 'HDMI Adapter', 'Accessory', 7, 7),
(8, 'Electronics Lab Kit', 'Equipment', 5, 5);
