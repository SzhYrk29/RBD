CREATE TABLE Studenci (
    nr_indeksu VARCHAR(6) PRIMARY KEY,
    imię VARCHAR(32) NOT NULL,
    nazwisko VARCHAR(32) NOT NULL
);

CREATE TABLE Przedmioty (
    kod INT PRIMARY KEY,
    nauczyciel_nr_legitymacji VARCHAR(6),
    rodzaj VARCHAR(20) NOT NULL,
    nazwa VARCHAR(50) NOT NULL,
    godziny TIME NOT NULL
);

CREATE TABLE Terminy (
    przedmiot_kod INT PRIMARY KEY NOT NULL,
    dzień_tygodnia VARCHAR(10) NOT NULL,
    godzina TIME NOT NULL,
    sala VARCHAR(5) NOT NULL
);

CREATE TABLE Nauczyciele (
       nr_legitymacji VARCHAR(6) PRIMARY KEY,
       imię VARCHAR(32) NOT NULL,
       nazwisko VARCHAR(32) NOT NULL
);

ALTER TABLE Przedmioty ADD FOREIGN KEY (nauczyciel_nr_legitymacji) REFERENCES Nauczyciele(nr_legitymacji);
ALTER TABLE Terminy  ADD FOREIGN KEY (przedmiot_kod) REFERENCES Przedmioty(kod);

CREATE TABLE Przedmioty_Studenci (
    student_nr_indeksu VARCHAR(6) NOT NULL,
    przedmiot_kod INT NOT NULL,
    PRIMARY KEY (student_nr_indeksu, przedmiot_kod),
    FOREIGN KEY (student_nr_indeksu) REFERENCES Studenci(nr_indeksu),
    FOREIGN KEY (przedmiot_kod) REFERENCES Przedmioty(kod)
);

INSERT INTO Studenci VALUES ('s29870', 'Snizhana', 'Yurko'),
                            ('s31646', 'Artur', 'Zhylin'),
                            ('s30561', 'Julia', 'Mattsson'),
                            ('s30308', 'Wiktor', 'Wiliński'),
                            ('s30897', 'Wiktor', 'Wilk');

INSERT INTO Nauczyciele VALUES ('123456', 'Michał', 'Hyla'),
                               ('234567', 'Magdalena', 'Szlendak'),
                               ('345678', 'Monika', 'Wrzosek'),
                               ('456789', 'Marek', 'Józefowicz'),
                               ('567890', 'Eryk', 'Sobczak');

INSERT INTO Przedmioty VALUES (1, '123456', 'Ćwiczenia', 'Relacyjne bazy danych', '10:30'),
                              (2, '234567', 'Lektorat', 'Język angielski', '13:00'),
                              (3, '456789', 'Ćwiczenia', 'Fizyka', '15:00'),
                              (4, '345678', 'Ćwiczenia', 'Analiza matematyczna', '12:00'),
                              (5, '567890', 'Ćwiczenia', 'Programowanie obiektowe w Javie', '13:45');

INSERT INTO Terminy VALUES (1, 'Monday', '10:30', 'A403'),
                           (2, 'Monday', '13:00', 'A506'),
                           (3, 'Monday', '15:00', 'A210'),
                           (4, 'Tuesday', '12:00', 'A312'),
                           (5, 'Tuesday', '13:45', 'A310');

INSERT INTO Przedmioty_Studenci VALUES ('s29870', 1),
                                       ('s29870', 2),
                                       ('s29870', 3),
                                       ('s29870', 4),
                                       ('s29870', 5);

SELECT * FROM Studenci;
SELECT * FROM Przedmioty;
SELECT * FROM Nauczyciele;
SELECT * FROM Terminy;
SELECT * FROM Przedmioty_Studenci;

DROP TABLE Przedmioty_Studenci;
DROP TABLE Terminy;
DROP TABLE Studenci;
DROP TABLE Przedmioty;
DROP TABLE Nauczyciele;