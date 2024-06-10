-- -*- coding: utf-8 -*-
USE t18;
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Students')
BEGIN
    CREATE TABLE Students (
        Id INT IDENTITY PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100)
    );
END