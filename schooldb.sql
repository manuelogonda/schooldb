DROP DATABASE IF EXISTS schooldb;
CREATE DATABASE schooldb;
USE schooldb;
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    percent_popularity INT
);
INSERT INTO Courses (course_name, percent_popularity)
VALUES
('Computer Science', 89),
('Pure Mathematics', 90),
('Physics', 75),
('Commerce', 80),
('Software Engineering', 95),
('Web Development', 92),
('Data Science', 89),
('Machine Learning', 88),
('English Literature', 70),
('Philosophy', 68),
('Economics', 88),
('Bio Chemistry', 78);
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    course_id INT,
    birth_date DATE NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO students (first_name, last_name, course_id, birth_date, enrollment_date) 
VALUES
('Jensen', 'Harrison', 1, '2004-05-15', '2025-09-01'),
('Manu', 'Smith', 2, '2005-09-30', '2025-09-01'),
('Jarel', 'Kito', 3, '2005-12-03', '2025-01-15'),
('Joan','Garcia', 4, '2005-03-10', '2025-09-01'),
('Myles', 'Davis', 5, '2004-11-11', '2025-01-15'),
('Eli', 'Martinez', 6, '2005-02-14', '2024-09-01'),
('Omar', 'Wilson', 7, '2004-09-05', '2024-09-01'),
('Liam', 'Anderson', 8, '2006-07-19', '2025-09-01'),
('Noah', 'Thomas', 1, '2004-01-25', '2024-01-15'),
('Sophia', 'White', 3, '2005-09-18', '2025-09-01'),
('Charlotte', 'Lewis', 6, '2004-08-08', '2025-09-01'),
('Amelia', 'Robinson', 7, '2005-03-03', '2024-09-01'),
('Evelyn', 'Perez', 1, '2005-11-14', '2025-09-01'),
('Abigail', 'Hall', 2, '2005-07-07', '2024-09-01'),
('Scarlett', 'Allen', 4, '2004-09-29', '2025-09-01'),
('Grace', 'Sanchez', 5, '2005-06-16', '2024-09-01'),
('Chloe', 'Wright', 6, '2005-12-05', '2025-01-15'),
('Victoria', 'King', 7, '2005-04-11', '2024-09-01'),
('Riley', 'Scott', 8, '2005-02-28', '2025-09-01'),
('Malo', 'Brown', 8, '2004-09-30', '2025-09-01');


CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    course_id INT, 
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO teachers (first_name, last_name, course_id, hire_date,salary)
VALUES
('Bruno', 'Johnson', 1, '2018-08-15', 155000),
('Alice', 'Williams', 2, '2016-06-20', 60000),
('David', 'Miller', 3, '2019-11-05', 52000),
('Eva', 'Davis', 1, '2017-03-12', 58000),
('Frank', 'Garcia', 4, '2020-01-25', 61000),
('Grace', 'Martinez', 6, '2015-09-30', 63000),
('Hannah', 'Rodriguez', 7, '2018-04-18', 59000),
('Ian-Gibbs', 'Lopez', 8, '2019-07-22', 57000),
('Bob', 'Kerkez', 5, '2017-09-01', 62000),
('Charley', 'Kimunto', 10, '2019-01-10', 54000),
('Diana', 'Lenza', 8, '2016-07-22', 65000),
('Ethan', 'White-wheetly', 11, '2020-02-14', 60000),
('Fiona', 'Harris', 9, '2015-03-30', 58000),
('George', 'Clark', 12, '2014-11-05',100000),
('Sam-Don', 'Walker', 5, '2019-09-01',34000);
CREATE TABLE Mentors(
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
INSERT INTO Mentors (student_id, teacher_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 15),
(10, 12),
(11, 9),
(12, 10),
(13, 11),
(14, 11),
(15, 7),
(16, 8),
(17, 1),
(18, 2),
(19, 3),
(20, 4);
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    teachers_id INT,
    FOREIGN KEY (teachers_id) REFERENCES teachers(teacher_id)
);
INSERT INTO departments (department_name, teachers_id)
VALUES
('Languages', 1),
('Mathematics', 2),
('Sciences', 3),
('Software Development', 10),
('Accountancy', 11),
('Bio Chemistry', 12);
CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_start VARCHAR(50) NOT NULL,
    mode VARCHAR(50) NOT NULL,
    class_venue VARCHAR(50) NOT NULL,
    duration VARCHAR(50) NOT NULL,
    course_id INT,
    FOREIGN KEY(course_id) REFERENCES Courses(course_id),
    teacher_id INT,
    FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id),
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO classes(class_start, mode, class_venue, duration, course_id, teacher_id, student_id, department_id)
VALUES('9 am morning', 'Physical', 'Room 101', '2 hours', 1, 5, 1,3),
('11 am morning', 'Online', 'Zoom', '1.5 hours', 2, 5, 3, 2),
('2 pm afternoon', 'Physical', 'Room 202', '2 hours', 3, 2, 3, 3),
('4 pm afternoon', 'Online', 'Google Meet', '1 hour', 4, 4, 4, 4),
('10 am morning', 'Physical', 'Room 303', '2.5 hours', 5, 2, 5, 1),
('1 pm afternoon', 'Online', 'Microsoft Teams', '1.5 hours', 8, 12, 16, 1),
('3 pm afternoon', 'Physical', 'Room 404', '2 hours', 7, 9, 17, 3),
('5 pm evening', 'Online', 'Zoom', '1 hour', 8, 8, 18, 6),
('7 am morning', 'Physical', 'Room 505', '2 hours', 9, 9, 9, 2),
('12 pm noon', 'Online', 'Google Meet', '1.5 hours', 10, 10, 10, 5),
('2 pm afternoon', 'Physical', 'Room 606', '2 hours', 11, 11, 11, 2),
('4 pm evening', 'Online', 'Microsoft Teams', '1 hour', 12, 12, 12, 3);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(50) NOT NULL,
    exam_date DATE NOT NULL,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    total_marks INT NOT NULL
);
INSERT INTO exams (exam_name, exam_date, course_id, total_marks)
VALUES
('Midterm Exam', '2025-10-15', 1, 100),
('Final Exam', '2025-12-20', 2, 100),
('CAT 1', '2025-09-30', 3, 50),
('CAT 2', '2025-11-15', 4, 50),
('Midterm Exam', '2025-10-10', 5, 100),
('Final Exam', '2025-12-18', 6, 100),
('Midterm Exam', '2025-10-20', 7, 100),
('Final Exam', '2025-12-22', 8, 100),
('Midterm Exam', '2025-10-25', 9, 100),
('CAT 3', '2025-12-24', 10, 100),
('Midterm Exam', '2025-10-30', 11, 100),
('Final Exam', '2025-12-26', 12, 100);
CREATE TABLE results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    exam_id INT,
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id),
    marks_obtained INT NOT NULL,
    grade VARCHAR(2) NOT NULL
);
INSERT INTO results (student_id, exam_id, marks_obtained, grade)
VALUES
(1, 1, 85, 'A'),
(2, 2, 78, 'B'),
(3, 3, 45, 'C'),
(4, 4, 50, 'B'),
(5, 5, 90, 'A'),
(6, 6, 88, 'A'),
(7, 7, 76, 'B'),
(8, 8, 92, 'A'),
(9, 9, 81, 'A'),
(10, 10, 79, 'B'),
(11, 11, 84, 'A'),
(12, 12, 87, 'A'),
(13, 1, 91, 'A'),
(14, 2, 73, 'B'),
(15, 3, 49, 'C'),
(16, 4, 55, 'B'),
(17, 5, 89, 'A'),
(18, 6, 90, 'A'),
(19, 7, 77, 'B'),
(20, 8, 93, 'A');

