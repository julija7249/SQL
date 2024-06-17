USE DB_lesson0;
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
        ('����', '�����', 220, '�������'),
        ('�����', '������', 170, '�����'),
        ('���������', '��������', 300, '������');
END;
IF NOT EXISTS (SELECT * FROM Students)
BEGIN
	INSERT INTO Students (FirstName, LastName, ExamScore) 
	SELECT FirstName, LastName, ExamScore 
	FROM ExamList;
END;
SELECT * FROM Students;