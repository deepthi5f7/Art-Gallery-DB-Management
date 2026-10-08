USE art_gallery_db;

CREATE OR REPLACE VIEW artwork_artist_view AS
SELECT
    ar.artwork_id,
    ar.title,
    a.artist_name,
    ar.category,
    ar.price,
    ar.availability
FROM artworks ar
JOIN artists a ON ar.artist_id = a.artist_id;

CREATE OR REPLACE VIEW sales_report AS
SELECT
    s.sale_id,
    c.customer_name,
    ar.title AS artwork,
    a.artist_name,
    s.sale_date,
    s.sale_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN artworks ar ON s.artwork_id = ar.artwork_id
JOIN artists a ON ar.artist_id = a.artist_id;

-- Test the views
SELECT * FROM artwork_artist_view;
SELECT * FROM sales_report;