--schooldb.sql commands
--1 students table
SELECT first_name,last_name FROM students
WHERE enrollment_date > '2025-01-01'
ORDER BY first_name;

SELECT first_name, last_name, birth_date FROM students
WHERE birth_date BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY birth_date;

SELECT first_name, last_name FROM students
WHERE course_id >= 5 AND course_id <= 10
ORDER BY course_id;

SELECT first_name, last_name FROM students
WHERE last_name LIKE '%son' OR last_name LIKE '%t'OR last_name LIKE '%ez';

SELECT first_name, last_name FROM students
WHERE course_id IN (1, 2, 3, 4, 5);

SELECT course_id, MIN(*) AS min_students
FROM students
WHERE enrollment_date = '2025-09-01'
GROUP BY course_id
ORDER BY course_id;

SELECT course_id, COUNT(*) AS total_courses
FROM students
WHERE birth_date < '2005-01-01'
GROUP BY course_id
ORDER BY course_id DESC;

--2 teachers table
SELECT first_name, last_name FROM teachers
WHERE salary BETWEEN 40000 AND 70000
ORDER BY salary DESC, first_name;

SELECT first_name, last_name, hire_date FROM teachers
WHERE hire_date < '2018-01-01' OR last_name LIKE '%k%'
ORDER BY hire_date;

SELECT first_name, last_name, salary FROM teachers
WHERE salary > 60000 AND hire_date > '2016-01-01'
ORDER BY salary DESC;

SELECT first_name, last_name FROM teachers
WHERE last_name LIKE '%z' OR last_name LIKE '%___s' OR first_name LIKE '%n';

SELECT first_name, last_name, salary FROM teachers
WHERE salary IN (55000, 60000, 65000)
ORDER BY salary;

SELECT first_name, last_name, salary FROM teachers
WHERE salary + 10000 >= 70000 AND last_name LIKE '%l%'
ORDER BY first_name DESC,salary;

SELECT first_name,count(*) AS total_teachers
FROM teachers
WHERE course_id =< 5
GROUP BY first_name
ORDER BY first_name;

--3 courses table
SELECT course_name, percent_popularity FROM Courses
WHERE percent_popularity IN (85, 90, 95);
ORDER BY percent_popularity DESC;

SELECT course_name, percent_popularity FROM Courses
WHERE percent_popularity BETWEEN 70 AND 80
ORDER BY course_name;

SELECT course_name, percent_popularity
FROM Courses
WHERE course_name LIKE '%e'
ORDER BY course_name;

--exams table
SELECT exam_name, exam_date,total_marks
FROM exams
WHERE NOT (total_marks = 50)
ORDER BY exam_date;

SELECT exam_name, exam_date,total_marks
FROM exams
WHERE NOT (exam_name = 'Final Exam', exam_name = 'midterm Exam')
ORDER BY exam_date;

SELECT exam_name, exam_date,total_marks
FROM exams
WHERE exam_date NOT BETWEEN '2025-10-01' AND '2025-10-30'
ORDER BY exam_date DESC;

SELECT exam_name, exam_date,total_marks
FROM exams
WHERE exam_name LIKE '%xam%'
ORDER BY total_marks;

--results table
SELECT student_id, exam_id, marks_obtained, grade
FROM results
WHERE marks_obtained BETWEEN 80 AND 100
ORDER BY result_id;

SELECT student_id, exam_id, marks_obtained, grade
FROM results
WHERE grade IN ('A', 'B') AND student_id > 10
ORDER BY result_id;

SELECT DISTINCT exam_name,exam_date
FROM exams
WHERE exam_date < '2025-11-10';

--classes table
SELECT class_start, mode, class_venue,student_id
FROM classes
WHERE mode = 'Physical' 
AND duration >= '2 hours' 
AND student_id > 10
ORDER BY student_id;

