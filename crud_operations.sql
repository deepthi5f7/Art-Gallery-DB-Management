USE art_gallery_db;

-- CREATE / INSERT
INSERT INTO artists (artist_name,email,nationality,birth_year)
VALUES ('Test Artist','testartist@example.com','Indian',1995);

-- READ / SELECT
SELECT * FROM artists
WHERE artist_name = 'Test Artist';

-- UPDATE
UPDATE artists
SET nationality = 'Indian'
WHERE artist_name = 'Test Artist';

-- DELETE
DELETE FROM artists
WHERE artist_name = 'Test Artist';
