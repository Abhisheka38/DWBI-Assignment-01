USE Uniersity_DataSource_DW;
GO

CREATE TABLE Fact_StudentPerformance (
    FactID                  INT IDENTITY(1,1) PRIMARY KEY,
    StudentSK               INT FOREIGN KEY REFERENCES DimStudent(StudentSK),
    CourseSK                INT FOREIGN KEY REFERENCES DimCourse(CourseSK),
    LecturerSK              INT FOREIGN KEY REFERENCES DimLecturer(LecturerSK),
    SemesterSK              INT FOREIGN KEY REFERENCES DimSemester(SemesterSK),
    GradeSK                 INT FOREIGN KEY REFERENCES DimGrade(GradeSK),
    FeedbackCategorySK      INT FOREIGN KEY REFERENCES DimFeedbackCategory(FeedbackCategorySK),
    EnrollmentID            NVARCHAR(50),
    Score                   DECIMAL(5,2),
    AttendanceRate          DECIMAL(5,2),
    FeedbackScore           DECIMAL(5,2),
    DropoutFlag             BIT,
    EnrollmentStatus        NVARCHAR(50),
    GradeSource             NVARCHAR(50),
    Grade                   NVARCHAR(10),
    Accm_Txn_Create_Time    DATETIME,
    Accm_Txn_Complete_Time  DATETIME,
    Txn_Process_Time_Hours  INT,
    InsertDate              DATETIME DEFAULT GETDATE()
);
GO