SELECT class_start, mode, class_venue,student_id
FROM classes
WHERE class_venue LIKE 'Room%'
AND class_start >= '2 pm afternoon'
ORDER BY class_start;
--Group by and aggregate functions
-- count students mentored same teacher_id less than 5
SELECT  count(student_id) AS total_stuents
FROM mentors
WHERE teacher_id < 5
GROUP BY teacher_id
ORDER BY student_id;
--count and group students that belong to the same course
--Always use HAVING with GROUP BY
--The HAVING clause is used to filter records that work on aggregated data
-- It is similar to the WHERE clause, but WHERE cannot be used with aggregate functions.
--group by clause contains the constant column then the aggregate function the column that repeats 
--The ORDER BY clause is used to sort the result-set in ascending or descending order.
SELECT COUNT(student_id) AS total_students,course_id
FROM students
WHERE student_id >= 3
GROUP BY course_id
ORDER BY total_students DESC;
--group teachers in same salary range
SELECT COUNT(teacher_id) AS total_teachers,salary
FROM teachers
WHERE salary > 50000
GROUP BY teacher_id;
--group students with same grade in results table
SELECT COUNT(student_id) AS total_students,grade
FROM results
WHERE grade IN ('A','B','C')
GROUP BY grade
ORDER BY total_students DESC;
--exams with same total marks
SELECT COUNT(exam_id) AS total_exams,total_marks
FROM exams
WHERE total_marks IN (50,100,120)
GROUP BY total_marks
ORDER BY total_exams DESC;
-- Alter courses table
ALTER TABLE Courses
ADD COLUMN student_id INT NULL,
ADD FOREIGN KEY (student_id) REFERENCES students(student_id);

INSERT INTO Courses (course_name, percent_popularity, student_id)
VALUES ('Astronomy', 77, 3)
, ('Statistics', 85, 4)
, ('Geology', 72, 5)
, ('Environmental Science', 80, 6)
, ('Sociology', 68, 7)
, ('Political Science', 74, 8);

-- Alter students table
ALTER TABLE students
ADD COLUMN teacher_id INT NULL,
ADD FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);

INSERT INTO students (first_name, last_name, course_id, birth_date, enrollment_date, teacher_id)
VALUES
('Ethan', 'Koke', 9, '2005-05-20', '2025-09-01', 1),
('Mia', 'Frost', 10, '2004-12-15', '2025-09-01', 2),
('Luna', 'Ray', 11, '2005-03-22', '2025-01-15', 3),
('Zoe', 'Blake', 12, '2004-07-30', '2025-09-01', 4),
('John', 'Stones', 1, '2005-11-05', '2025-01-15', ),
('Ryian', 'Brooks', 2, '2004-09-18', '2024-09-01', 6),
('Jermain', 'Coleman', 3, '2005-06-25', '2024-09-01', 7),
('Sofia', 'Jenkinson', 4, '2004-02-14', '2025-09-01', 8),
('Marry', 'Perry', 5, '2005-08-09', '2024-01-15', 9),
('Camila', 'LongStaff', 6, '2004-10-27', '2025-09-01', 10);

ALTER TABLE teachers
MODIFY COLUMN course_id INT NULL,
ADD FOREIGN KEY (course_id) REFERENCES Courses(course_id);

UPDATE teachers
SET course_id NULL
WHERE teacher_id >= 9 AND teacher_id <= 12; 

ALTER TABLE departments
MODIFY COLUMN teachers_id INT NULL
ADD FOREIGN KEY (teachers_id) REFERENCES teachers(teacher_id);

--update teachers table
ALTER TABLE teachers
ADD COLUMN student_id INT NULL,
ADD FOREIGN KEY (student_id) REFERENCES students(student_id);

UPDATE TABLE teachers 
SET enrollment_date = NULL
WHERE teacher_id < 10;

--inner join teachers and courses table
SELECT teachers.teacher_id,teachers.salary,
teachers.first_name,
courses.course_name,courses.course_id 
FROM teachers
INNER JOIN courses
ON teachers.course_id = courses.course_id

