DROP DATABASE IF EXISTS Company;
USE Company;
CREATE DATABASE Company;
CREATE TABLE Departments (department_id INT NOT NULL AUTO_INCREMENT,
                          department_name VARCHAR(50) NOT NULL,
                          PRIMARY KEY (department_id)
                         );
CREATE TABLE Employees (employee_id INT PRIMARY KEY AUTO_INCREMENT,
                        first_name VARCHAR(50) NOT NULL,
                        last_name VARCHAR(50) NOT NULL,
                        email VARCHAR(100) NOT NULL,
                        hire_date DATE NOT NULL,
                        salary DECIMAL(10,2) NOT NULL,
                        department_id INT NULL,
                        FOREIGN KEY (department_id) REFERENCES Departments(department_id)
                        );
CREATE TABLE Projects (project_id INT PRIMARY KEY AUTO_INCREMENT,
                       project_name VARCHAR(100) NOT NULL,
                       start_date DATE NOT NULL,
                       end_date DATE NULL,
                       department_id INT NULL,
                       FOREIGN KEY (department_id) REFERENCES Departments(department_id)
                        );
CREATE TABLE EmployeeProjects (employee_id INT NOT NULL,
                              project_id INT NOT NULL,
                              assigned_date DATE NOT NULL,
                              employee_id INT NOT NULL, 
                              project_id INT NOT NULL,
                              FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
                              FOREIGN KEY (project_id) REFERENCES Projects(project_id)
                             );
CREATE TABLE Salaries (salary_id INT PRIMARY KEY AUTO_INCREMENT,
                      employee_id INT NOT NULL,
                      amount DECIMAL(10,2) NOT NULL,
                      effective_date DATE NOT NULL,
                      employee_id INT NOT NULL,
                      FOREIGN KEY (employee_id) REFERENCES Employees(employee_id));