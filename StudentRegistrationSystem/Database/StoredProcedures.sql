
-- Stored Procedures for Student Registration System


USE StudentRegistrationDB;
GO


-- SP: Insert New Student

CREATE OR ALTER PROCEDURE sp_InsertStudent
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @DateOfBirth DATE,
    @Address NVARCHAR(200),
    @Gender NVARCHAR(10),
    @StudentID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO Students (FirstName, LastName, Email, PhoneNumber, DateOfBirth, Address, Gender)
        VALUES (@FirstName, @LastName, @Email, @PhoneNumber, @DateOfBirth, @Address, @Gender);
        
        SET @StudentID = SCOPE_IDENTITY();
        
        SELECT 'Success' AS Result, @StudentID AS StudentID;
    END TRY
    BEGIN CATCH
        SELECT 'Error' AS Result, ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO


-- SP: Get All Students

CREATE OR ALTER PROCEDURE sp_GetAllStudents
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        StudentID,
        FirstName,
        LastName,
        Email,
        PhoneNumber,
        DateOfBirth,
        Address,
        Gender,
        RegistrationDate,
        IsActive
    FROM Students
    WHERE IsActive = 1
    ORDER BY RegistrationDate DESC;
END
GO


-- SP: Get Student by ID

CREATE OR ALTER PROCEDURE sp_GetStudentByID
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        StudentID,
        FirstName,
        LastName,
        Email,
        PhoneNumber,
        DateOfBirth,
        Address,
        Gender,
        RegistrationDate,
        IsActive
    FROM Students
    WHERE StudentID = @StudentID;
END
GO


-- SP: Insert Subject Enrollment

CREATE OR ALTER PROCEDURE sp_EnrollStudentInSubject
    @StudentID INT,
    @SubjectID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM StudentSubjects WHERE StudentID = @StudentID AND SubjectID = @SubjectID)
        BEGIN
            INSERT INTO StudentSubjects (StudentID, SubjectID, Status)
            VALUES (@StudentID, @SubjectID, 'Active');
            
            SELECT 'Success' AS Result, 'Student enrolled successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT 'Error' AS Result, 'Student is already enrolled in this subject' AS Message;
        END
    END TRY
    BEGIN CATCH
        SELECT 'Error' AS Result, ERROR_MESSAGE() AS Message;
    END CATCH
END
GO


-- SP: Get All Subjects

CREATE OR ALTER PROCEDURE sp_GetAllSubjects
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        SubjectID,
        SubjectCode,
        SubjectName,
        Description,
        Credits,
        IsActive
    FROM Subjects
    WHERE IsActive = 1
    ORDER BY SubjectName;
END
GO


-- SP: Get Student Enrollments

CREATE OR ALTER PROCEDURE sp_GetStudentEnrollments
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ss.EnrollmentID,
        s.SubjectCode,
        s.SubjectName,
        s.Credits,
        ss.EnrollmentDate,
        ss.Status,
        ss.Grade
    FROM StudentSubjects ss
    INNER JOIN Subjects s ON ss.SubjectID = s.SubjectID
    WHERE ss.StudentID = @StudentID
    ORDER BY ss.EnrollmentDate DESC;
END
GO


-- SP: Get All Students with Enrollment Count

CREATE OR ALTER PROCEDURE sp_GetStudentsWithEnrollmentCount
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        s.StudentID,
        s.FirstName,
        s.LastName,
        s.Email,
        s.PhoneNumber,
        s.RegistrationDate,
        COUNT(ss.EnrollmentID) AS EnrolledSubjects
    FROM Students s
    LEFT JOIN StudentSubjects ss ON s.StudentID = ss.StudentID
    WHERE s.IsActive = 1
    GROUP BY s.StudentID, s.FirstName, s.LastName, s.Email, s.PhoneNumber, s.RegistrationDate
    ORDER BY s.RegistrationDate DESC;
END
GO


-- SP: Add New Subject

CREATE OR ALTER PROCEDURE sp_AddNewSubject
    @SubjectCode NVARCHAR(20),
    @SubjectName NVARCHAR(100),
    @Credits INT,
    @SubjectID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Subjects WHERE SubjectCode = @SubjectCode)
        BEGIN
            SELECT 'Error' AS Result, 'Subject code already exists' AS Message;
            RETURN;
        END
        
        INSERT INTO Subjects (SubjectCode, SubjectName, Credits, IsActive)
        VALUES (@SubjectCode, @SubjectName, @Credits, 1);
        
        SET @SubjectID = SCOPE_IDENTITY();
        
        SELECT 'Success' AS Result, 'Subject added successfully' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error' AS Result, ERROR_MESSAGE() AS Message;
    END CATCH
END
GO

PRINT 'Stored procedures created successfully!';
