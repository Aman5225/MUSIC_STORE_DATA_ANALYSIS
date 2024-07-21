--the top 10 artists with the most songs in the 'Rock' genre, along with their artist ID, name, and the number of songs they have in that genre
SELECT artist.artist_id,artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album On album.album_id=track.album_id
JOIN artist  ON artist.artist_id=album.artist_id
JOIN genre ON genre.genre_id=track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
Order by number_of_songs DESC
LIMIT 10

