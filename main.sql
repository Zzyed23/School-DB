-- Create the database
CREATE DATABASE StudentGradebook;
USE StudentGradebook;

-- Create Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other')
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseCode VARCHAR(10)
);

-- Create Assignments table
CREATE TABLE Assignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    AssignmentName VARCHAR(100),
    DueDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Grades table
CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    AssignmentID INT,
    Grade DECIMAL(5,2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample students
INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender) VALUES
('John', 'Doe', '2001-04-12', 'Male'),
('Jane', 'Smith', '2002-05-23', 'Female'),
('Alice', 'Johnson', '2003-02-14', 'Female'),
('Bob', 'Brown', '2004-03-19', 'Male'),
('Charlie', 'Davis', '2005-05-25', 'Male'),
('Diana', 'Miller', '2003-06-30', 'Female'),
('Ethan', 'Wilson', '2002-08-10', 'Male'),
('Fiona', 'Moore', '2001-09-22', 'Female'),
('George', 'Taylor', '2004-11-03', 'Male'),
('Hannah', 'Anderson', '2005-12-11', 'Female'),
('Ian', 'Thomas', '2003-01-04', 'Male'),
('Julia', 'Jackson', '2002-02-18', 'Female'),
('Kevin', 'White', '2001-03-27', 'Male'),
('Laura', 'Harris', '2005-04-30', 'Female'),
('Michael', 'Martin', '2004-06-17', 'Male'),
('Nina', 'Thompson', '2003-07-23', 'Female'),
('Oscar', 'Garcia', '2002-08-25', 'Male'),
('Paula', 'Martinez', '2001-09-09', 'Female'),
('Quinn', 'Robinson', '2004-10-14', 'Male'),
('Rachel', 'Clark', '2005-11-21', 'Female'),
('Sam', 'Lewis', '2003-12-05', 'Male'),
('Tina', 'Lee', '2002-01-15', 'Female'),
('Uma', 'Walker', '2001-02-28', 'Female'),
('Victor', 'Hall', '2004-03-12', 'Male'),
('Wendy', 'Allen', '2005-04-19', 'Female'),
('Xander', 'Young', '2003-05-30', 'Male'),
('Yara', 'Hernandez', '2002-06-07', 'Female'),
('Zach', 'King', '2001-07-22', 'Male'),
('Adam', 'Scott', '2004-08-05', 'Male'),
('Bella', 'Adams', '2005-09-15', 'Female');

-- Insert sample courses
INSERT INTO Courses (CourseName, CourseCode) VALUES
('Mathematics', 'MATH101'),
('English', 'ENG101');

-- Insert sample assignments
INSERT INTO Assignments (CourseID, AssignmentName, DueDate) VALUES
(1, 'Math Assignment 1', '2024-09-15'),
(2, 'English Essay 1', '2024-09-20');

-- Insert sample enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, '2024-07-01'),
(2, 2, '2024-07-01'),
(3, 1, '2024-07-01'),
(4, 2, '2024-07-01'),
(5, 1, '2024-07-01'),
(6, 2, '2024-07-01'),
(7, 1, '2024-07-01'),
(8, 2, '2024-07-01'),
(9, 1, '2024-07-01'),
(10, 2, '2024-07-01'),
(11, 1, '2024-07-01'),
(12, 2, '2024-07-01'),
(13, 1, '2024-07-01'),
(14, 2, '2024-07-01'),
(15, 1, '2024-07-01'),
(16, 2, '2024-07-01'),
(17, 1, '2024-07-01'),
(18, 2, '2024-07-01'),
(19, 1, '2024-07-01'),
(20, 2, '2024-07-01'),
(21, 1, '2024-07-01'),
(22, 2, '2024-07-01'),
(23, 1, '2024-07-01'),
(24, 2, '2024-07-01'),
(25, 1, '2024-07-01'),
(26, 2, '2024-07-01'),
(27, 1, '2024-07-01'),
(28, 2, '2024-07-01'),
(29, 1, '2024-07-01'),
(30, 2, '2024-07-01');

-- Insert sample grades
INSERT INTO Grades (StudentID, AssignmentID, Grade) VALUES
(1, 1, 85.5),
(2, 2, 92.0),
(3, 1, 78.0),
(4, 2, 88.0),
(5, 1, 90.0),
(6, 2, 75.0),
(7, 1, 82.5),
(8, 2, 89.5),
(9, 1, 87.0),
(10, 2, 91.0),
(11, 1, 84.0),
(12, 2, 86.0),
(13, 1, 79.5),
(14, 2, 92.5),
(15, 1, 88.0),
(16, 2, 80.0),
(17, 1, 83.5),
(18, 2, 77.0),
(19, 1, 85.0),
(20, 2, 90.5),
(21, 1, 81.0),
(22, 2, 87.5),
(23, 1, 79.0),
(24, 2, 85.5),
(25, 1, 86.0),
(26, 2, 88.5),
(27, 1, 90.0),
(28, 2, 82.0),
(29, 1, 83.0),
(30, 2, 89.0);

-- Average Grade per Student
SELECT s.StudentID, s.FirstName, s.LastName, AVG(g.Grade) AS AverageGrade
FROM Students s
JOIN Grades g ON s.StudentID = g.StudentID
GROUP BY s.StudentID;

-- Average Grade per Course
SELECT c.CourseID, c.CourseName, AVG(g.Grade) AS AverageGrade
FROM Courses c
JOIN Assignments a ON c.CourseID = a.CourseID
JOIN Grades g ON a.AssignmentID = g.AssignmentID
GROUP BY c.CourseID;

-- Report of Students with Grades in Each Course
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, a.AssignmentName, g.Grade
FROM Students s
JOIN Grades g ON s.StudentID = g.StudentID
JOIN Assignments a ON g.AssignmentID = a.AssignmentID
JOIN Courses c ON a.CourseID = c.CourseID
ORDER BY s.StudentID, c.CourseID;
