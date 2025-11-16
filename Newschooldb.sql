DROP DATABASE IF EXISTS Newschooldb;
CREATE DATABASE Newschooldb;
USE Newschooldb;
CREATE TABLE Departments (department_id INT NOT NULL AUTO_INCREMENT,
                          department_name VARCHAR(50) NOT NULL
                         );
CREATE TABLE Courses (course_id PRIMARY KEY AUTO_INCREMENT INT,
                      course_name VARCHAR(50) NOT NULL,
                      percent_popularity VARCHAR(50) NULL,
                      department_id INT NULL,
                      FOREIGN department_id REFERENCES Departments(department_id)
                      );
CREATE TABLE Teachers (teacher_id PRIMARY KEY INT AUTO_INCREMENT,
                       first_name VARCHAR(50) NOT NULL,
                       second_name VARCHAR(50) NOT NULL,
                       course_id INT NULL,
                       FOREIGN KEY course_id REFERENCES Courses(course_id)
                       );
CREATE TABLE students(student_id PRIMARY KEY INT AUTO_INCREMENT,
                      first_name VARCHAR(50) NOT NULL,
                      last_name VARCHAR(50) NOT NULL,
                      phone_number VARCHAR(200) NULL,
                      enrollment_date DATE NOT NULL,
                      fee_balance INT DECIMAL(10,2),
                      course_id INT NULL,
                      FOREIGN KEY (course_id) REFERENCES Courses(course_id),
                      teachers_id INT NULL,
                      FOREIGN KEY (course_id) REFERENCES Teachers(course_id)
                     );