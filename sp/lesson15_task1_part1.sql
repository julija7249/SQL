USE DB_lesson;
GO
IF OBJECT_ID('EnrolledStudents') IS NOT NULL
    DROP PROCEDURE EnrolledStudents;
GO
CREATE PROCEDURE EnrolledStudents (@CodeDirection INT)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Directions
        WHERE CodeDirection = @CodeDirection
    )
    BEGIN
        PRINT 'Некорректный код направления';
        RETURN;
    END
    SELECT 
        Directions.NameDirection AS DirectionName, STRING_AGG(ExamList.LastName, ', ') AS Enrolled
    FROM Directions
    LEFT JOIN ExamList ON ExamList.Direction = Directions.NameDirection AND ExamList.ExamScore >= Directions.MinMark
    WHERE Directions.CodeDirection = @CodeDirection
    GROUP BY Directions.NameDirection;
END;
GO