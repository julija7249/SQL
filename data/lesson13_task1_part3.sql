-- -*- coding: utf-8 -*-
USE DB_lesson;
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ExamList')
BEGIN
    CREATE TABLE ExamList(
		StudentNumber INT,
		FirstName VARCHAR(100),
		LastName VARCHAR(100),
		ExamScore INT,
		Direction VARCHAR(100)
	);
END;
IF NOT EXISTS (SELECT * FROM ExamList)
BEGIN
	INSERT INTO ExamList (StudentNumber, FirstName, LastName, ExamScore, Direction)
	VALUES
        (1, '����', '�����', 220, '�������'),
        (2, '�����', '������', 170, '�����'),
        (3, '���������', '��������', 300, '������');
END;
IF NOT EXISTS (SELECT * FROM Students)
BEGIN
	INSERT INTO Students (FirstName, LastName, ExamScore) 
	SELECT FirstName, LastName, ExamScore 
	FROM ExamList;
END;
SELECT * FROM Students;
SELECT * FROM ExamList;