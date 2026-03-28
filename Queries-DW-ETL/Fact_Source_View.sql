USE University_DataSourceDB;
GO

CREATE OR ALTER VIEW Fact_Student_Performance_View AS
SELECT
    e.enrollment_id,
    e.student_id,
    e.course_id,
    e.lecturer_id,
    e.semester,
    e.enrollment_status,
    g.grade,
    g.grade_source,
    g.score AS grade_score,
    f.feedback_score,
    f.feedback_category,
    CASE
        WHEN e.enrollment_status = 'Dropped' THEN 1
        ELSE 0
    END AS DropoutFlag,
    GETDATE() AS accm_txn_create_time
FROM enrollments e
LEFT JOIN grades g ON e.enrollment_id = g.enrollment_id
LEFT JOIN feedback f ON e.student_id = f.student_id;
GO
