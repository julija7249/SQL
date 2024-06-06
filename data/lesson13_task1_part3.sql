USE DB_lesson;
INSERT INTO Students (FirstName, LastName, ExamScore)
SELECT FirstName, LastName, Score
FROM (
    VALUES 
        ('����', '�����', 220, '�������'),
        ('�����', '������', 170, '�����'),
        ('���������', '��������', 300, '������')
) AS ExamList (FirstName, LastName, Score, Direction)
WHERE NOT EXISTS (
    SELECT 1
    FROM Students
    WHERE Students.FirstName = ExamList.FirstName
    AND Students.LastName = ExamList.LastName
);