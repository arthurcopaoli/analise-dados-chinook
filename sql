USE Chinook;

-- Quais sao os 10 paises que mais geraram receita

SELECT 
	billingcountry,
    SUM(total) total_revenue
FROM Chinook.Invoice
GROUP BY billingcountry
ORDER BY SUM(total) DESC
LIMIT 10;

-- Foi identificado que os Estados Unidos representa 523.06 do nosso faturamento, sendo assim ele é o pais n1

-- TASK 2
-- Eles pediram uma lista com: "O nome da música, o nome do álbum e o nome do artista."

SELECT * FROM TRACK;
SELECT * FROM album;
SELECT * FROM artist;

SELECT 
	t.name AS track_name,
	a.title AS album_title,
    artist.name AS artist_name
FROM track t
INNER JOIN album a
ON t.albumid = a.albumid
INNER JOIN artist artist
ON a.artistid = artist.artistid;

-- TASK 3
-- O setor financeiro quer ver o faturamento total por ano. Eles querem uma tabela com duas colunas: 
-- o Ano e o Total vendido naquele ano

SELECT * FROM invoice;

SELECT 
	YEAR(invoicedate) year,
    SUM(total) total_revenue
FROM invoice
GROUP BY year;

-- TASK 4
-- "O gerente quer identificar os países promissores. 
-- Liste todos os países que tiveram um faturamento total maior que 100 dólares."

SELECT * FROM invoice;

SELECT 
	billingcountry AS country,
    SUM(Total) AS total_revenue
FROM invoice
GROUP BY billingcountry
HAVING total_revenue > 100
ORDER BY total_revenue DESC;
