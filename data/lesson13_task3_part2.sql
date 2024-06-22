-- -*- coding: utf-8 -*-
USE DB_lesson;
UPDATE Students
SET Students.CodeDirection = Directions.CodeDirection
FROM Students
JOIN ExamList ON ExamList.FirstName = Students.FirstName AND ExamList.LastName = Students.LastName
JOIN Directions ON ExamList.Direction = Directions.NameDirection;

SELECT * FROM Students;