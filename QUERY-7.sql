--retrieves the names and lengths (in milliseconds) of tracks that are longer than the average
SELECT name,milliseconds
FROM track
WHERE milliseconds >(
	SELECT AVG(milliseconds) AS averge_track_length
	FROM track
)
ORDER BY milliseconds DESC