USE art_gallery_db;

-- 1. Display all artists
SELECT * FROM artists;

-- 2. Display available artworks
SELECT * FROM artworks
WHERE availability = 'Available';

-- 3. Find artworks with price greater than 80000
SELECT title, price
FROM artworks
WHERE price > 80000
ORDER BY price DESC;

-- 4. Display artworks with artist names
SELECT a.artist_name, ar.title, ar.category, ar.price
FROM artworks ar
JOIN artists a ON ar.artist_id = a.artist_id
ORDER BY ar.price DESC;

-- 5. Display all sales with customer and artwork details
SELECT s.sale_id, c.customer_name, ar.title,
       s.sale_date, s.sale_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN artworks ar ON s.artwork_id = ar.artwork_id;

-- 6. Total sales revenue
SELECT SUM(sale_amount) AS total_revenue
FROM sales;

-- 7. Average artwork price
SELECT AVG(price) AS average_artwork_price
FROM artworks;

-- 8. Number of artworks by category
SELECT category, COUNT(*) AS artwork_count
FROM artworks
GROUP BY category
ORDER BY artwork_count DESC;

-- 9. Total sales by customer
SELECT c.customer_name, SUM(s.sale_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 10. Artists whose artworks have an average price above 80000
SELECT a.artist_name, AVG(ar.price) AS average_price
FROM artists a
JOIN artworks ar ON a.artist_id = ar.artist_id
GROUP BY a.artist_id, a.artist_name
HAVING AVG(ar.price) > 80000;

-- 11. Most expensive artwork
SELECT title, price
FROM artworks
WHERE price = (SELECT MAX(price) FROM artworks);

-- 12. Customers who purchased artwork
SELECT DISTINCT c.customer_name, c.city
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;

-- 13. Pending or partial payments
SELECT p.payment_id, s.sale_id, p.amount, p.payment_method, p.payment_status
FROM payments p
JOIN sales s ON p.sale_id = s.sale_id
WHERE p.payment_status IN ('Pending','Partial');

-- 14. Exhibition details with gallery names
SELECT e.exhibition_name, g.gallery_name,
       e.start_date, e.end_date
FROM exhibitions e
JOIN galleries g ON e.gallery_id = g.gallery_id;

-- 15. Number of artworks displayed in each exhibition
SELECT e.exhibition_name, COUNT(ea.artwork_id) AS artwork_count
FROM exhibitions e
LEFT JOIN exhibition_artworks ea
ON e.exhibition_id = ea.exhibition_id
GROUP BY e.exhibition_id, e.exhibition_name;
