
CREATE DATABASE School1;
USE School1;


CREATE TABLE Teachers (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);


CREATE TABLE TeacherDetails (
    ID INT PRIMARY KEY IDENTITY(1,1),
    TeacherID INT UNIQUE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID) ON DELETE CASCADE
);

CREATE TABLE Courses (
    ID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(100),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID) ON DELETE CASCADE
);

CREATE TABLE Students (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(ID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(ID) ON DELETE CASCADE
);


INSERT INTO Teachers (FirstName, LastName)
VALUES ('RAWAAH', 'ABABNEH'),
       ('SAMI', 'ABABNEH');


INSERT INTO TeacherDetails (TeacherID, Address, PhoneNumber, Email)
VALUES (1, 'BUSHRA', '0787878521', 'johnson@school.com'),
       (2, 'IRBID', '0025774555', 'smith@school.com');


INSERT INTO Courses (CourseName, TeacherID)
VALUES ('Mathematics', 1),
       ('Science', 2), 
       ('History', 2);


INSERT INTO Students (FirstName, LastName)
VALUES ('Asala', 'abd'),
       ('Abood', 'omran');


INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES (1, 1, '2024-05-15'),
       (1, 2, '2024-01-16'),
       (2, 2, '2024-04-17'),
       (2, 3, '2024-08-18');
