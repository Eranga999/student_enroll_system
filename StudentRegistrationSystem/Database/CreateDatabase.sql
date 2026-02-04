
-- Student Registration System - Database Creation Script


-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'StudentRegistrationDB')
BEGIN
    CREATE DATABASE StudentRegistrationDB;
    PRINT 'Database StudentRegistrationDB created successfully.';
END
ELSE
BEGIN
    PRINT 'Database StudentRegistrationDB already exists.';
END
GO

USE StudentRegistrationDB;
GO


-- Description: Stores student information

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Students')
BEGIN
    CREATE TABLE Students (
        StudentID INT PRIMARY KEY IDENTITY(1,1),
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        Email NVARCHAR(100) NOT NULL UNIQUE,
        PhoneNumber NVARCHAR(20) NOT NULL,
        DateOfBirth DATE NOT NULL,
        Address NVARCHAR(200) NOT NULL,
        Gender NVARCHAR(10) NOT NULL,
        RegistrationDate DATETIME DEFAULT GETDATE(),
        IsActive BIT DEFAULT 1
    );
    PRINT 'Table Students created successfully.';
END
ELSE
BEGIN
    PRINT 'Table Students already exists.';
END
GO

-- Description: Stores available subjects/courses

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Subjects')
BEGIN
    CREATE TABLE Subjects (
        SubjectID INT PRIMARY KEY IDENTITY(1,1),
        SubjectCode NVARCHAR(20) NOT NULL UNIQUE,
        SubjectName NVARCHAR(100) NOT NULL,
        Description NVARCHAR(500),
        Credits INT NOT NULL,
        IsActive BIT DEFAULT 1,
        CreatedDate DATETIME DEFAULT GETDATE()
    );
    PRINT 'Table Subjects created successfully.';
END
ELSE
BEGIN
    PRINT 'Table Subjects already exists.';
END
GO


-- Description: Stores student-subject enrollment (Many-to-Many relationship)

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'StudentSubjects')
BEGIN
    CREATE TABLE StudentSubjects (
        EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
        StudentID INT NOT NULL,
        SubjectID INT NOT NULL,
        EnrollmentDate DATETIME DEFAULT GETDATE(),
        Status NVARCHAR(20) DEFAULT 'Active',
        Grade NVARCHAR(5) NULL,
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
        FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE CASCADE,
        CONSTRAINT UQ_StudentSubject UNIQUE(StudentID, SubjectID)
    );
    PRINT 'Table StudentSubjects created successfully.';
END
ELSE
BEGIN
    PRINT 'Table StudentSubjects already exists.';
END
GO


-- Insert Sample Data - Subjects

IF NOT EXISTS (SELECT * FROM Subjects)
BEGIN
    INSERT INTO Subjects (SubjectCode, SubjectName, Description, Credits) VALUES
    ('CS101', 'Introduction to Programming', 'Basic programming concepts using C#', 3),
    ('CS102', 'Database Management Systems', 'Introduction to SQL Server and database design', 3),
    ('CS103', 'Web Development', 'HTML, CSS, JavaScript, and ASP.NET', 4),
    ('CS104', 'Data Structures', 'Arrays, linked lists, trees, and algorithms', 3),
    ('CS105', 'Software Engineering', 'SDLC, design patterns, and best practices', 3),
    ('MATH101', 'Mathematics', 'Logic, sets, and graph theory', 3),
    ('ENG101', 'Technical English', 'Communication skills for IT professionals', 2);
    
    PRINT 'Sample subjects inserted successfully.';
END
GO


-- Insert Sample Data - Students

IF NOT EXISTS (SELECT * FROM Students)
BEGIN
    INSERT INTO Students (FirstName, LastName, Email, PhoneNumber, DateOfBirth, Address, Gender) VALUES
    ('Eranga', 'harsha', 'eranga.harsha@email.com', '0771234567', '2000-02-15', 'No. 21, Galle Road, Colombo', 'Male'),
    ('namal', 'Silva', 'namal.silva@email.com', '0772345678', '1999-08-20', 'No. 45, Kandy Road, Kandy', 'Male'),
    ('mahinda', 'perera', 'mahinda.perera@email.com', '0773456789', '2001-03-10', 'No. 67, 3rd lane, Galle', 'Male');
    
    PRINT 'Sample students inserted successfully.';
END
GO


-- Insert Sample Data - Student Enrollments

IF NOT EXISTS (SELECT * FROM StudentSubjects)
BEGIN
    -- Eranga's enrollments
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (1, 1, 'Active');
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (1, 2, 'Active');
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (1, 3, 'Active');
    
    -- Nimal's enrollments
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (2, 1, 'Active');
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (2, 4, 'Active');
    
    -- mahinda's enrollments
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (3, 2, 'Active');
    INSERT INTO StudentSubjects (StudentID, SubjectID, Status) VALUES (3, 3, 'Active');
    
    PRINT 'Sample enrollments inserted successfully.';
END
GO

PRINT 'Database setup completed successfully!';

