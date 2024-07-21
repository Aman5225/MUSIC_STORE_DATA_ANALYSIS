--We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.


WITH popular_genre AS
(
	SELECT COUNT(invoice_line.quantity)AS purchases,customer.country,genre.genre_id,
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC ) AS RowNo
	FROM invoice_line
	JOIN invoice ON invoice.invoice_id  = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id=invoice_line.track_id
	JOIN genre on genre.genre_id=track.genre_id
	GROUP by    customer.country, 
    genre.genre_id

	ORDER BY 2 ASC,1 DESC
)
SELECT * FROM popular_genre WHERE RowNo <= 1
WITH popular_genre AS
(
	SELECT COUNT(invoice_line.quantity)AS purchases,customer.country,genre.genre_id,
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC ) AS RowNo
	FROM invoice_line
	JOIN invoice ON invoice.invoice_id  = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id=invoice_line.track_id
	JOIN genre on genre.genre_id=track.genre_id
	GROUP by    customer.country, 
    genre.genre_id

	ORDER BY 2 ASC,1 DESC
)
SELECT * FROM popular_genre WHERE RowNo <= 1