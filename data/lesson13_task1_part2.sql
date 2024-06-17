USE DB_lesson0;
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Students' AND COLUMN_NAME = 'ExamScore'
)
BEGIN
    ALTER TABLE Students
    ADD ExamScore INT;
END;