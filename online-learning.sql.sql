CREATE DATABASE OnlineLearning;
USE OnlineLearning;

CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    total_sessions INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Result (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    mid_score FLOAT,
    final_score FLOAT,
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id, course_id) REFERENCES Enrollment(student_id, course_id)
);

INSERT INTO Student (full_name, birth_date, email) VALUES
('Nguyen Van A', '2000-01-01', 'a@gmail.com'),
('Tran Thi B', '2001-02-02', 'b@gmail.com'),
('Le Van C', '2002-03-03', 'c@gmail.com'),
('Pham Thi D', '2000-04-04', 'd@gmail.com'),
('Hoang Van E', '1999-05-05', 'e@gmail.com');

INSERT INTO Instructor (full_name, email) VALUES
('Teacher 1', 't1@gmail.com'),
('Teacher 2', 't2@gmail.com'),
('Teacher 3', 't3@gmail.com'),
('Teacher 4', 't4@gmail.com'),
('Teacher 5', 't5@gmail.com');

INSERT INTO Course (course_name, description, total_sessions, instructor_id) VALUES
('SQL Basic', 'Hoc SQL co ban', 20, 1),
('Web Dev', 'Lap trinh web', 25, 2),
('JavaScript', 'JS nang cao', 30, 3),
('Database', 'Quan ly CSDL', 15, 4),
('UI/UX', 'Thiet ke giao dien', 10, 5);

INSERT INTO Enrollment (student_id, course_id, enroll_date) VALUES
(1,1,'2024-01-01'),
(1,2,'2024-01-02'),
(2,1,'2024-01-03'),
(3,3,'2024-01-04'),
(4,4,'2024-01-05');

INSERT INTO Result (student_id, course_id, mid_score, final_score) VALUES
(1,1,7,8),
(1,2,6,7),
(2,1,5,6),
(3,3,8,9),
(4,4,7,7);

UPDATE Student
SET email = 'newemail@gmail.com'
WHERE student_id = 1;

UPDATE Course
SET description = 'SQL tu co ban den nang cao'
WHERE course_id = 1;

UPDATE Result
SET final_score = 9
WHERE student_id = 1 AND course_id = 1;

DELETE FROM Enrollment
WHERE student_id = 4 AND course_id = 4;

DELETE FROM Result
WHERE student_id = 4 AND course_id = 4;

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;

SELECT s.full_name, c.course_name, r.final_score
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Course c ON r.course_id = c.course_id;