--Inner join mentors and teachers tables
SELECT mentors.student_id,teachers.teacher_id,
teachers.first_name,teachers.hire_date
FROM mentors
INNER JOIN teachers
ON mentors.teacher_id = teachers.teacher_id;

--left join teachers and courses
SELECT teachers.teacher_id,teachers.last_name,teachers.hire_date,
courses.course_id
FROM teachers
LEFT JOIN courses
ON teachers.course_id = courses.course_id;

-- Right join teachers and courses
SELECT teachers.teacher_id,teachers.last_name,teachers.hire_date,
courses.course_id
FROM teachers
RIGHT JOIN courses
ON teachers.course_id = courses.course_id;

--FULL outer join teachers and courses
SELECT teachers.teacher_id,teachers.last_name,teachers.hire_date,
courses.course_id
FROM teachers
LEFT JOIN courses
ON teachers.course_id = courses.course_id

UNION

SELECT teachers.teacher_id,teachers.last_name,teachers.hire_date,
courses.course_id
FROM teachers
RIGHT JOIN courses
ON teachers.course_id = courses.course_id;

--Inner join teachers and departments
SELECT teachers.teacher_id,teachers.salary
teachers.first_name,departments.department_id,departments.department_name 
FROM teachers
INNER JOIN departments
ON teachers.teacher_id = departments.teachers_id;

--left join departments and teachers
SELECT teachers.teacher_id,teachers.first_name,
departments.department_name,departments.department_id
FROM teachers
LEFT JOIN departments
ON teachers.teacher_id = departments.teachers_id;

--Right join departments and teachers
SELECT teachers.teacher_id,teachers.first_name,
departments.department_name,departments.department_id
FROM teachers
RIGHT JOIN departments
ON teachers.teacher_id = departments.teachers_id;

--full join departments and teahers
SELECT teachers.teacher_id,teachers.first_name,
departments.department_name,departments.department_id
FROM teachers
LEFT JOIN departments
ON teachers.teacher_id = departments.teachers_id

UNION

SELECT teachers.teacher_id,teachers.first_name,
departments.department_name,departments.department_id
FROM teachers
RIGHT JOIN departments
ON teachers.teacher_id = departments.teachers_id;


--subquries
--1,nested
SELECT AVG(percent_popularity)
FROM courses

SELECT course_id,course_name,percent_popularity
FROM courses
WHERE percent_popularity > (SELECT AVG(percent_popularity)
FROM courses);


SELECT last_name,course_id,salary
FROM teachers
WHERE salary IN(SELECT salary FROM teachers WHERE salary > 60000);

SELECT student_id,exam_id,grade 
FROM results
WHERE grade IN(SELECT grade FROM results WHERE grade = 'B');



--correlated subquery
-- usecase  i).Using aggregate functions
-- Return the youngest student in each course
SELECT course_id,first_name,birth_date
FROM students AS St
WHERE birth_date = (SELECT MIN(birth_date) FROM students WHERE course_id = St.course_id);

--The newest student per course
SELECT course_id,last_name,enrollment_date
FROM students AS St
WHERE enrollment_date = (SELECT MIN(enrollment_date) FROM students WHERE course_id = St.course_id);

-- To return the oldest teacher in the school per course
SELECT teacher_id,last_name,hire_date 
FROM teachers AS Ts
WHERE hire_date = (SELECT MAX(hire_date) FROM teachers WHERE course_id = Ts.course_id);

