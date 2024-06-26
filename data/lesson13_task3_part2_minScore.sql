USE DB_lesson0;
UPDATE Students
SET Students.CodeDirection = Directions.CodeDirection
FROM Students
JOIN ExamList ON ExamList.FirstName = Students.FirstName AND ExamList.LastName = Students.LastName
JOIN Directions ON ExamList.Direction = Directions.NameDirection
WHERE ExamList.ExamScore >= Directions.MinMark;

SELECT * FROM Students
WHERE Students.CodeDirection IS NOT NULL;