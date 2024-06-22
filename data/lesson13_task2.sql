-- -*- coding: utf-8 -*-
USE DB_lesson;
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Directions')
BEGIN
    CREATE TABLE Directions(
		CodeDirection INT PRIMARY KEY,
		NameDirection VARCHAR(100),
		MinMark INT
	);
END;
IF NOT EXISTS (SELECT * FROM Directions)
BEGIN
	INSERT INTO Directions (CodeDirection, NameDirection, MinMark)
	VALUES
        (1, '�������', 160),
        (2, '�����', 180),
        (3, '������', 200);
END;
SELECT * FROM Directions;