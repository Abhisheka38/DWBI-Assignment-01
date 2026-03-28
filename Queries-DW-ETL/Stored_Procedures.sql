USE Uniersity_DataSource_DW;
GO

-- UpsertDimStudent (SCD Type 2)
CREATE OR ALTER PROCEDURE UpsertDimStudent
    @StudentID      NVARCHAR(50),
    @FirstName      NVARCHAR(100),
    @LastName       NVARCHAR(100),
    @Gender         NVARCHAR(20),
    @DOB            NVARCHAR(50),
    @City           NVARCHAR(100),
    @Faculty        NVARCHAR(100),
    @Program        NVARCHAR(100),
    @EnrollmentYear INT,
    @Status         NVARCHAR(50)
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM DimStudent
        WHERE AlternateStudentID = @StudentID
        AND IsCurrent = 1
        AND (City != @City OR Program != @Program OR Status != @Status)
    )
    BEGIN
        UPDATE DimStudent
        SET IsCurrent = 0,
            EndDate = CAST(GETDATE() AS DATE)
        WHERE AlternateStudentID = @StudentID
        AND IsCurrent = 1;

        INSERT INTO DimStudent
        (AlternateStudentID, FirstName, LastName, Gender, DOB, City,
         Faculty, Program, EnrollmentYear, Status, IsCurrent, StartDate, EndDate)
        VALUES
        (@StudentID, @FirstName, @LastName, @Gender,
         TRY_CAST(@DOB AS DATE), @City,
         @Faculty, @Program, @EnrollmentYear, @Status, 1,
         CAST(GETDATE() AS DATE), NULL);
    END
    ELSE IF NOT EXISTS (
        SELECT 1 FROM DimStudent
        WHERE AlternateStudentID = @StudentID
    )
    BEGIN
        INSERT INTO DimStudent
        (AlternateStudentID, FirstName, LastName, Gender, DOB, City,
         Faculty, Program, EnrollmentYear, Status, IsCurrent, StartDate, EndDate)
        VALUES
        (@StudentID, @FirstName, @LastName, @Gender,
         TRY_CAST(@DOB AS DATE), @City,
         @Faculty, @Program, @EnrollmentYear, @Status, 1,
         CAST(GETDATE() AS DATE), NULL);
    END
END;
GO

-- UpsertDimCourse
CREATE OR ALTER PROCEDURE UpsertDimCourse
    @CourseID       NVARCHAR(50),
    @CourseName     NVARCHAR(200),
    @Faculty        NVARCHAR(100),
    @CreditHours    INT,
    @Credits        INT,
    @OfferedTerm    NVARCHAR(50),
    @YearOffered    NVARCHAR(20),
    @DeliveryMode   NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM DimCourse
        WHERE AlternateCourseID = @CourseID
    )
    BEGIN
        INSERT INTO DimCourse
        (AlternateCourseID, CourseName, Faculty, CreditHours,
         Credits, OfferedTerm, YearOffered, DeliveryMode)
        VALUES
        (@CourseID, @CourseName, @Faculty, @CreditHours,
         @Credits, @OfferedTerm, @YearOffered, @DeliveryMode);
    END
END;
GO

-- UpsertDimLecturer
CREATE OR ALTER PROCEDURE UpsertDimLecturer
    @LecturerID         NVARCHAR(50),
    @FirstName          NVARCHAR(100),
    @LastName           NVARCHAR(100),
    @Faculty            NVARCHAR(100),
    @Department         NVARCHAR(100),
    @Specialization     NVARCHAR(100),
    @EmploymentType     NVARCHAR(50),
    @HireDate           NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM DimLecturer
        WHERE AlternateLecturerID = @LecturerID
    )
    BEGIN
        INSERT INTO DimLecturer
        (AlternateLecturerID, FullName, Faculty, Department,
         Specialization, EmploymentType, HireDate)
        VALUES
        (@LecturerID, @FirstName + ' ' + @LastName, @Faculty,
         @Department, @Specialization, @EmploymentType,
         TRY_CAST(@HireDate AS DATE));
    END
END;
GO

-- UpsertDimSemester
CREATE OR ALTER PROCEDURE UpsertDimSemester
    @SemesterName   NVARCHAR(50),
    @AcademicYear   INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM DimSemester
        WHERE SemesterName = @SemesterName
        AND AcademicYear = @AcademicYear
    )
    BEGIN
        INSERT INTO DimSemester (SemesterName, AcademicYear)
        VALUES (@SemesterName, @AcademicYear);
    END
END;
GO

-- UpsertDimGrade
CREATE OR ALTER PROCEDURE UpsertDimGrade
    @Grade       NVARCHAR(10),
    @GradeSource NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM DimGrade
        WHERE Grade = @Grade
        AND GradeSource = @GradeSource
    )
    BEGIN
        INSERT INTO DimGrade (Grade, GradeSource)
        VALUES (@Grade, @GradeSource);
    END
END;
GO

-- UpsertDimFeedbackCategory
CREATE OR ALTER PROCEDURE UpsertDimFeedbackCategory
    @CategoryName NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM DimFeedbackCategory
        WHERE CategoryName = @CategoryName
    )
    BEGIN
        INSERT INTO DimFeedbackCategory (CategoryName)
        VALUES (@CategoryName);
    END
END;
GO
