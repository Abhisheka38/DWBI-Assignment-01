USE Uniersity_DataSource_DW;
GO

-- DimStudent (SCD Type 2)
CREATE TABLE DimStudent (
    StudentSK           INT IDENTITY(1,1) PRIMARY KEY,
    AlternateStudentID  NVARCHAR(50),
    FirstName           NVARCHAR(100),
    LastName            NVARCHAR(100),
    Gender              NVARCHAR(20),
    DOB                 DATE,
    City                NVARCHAR(100),
    Faculty             NVARCHAR(100),
    Program             NVARCHAR(100),
    EnrollmentYear      INT,
    Status              NVARCHAR(50),
    IsCurrent           BIT DEFAULT 1,
    StartDate           DATE,
    EndDate             DATE,
    InsertDate          DATETIME DEFAULT GETDATE()
);
GO

-- DimCourse
CREATE TABLE DimCourse (
    CourseSK            INT IDENTITY(1,1) PRIMARY KEY,
    AlternateCourseID   NVARCHAR(50),
    CourseName          NVARCHAR(200),
    Faculty             NVARCHAR(100),
    CreditHours         INT,
    Credits             INT,
    OfferedTerm         NVARCHAR(50),
    YearOffered         NVARCHAR(20),
    DeliveryMode        NVARCHAR(50),
    InsertDate          DATETIME DEFAULT GETDATE()
);
GO

-- DimLecturer
CREATE TABLE DimLecturer (
    LecturerSK              INT IDENTITY(1,1) PRIMARY KEY,
    AlternateLecturerID     NVARCHAR(50),
    FullName                NVARCHAR(200),
    Faculty                 NVARCHAR(100),
    Department              NVARCHAR(100),
    Specialization          NVARCHAR(100),
    EmploymentType          NVARCHAR(50),
    HireDate                DATE,
    InsertDate              DATETIME DEFAULT GETDATE()
);
GO

-- DimSemester
CREATE TABLE DimSemester (
    SemesterSK      INT IDENTITY(1,1) PRIMARY KEY,
    SemesterName    NVARCHAR(50),
    AcademicYear    INT,
    InsertDate      DATETIME DEFAULT GETDATE()
);
GO

-- DimGrade
CREATE TABLE DimGrade (
    GradeSK         INT IDENTITY(1,1) PRIMARY KEY,
    Grade           NVARCHAR(10),
    GradeSource     NVARCHAR(50),
    InsertDate      DATETIME DEFAULT GETDATE()
);
GO

-- DimFeedbackCategory
CREATE TABLE DimFeedbackCategory (
    FeedbackCategorySK  INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName        NVARCHAR(50),
    InsertDate          DATETIME DEFAULT GETDATE()
);
GO


