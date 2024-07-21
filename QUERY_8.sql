 query-- finds the customers who have spent the most money on music from the best-selling artist
WITH best_selling_artist AS (
	SELECT artist.artist_id AS artist_id,artist.name AS artist_name,
	SUM(invoice_line.unit_price*invoice_line.quantity)AS total_sales
	FROM invoice_line
	JOIN track On track.track_id=invoice_line.track_id
	JOIN album ON album.album_id=track.album_id
	JOIN artist ON artist.artist_id=album.artist_id
	Group by artist.artist_id
	ORDER BY total_sales DESC
	LIMIT 1
	
)
SELECT customer.customer_id,customer.first_name,customer.last_name,best_selling_artist.artist_name,
SUM(invoice_line.unit_price*invoice_line.quantity)As amount_spent
FROM invoice
JOIN customer on customer.customer_id=invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id=invoice.invoice_id
JOIN track On track.track_id=invoice_line.track_id
JOIN album ON album.album_id=track.album_id
JOIN best_selling_artist ON best_selling_artist.artist_id=album.artist_id
GROUP BY 1,2,3,4
ORDER BY 5

