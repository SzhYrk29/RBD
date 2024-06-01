-- Zadanie 1 --

SELECT opis, round(((cena - koszt) / koszt * 100), '%') AS marza
FROM Towar
WHERE cena is NOT NULL
ORDER BY marza DESC
LIMIT 1;

SELECT opis, round(((cena - koszt) / koszt * 100), '%') AS marza
FROM Towar
WHERE cena is NOT NULL
ORDER BY marza ASC
LIMIT 1;


SELECT miasto, COUNT(nr) AS ilosc_kobiet
    FROM Klient
    WHERE tytul = 'Pani'
    GROUP BY miasto
    HAVING COUNT(nr) >2;

SELECT ROUND(AVG(cena), 2) AS srednia_cena
    FROM Towar
    WHERE cena > 10;

-- Zadanie 2 --

SELECT SUM(liczba) AS suma_zapasow
    FROM Zapas
    WHERE towar_nr IN (SELECT nr FROM Towar WHERE cena > 10);

SELECT DISTINCT z.klient_nr
    FROM Zamowienie z
    WHERE z.nr IN (
        SELECT p.zamowienie_nr
        FROM Pozycja p
        JOIN Towar t ON p.towar_nr = t.nr
        WHERE t.opis LIKE ('ramka%') AND t.cena > 10
        );

SELECT nr, imie, nazwisko
    FROM Klient
    WHERE nr IN (
        SELECT SUM(klient_nr)
        FROM Zamowienie
        GROUP BY klient_nr
        HAVING SUM(klient_nr) > (
            SELECT AVG(klient_nr)
            FROM Zamowienie
            )
        );

SELECT k.nr, k.imie, k.nazwisko
FROM Klient k
WHERE (
    SELECT COUNT(*)
    FROM Zamowienie z
    WHERE z.klient_nr = k.nr
) > (
    SELECT AVG(liczba_zamowien)
    FROM (
        SELECT COUNT(*) AS liczba_zamowien
        FROM Zamowienie
        GROUP BY klient_nr
    ) AS srednia_zamowien
);