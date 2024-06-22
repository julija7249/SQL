-- -*- coding: utf-8 -*-
USE DB_lesson;
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Students' AND COLUMN_NAME = 'ExamScore'
)
BEGIN
    ALTER TABLE Students
    ADD ExamScore INT;
END;