-- ii) Using exists and NOT exists
-- Display teachers with department
SELECT T.first_name,T.last_name 
FROM teachers AS T
WHERE EXISTS (SELECT 1 FROM departments AS D WHERE D.teachers_id = T.teacher_id);
--teacher not joined a Department yet
SELECT T.teacher_id,T.first_name,T.course_id
FROM teachers AS T
WHERE NOT EXISTS(SELECT D.department_id FROM departments AS D WHERE D.teachers_id = T.teacher_id);
--Any teacher that mentors a student
SELECT Tc.teacher_id,Tc.first_name,Tc.salary
FROM teachers AS Tc
WHERE EXISTS(SELECT M.teacher_id FROM mentors AS M WHERE M.teacher_id = Tc.teacher_id);
--A teacher yet to be assigned a class
SELECT Tc.teacher_id,Tc.first_name,Tc.hire_date
FROM teachers AS Tc
WHERE NOT EXISTS(SELECT Cl.teacher_id FROM classes AS Cl WHERE Cl.teacher_id = Tc.teacher_id);

--iii) scalar subquery
--it returns a single value
--use a row name to filter results
-- display students enrolled to a certain course
SELECT S.first_name,S.last_name,S.course_id
FROM students AS S
WHERE "Computer Science" = (SELECT C.course_name FROM courses  AS C  WHERE S.course_id = C.course_id);

--display teachers teaching a certain course
SELECT T.first_name,T.last_name,T.course_id
FROM teachers AS T
WHERE "Software Engineering" = (SELECT C.course_name FROM courses  AS C  WHERE T.course_id = C.course_id);

--display students mentored by a certain teacher
SELECT M.student_id,M.teacher_id
FROM mentors AS M
WHERE "Eva" = (SELECT T.first_name FROM teachers AS T WHERE M.teacher_id = T.teacher_id);

--transactions
--in teachers table to lower another and add to another
START TRANSACTION;
UPDATE teachers
SET salary = salary - 5000
WHERE teacher_id = 1;

UPDATE teachers
SET salary = salary + 5000
WHERE teacher_id = 2;
COMMIT;
--rollback example
START TRANSACTION;
UPDATE teachers
SET salary = salary - 3000
WHERE teacher_id = 3;
UPDATE teachers
SET salary = salary + 3000
WHERE teacher_id = 4;
ROLLBACK;
--To create an index on students table
CREATE INDEX idx_last_name
ON students (last_name);
--To drop the index
DROP INDEX idx_last_name
ON students;
--To create an index on teachers table
CREATE INDEX idx_first_name
ON teachers (first_name);
--To drop the index
DROP INDEX idx_first_name
ON teachers;


--To create a view on students table
CREATE VIEW vw_students AS
SELECT first_name,last_name,course_id,enrollment_date
FROM students
WHERE course_id IS NOT NULL;
--To query the view
SELECT * FROM vw_students
WHERE course_id = 1;
--To drop the view
DROP VIEW vw_students;
--To create a view on teachers table
CREATE VIEW vw_teachers AS
SELECT first_name,last_name,hire_date,salary
FROM teachers;
--To query the view
SELECT * FROM vw_teachers
WHERE salary > 60000;
--To drop the view
DROP VIEW vw_teachers;
-- To create aview based on a join between students and courses
CREATE VIEW vw_student_courses AS
SELECT S.first_name,S.last_name,C.course_name
FROM students AS S
INNER JOIN courses AS C 
ON S.course_id = C.course_id;
--To query the view
SELECT * FROM vw_student_courses
WHERE course_name = 'Data Science';
--To drop the view
DROP VIEW vw_student_courses;
-- To create a view based on a join between teachers and departments
CREATE VIEW vw_teacher_departments AS
SELECT T.first_name,T.last_name,D.department_name
FROM teachers AS T
INNER JOIN departments AS D
ON T.teacher_id = D.teachers_id;
--To query the view
SELECT * FROM vw_teacher_departments
WHERE department_name = 'Sciences';
--To drop the view
DROP VIEW vw_teacher_departments;

--Advanced SQL Functions
--1)String Functions

--i)CONCAT -> an SQL function used to combine two or more strings into a single string
SELECT CONCAT(first_name,' ' ,last_name) AS full_name 
FROM students;

--ii)LENGTH -> function in SQL returns the number of characters in a string.
SELECT first_name,last_name,birth_date,
LENGTH(first_name) AS firstnames_length
FROM students
ORDER BY firstnames_length;

