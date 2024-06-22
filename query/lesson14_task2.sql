USE DB_lesson;
SELECT STUFF(
    (SELECT ', ' + LastName
     FROM ExamList
	 JOIN Directions ON ExamList.Direction = Directions.NameDirection
     WHERE Direction = 'История' AND ExamList.ExamScore >= Directions.MinMark
     FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)')
, 1, 2, '') AS Enrolled_in_History;