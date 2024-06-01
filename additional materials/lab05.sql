ALTER TABLE Klient
    ADD COLUMN IF NOT EXISTS data_urodzenia DATE;

ALTER TABLE Klient
    DROP COLUMN IF EXISTS telefon;

UPDATE Zamowienie
    SET koszt_wysylki = 0.00
    WHERE data_wysylki IS NULL;

UPDATE Towar
    SET koszt = koszt * 1.1;

UPDATE Klient
    SET nazwisko = 'Maszke'
    WHERE nazwisko = 'Songin';

UPDATE Klient
    SET ulica_dom = 'Nowa 10', kod_pocztowy = '80-000', miasto = 'Gdańsk'
    WHERE nr = 15;

UPDATE Zapas
    SET ilosc = 0
    WHERE towar_nr in (1, 2, 3);

DELETE FROM Zapas
    WHERE ilosc = 0;

DELETE FROM Klient
    WHERE nr = 10;

DELETE FROM Kod_kreskowy
    WHERE towar_nr IS NULL;

ALTER TABLE Zapas
    RENAME COLUMN ilosc TO liczba;

ALTER TABLE Kod_kreskowy
    DROP CONSTRAINT Kod_kreskowy_ibfk_1;
ALTER TABLE Kod_kreskowy
    ADD CONSTRAINT FOREIGN KEY (towar_nr)
    REFERENCES Towar(nr) ON DELETE  CASCADE;
ALTER TABLE Pozycja
    DROP CONSTRAINT Pozycja_ibfk_2;
ALTER TABLE Pozycja
    ADD CONSTRAINT FOREIGN KEY (towar_nr)
    REFERENCES Towar(nr) ON DELETE CASCADE;
DELETE FROM Towar
    WHERE cena < 5;