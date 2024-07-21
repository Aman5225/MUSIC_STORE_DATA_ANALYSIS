--Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

SELECT SUM(total) as no_of_totalinvoices,billing_city
FROM invoice
Group by billing_city
Order by no_of_totalinvoices DESC