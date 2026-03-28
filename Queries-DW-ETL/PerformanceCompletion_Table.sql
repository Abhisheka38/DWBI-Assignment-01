USE Uniersity_DataSource_DW;
GO

CREATE TABLE PerformanceCompletion (
    TransactionID           INT PRIMARY KEY,
    AccmTxnCompleteTime     DATETIME
);
GO

-- Insert sample completion data
INSERT INTO PerformanceCompletion (TransactionID, AccmTxnCompleteTime)
SELECT TOP 100
    FactID,
    DATEADD(HOUR, ABS(CHECKSUM(NEWID())) % 72 + 24, GETDATE())
FROM Fact_StudentPerformance
ORDER BY FactID;
GO
