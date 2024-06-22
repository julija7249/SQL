-- -*- coding: utf-8 -*-
USE DB_lesson;
SELECT StudentNumber, FirstName, LastName, ExamScore, Direction,
 IIF (ExamList.ExamScore >= Directions.MinMark, 'YES',
 IIF (ExamList.ExamScore < Directions.MinMark, 'NO', Null)) AS Enrolled
FROM ExamList
JOIN Directions ON ExamList.Direction = Directions.NameDirection;