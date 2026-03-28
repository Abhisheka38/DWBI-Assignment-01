USE Uniersity_DataSource_DW;
GO

-- Load DimFeedbackCategory
INSERT INTO DimFeedbackCategory (CategoryName)
VALUES 
    ('Excellent'),
    ('Good'),
    ('Average'),
    ('Poor');
GO

-- Load DimGrade with all combinations
INSERT INTO DimGrade (Grade, GradeSource)
VALUES
    ('A+', 'Quiz'), ('A+', 'Assignment'), ('A+', 'Midterm'), ('A+', 'Final Exam'),
    ('A', 'Quiz'),  ('A', 'Assignment'),  ('A', 'Midterm'),  ('A', 'Final Exam'),
    ('A-', 'Quiz'), ('A-', 'Assignment'), ('A-', 'Midterm'), ('A-', 'Final Exam'),
    ('B+', 'Quiz'), ('B+', 'Assignment'), ('B+', 'Midterm'), ('B+', 'Final Exam'),
    ('B', 'Quiz'),  ('B', 'Assignment'),  ('B', 'Midterm'),  ('B', 'Final Exam'),
    ('B-', 'Quiz'), ('B-', 'Assignment'), ('B-', 'Midterm'), ('B-', 'Final Exam'),
    ('C+', 'Quiz'), ('C+', 'Assignment'), ('C+', 'Midterm'), ('C+', 'Final Exam'),
    ('C', 'Quiz'),  ('C', 'Assignment'),  ('C', 'Midterm'),  ('C', 'Final Exam'),
    ('C-', 'Quiz'), ('C-', 'Assignment'), ('C-', 'Midterm'), ('C-', 'Final Exam'),
    ('D', 'Quiz'),  ('D', 'Assignment'),  ('D', 'Midterm'),  ('D', 'Final Exam'),
    ('F', 'Quiz'),  ('F', 'Assignment'),  ('F', 'Midterm'),  ('F', 'Final Exam');
GO
