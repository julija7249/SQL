USE DB_lesson;
GO
IF OBJECT_ID('InsertStudent') IS NOT NULL
    DROP TRIGGER InsertStudent;
GO
CREATE TRIGGER InsertStudent
ON Students
AFTER INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Students)
    BEGIN
		UPDATE Directions
		SET RecruitmentIsOver = CASE
                        WHEN EXISTS (
                            SELECT 1
                            FROM Students
                            WHERE Students.CodeDirection = Directions.CodeDirection
                            GROUP BY Students.CodeDirection
                            HAVING COUNT(*) >= Directions.TotalQuantity
                        ) THEN 1
                        ELSE 0
                    END
		FROM Directions JOIN Students ON Directions.CodeDirection = Students.CodeDirection AND Students.ExamScore >= Directions.MinMark;
	END;
END;
GO