--iii)SUBSTRING -> a SQL function used to extract a portion of a string
SELECT SUBSTRING(first_name,1,5) AS Section_of_firstnames
FROM students;

--iv)REPLACE -> function in SQL is used to substitute all occurrences of
-- a specified substring within a string with a new substring
SELECT first_name,last_name,
REPLACE(enrollment_date,'2025','2026') AS updated_enrollment
FROM students;

--v)UPPER() is a string function in SQL used to convert all characters in a specified string to uppercase.
--vi)LOWER() function in SQL converts all characters in a specified string to lowercase
SELECT UPPER(first_name) AS cap_firstnames,LOWER(last_name) AS lowercased_lastnames
FROM students;

--2)Numeric Functions
--i)FLOOR function is used to round down any specific decimal or 
--numeric value to its nearest whole integer.
SELECT first_name,last_name,
FLOOR(salary) AS wholenumber_salary
FROM teachers
WHERE first_name = 'Bruno';

--ii) ABS() function in SQL returns the absolute value of a given numeric expression, 
--meaning it converts any negative number to its positive equivalent 
--while leaving positive numbers unchanged. 
SELECT first_name,hire_date, ABS(salary) AS absolute_salary
FROM teachers 

--iii)The MOD function in SQL calculates the remainder when one number is divided by another.
SELECT first_name,hire_date, MOD(salary , 2000) AS reminder_dividedby200
FROM teachers;

--iv)ROUND function in SQL is used to round a numeric value to a specified number of decimal places.
SELECT first_name,hire_date, ROUND((salary / 3), 3) AS salary_roundedto3
FROM teachers; 

--v) CEILING() function in SQL returns the smallest integer greater than or equal to a given numeric value
SELECT first_name,hire_date, CEIL(ROUND((salary / 3), 3)) AS salary_roundedto3_roundedup
FROM teachers;

--SQL conditionals
--1)CASE The CASE statement in SQL is used to create conditional logic 
--within a query, allowing you to perform different actions based on specific conditions.

SELECT 
   COUNT(CASE WHEN YEAR(birth_date) = 2004 THEN 1 END) AS born_2004s,
   COUNT(CASE WHEN YEAR(birth_date) = 2005 THEN 1 END) AS born_2005s
FROM students;

SELECT first_name,birth_date,
  CASE WHEN YEAR(birth_date) = 2004 THEN 'born-2004'
  WHEN YEAR(birth_date) = 2005 THEN 'born-2005'
  ELSE  'Too young to be a student!'
  END AS years_born_in
FROM students;

--Reminder using UNION 
--Selecting firstname and lastname from teachers and students alising a column role
SELECT first_name,last_name, 'student' AS role
FROM students

UNION

SELECT first_name,last_name, 'teacher' AS role
FROM teachers;


--CASE continues
SELECT class_id,class_start,duration,
  CASE WHEN duration <= '1 hour' THEN 'Short class'
       WHEN duration = '1.5 hours' THEN 'Medium class'
       ELSE 'A long class'
       END AS 'duration-described'
FROM classes;

--2)NULLIF  SQL function that compares two expressions and returns NULL if they are equal, 
-- otherwise it returns the first expression.
--Rturns true-1 for first condition and false-0 for second condition else returns NULL
SELECT first_name,last_name,
NULLIF(last_name LIKE '%z',last_name LIKE '%n') AS last_name_endwith
FROM students;

SELECT course_name,percent_popularity,
NULLIF(percent_popularity >= 70,percent_popularity < 70) AS poularity_comparison
FROM courses;

--3)COALESCE is an SQL function that returns the first non-null value in a list of expressions
-- takes in two arguments the column with the NULL value,the actual value toreplae the null in the table[replaces NULL with a label]
--It handles null values-Allows us do something with null values
--i)Replace NULL with a Calculated Value
--ii)Concatenating NULL and Strings
--iii)
