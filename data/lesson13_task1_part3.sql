USE DB_lesson;
INSERT INTO Students (FirstName, LastName, ExamScore)
SELECT FirstName, LastName, Score
FROM (
    VALUES 
        ('Иван', 'Бунша', 220, 'История'),
        ('Остап', 'Бендер', 170, 'Право'),
        ('Александр', 'Тимофеев', 300, 'Физика')
) AS ExamList (FirstName, LastName, Score, Direction)
WHERE NOT EXISTS (
    SELECT 1
    FROM Students
    WHERE Students.FirstName = ExamList.FirstName
    AND Students.LastName = ExamList.LastName
);
