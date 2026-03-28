USE Uniersity_DataSource_DW;
GO

-- Check all table row counts
SELECT 'DimStudent' AS table_name, COUNT(*) AS total FROM DimStudent UNION ALL
SELECT 'DimCourse', COUNT(*) FROM DimCourse UNION ALL
SELECT 'DimLecturer', COUNT(*) FROM DimLecturer UNION ALL
SELECT 'DimSemester', COUNT(*) FROM DimSemester UNION ALL
SELECT 'DimGrade', COUNT(*) FROM DimGrade UNION ALL
SELECT 'DimFeedbackCategory', COUNT(*) FROM DimFeedbackCategory UNION ALL
SELECT 'Fact_StudentPerformance', COUNT(*) FROM Fact_StudentPerformance;
GO

-- Check DimStudent SCD Type 2
SELECT TOP 5
    StudentSK,
    AlternateStudentID,
    Status,
    IsCurrent,
    StartDate,
    EndDate
FROM DimStudent
ORDER BY StudentSK;
GO

-- Check Fact table loaded correctly
SELECT TOP 10
    FactID,
    StudentSK,
    CourseSK,
    GradeSK,
    SemesterSK,
    FeedbackCategorySK,
    Score,
    Grade,
    DropoutFlag,
    Accm_Txn_Create_Time
FROM Fact_StudentPerformance
ORDER BY FactID;
GO

-- Check Task 6 accumulating fact
SELECT TOP 10
    FactID,
    Accm_Txn_Create_Time,
    Accm_Txn_Complete_Time,
    Txn_Process_Time_Hours
FROM Fact_StudentPerformance
WHERE Accm_Txn_Complete_Time IS NOT NULL
ORDER BY FactID;
GO
