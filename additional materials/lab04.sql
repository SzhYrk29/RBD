-- Zadanie 1 --
SELECT * FROM Klient
         ORDER BY miasto;

SELECT * FROM Towar
         ORDER BY opis;

SELECT * FROM Zamowienie
         ORDER BY koszt_wysylki;

SELECT * FROM Kod_kreskowy
         ORDER BY kod;

SELECT nazwisko,
       concat(miasto, ', ', ulica_dom, ', ', kod_pocztowy) AS adress
    FROM Klient;

SELECT nr, data_zlozenia, data_wysylki
    FROM Zamowienie
    ORDER BY data_zlozenia;

SELECT nr, opis, concat(round(((cena - koszt)/koszt) * 100), '%') AS Zysk
    FROM Towar
    WHERE cena IS NOT NULL AND cena != 0;

SELECT nr, concat(data_wysylki - data_zlozenia, ' days')
    AS Czas_realizacji_zamowienia
    FROM Zamowienie
    WHERE data_wysylki IS NOT NULL;

-- Zadanie 2 --
SELECT * FROM Klient
         WHERE miasto != 'Gdańsk';

SELECT * FROM Klient
         WHERE telefon IS NULL;

SELECT * FROM Klient
         WHERE miasto != 'Gdańsk' AND telefon IS NULL;

SELECT * FROM Zamowienie
         WHERE data_wysylki IS NULL;

SELECT * FROM Zamowienie
         WHERE data_wysylki BETWEEN '2017/02/01' AND '2017/02/29'
         ORDER BY data_wysylki;