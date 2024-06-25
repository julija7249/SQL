USE DB_lesson;
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Quantity')
BEGIN
    CREATE TABLE Quantity (
        CodeDirection INT PRIMARY KEY,
        TotalQuantity INT
    );
END
IF NOT EXISTS (SELECT * FROM Quantity)
BEGIN
	INSERT INTO Quantity (CodeDirection, TotalQuantity)
	VALUES
        (1, 2),
        (2, 2),
		(3, 1);
END;
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Directions' AND (COLUMN_NAME = 'RecruitmentIsOver' OR COLUMN_NAME = 'TotalQuantity')
)
BEGIN
    ALTER TABLE Directions
    ADD RecruitmentIsOver Bit DEFAULT 0, TotalQuantity INT;
END;
UPDATE Directions
SET Directions.TotalQuantity = Quantity.TotalQuantity
FROM Directions
JOIN Quantity ON Directions.CodeDirection = Quantity.CodeDirection;

SELECT * FROM Directions;