-- Zadanie 1 --
SELECT DISTINCT Klient.imie, Klient.nazwisko
    FROM Klient
    INNER JOIN Zamowienie
    ON Klient.nr = Zamowienie.klient_nr
    WHERE Klient.nr = Zamowienie.klient_nr
    ORDER BY nazwisko;

SELECT Zamowienie.nr, Zamowienie.data_zlozenia, Pozycja.ilosc
    FROM Zamowienie
    LEFT JOIN Pozycja
    ON Zamowienie.nr = Pozycja.zamowienie_nr
UNION ALL
SELECT Zamowienie.nr, Zamowienie.data_zlozenia, Pozycja.ilosc
    FROM Zamowienie
    RIGHT JOIN Pozycja
    ON Zamowienie.nr = Pozycja.zamowienie_nr;

-- Zadanie 2 --
SELECT Klient.imie, Klient.nazwisko, Zamowienie.data_zlozenia
    FROM Klient
    INNER JOIN Zamowienie
    ON Klient.nr = Zamowienie.klient_nr;

SELECT Klient.imie, Klient.nazwisko
    FROM Klient
    WHERE nr NOT IN
          (SELECT Klient.nr FROM Klient
            INNER JOIN Zamowienie
            ON Klient.nr = Zamowienie.klient_nr);

SELECT Towar.nr, Towar.opis, Zapas.liczba
    FROM Towar
    LEFT JOIN Zapas
    ON Towar.nr = Zapas.towar_nr;

SELECT DISTINCT concat(a.imie, ', ', a.nazwisko) AS klient1,
                concat(b.imie, ', ', b.nazwisko) AS klient2
    FROM Klient a
    JOIN Klient b
    ON a.miasto = b.miasto AND a.nr < b.nr;

SELECT DISTINCT a.opis AS towar1, b.opis AS towar2
    FROM Towar a
    JOIN Towar b
    ON a.cena = b.cena AND a.koszt = b.koszt AND a.nr < b.nr;

SELECT Towar.nr, Towar.opis, Kod_kreskowy.kod
    FROM Towar
    INNER JOIN Kod_kreskowy
    ON Towar.nr = Kod_kreskowy.towar_nr;