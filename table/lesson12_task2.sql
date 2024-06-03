USE lesson12_task_2;
CREATE TABLE Студенты (
    Идентификатор INT IDENTITY(1, 1) PRIMARY KEY,
    Имя VARCHAR(100),
    Фамилия VARCHAR(100)
);