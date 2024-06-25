USE DB_lesson;
SELECT STRING_AGG(LastName, ', ') AS Enrolled_in_History
FROM Directions
JOIN ExamList ON Directions.NameDirection = ExamList.Direction
WHERE Direction = 'История' AND ExamList.ExamScore >= Directions.MinMark;