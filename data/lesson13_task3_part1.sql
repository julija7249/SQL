USE DB_lesson0;
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Students' AND COLUMN_NAME = 'CodeDirection'
)
BEGIN
    ALTER TABLE Students
    ADD CodeDirection INT,
	FOREIGN KEY (CodeDirection)  REFERENCES Directions (CodeDirection);
END;
