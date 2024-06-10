-- -*- coding: utf-8 -*-
USE t18;
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ExamList')
BEGIN
    CREATE TABLE ExamList(
		StudentNumber INT,
		FirstName VARCHAR(100),
		LastName VARCHAR(100),
		ExamScore INT,
		Direction VARCHAR(100),
		FOREIGN KEY (StudentNumber)  REFERENCES Students (Id)
	);
END;
IF NOT EXISTS (SELECT * FROM ExamList)
BEGIN
	INSERT INTO ExamList (FirstName, LastName, ExamScore, Direction)
	VALUES
        ('Иван', 'Бунша', 220, 'История'),
        ('Остап', 'Бендер', 170, 'Право'),
        ('Александр', 'Тимофеев', 300, 'Физика');
END;
IF NOT EXISTS (SELECT * FROM Students)
BEGIN
	INSERT INTO Students (FirstName, LastName, ExamScore) 
	SELECT FirstName, LastName, ExamScore 
	FROM ExamList;
END;
SELECT * FROM Students;