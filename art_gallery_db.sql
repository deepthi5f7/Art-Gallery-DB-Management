DROP DATABASE IF EXISTS art_gallery_db;
CREATE DATABASE art_gallery_db;
USE art_gallery_db;

CREATE TABLE artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    phone VARCHAR(20),
    nationality VARCHAR(60),
    birth_year INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(60)
);

CREATE TABLE galleries (
    gallery_id INT PRIMARY KEY AUTO_INCREMENT,
    gallery_name VARCHAR(120) NOT NULL,
    location VARCHAR(120),
    contact_email VARCHAR(120)
);

CREATE TABLE artworks (
    artwork_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(60),
    creation_year INT,
    price DECIMAL(12,2) NOT NULL,
    availability ENUM('Available','Sold','Reserved') DEFAULT 'Available',
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE exhibitions (
    exhibition_id INT PRIMARY KEY AUTO_INCREMENT,
    gallery_id INT NOT NULL,
    exhibition_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (gallery_id) REFERENCES galleries(gallery_id)
);

CREATE TABLE exhibition_artworks (
    exhibition_id INT NOT NULL,
    artwork_id INT NOT NULL,
    PRIMARY KEY (exhibition_id, artwork_id),
    FOREIGN KEY (exhibition_id) REFERENCES exhibitions(exhibition_id),
    FOREIGN KEY (artwork_id) REFERENCES artworks(artwork_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    artwork_id INT NOT NULL,
    customer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    sale_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (artwork_id) REFERENCES artworks(artwork_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method ENUM('Cash','Card','UPI','Bank Transfer') NOT NULL,
    payment_status ENUM('Paid','Pending','Partial') DEFAULT 'Paid',
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);

INSERT INTO artists (artist_name,email,phone,nationality,birth_year) VALUES
('Ravi Varma','ravi@example.com','9876500001','Indian',1978),
('Ananya Rao','ananya@example.com','9876500002','Indian',1985),
('Meera Kapoor','meera@example.com','9876500003','Indian',1990),
('Arjun Menon','arjun@example.com','9876500004','Indian',1982),
('Sofia Williams','sofia@example.com','9876500005','British',1975);

INSERT INTO customers (customer_name,email,phone,city) VALUES
('Rahul Sharma','rahul@example.com','9000000001','Hyderabad'),
('Priya Reddy','priya@example.com','9000000002','Bengaluru'),
('Kiran Kumar','kiran@example.com','9000000003','Chennai'),
('Neha Singh','neha@example.com','9000000004','Mumbai'),
('Amit Verma','amit@example.com','9000000005','Delhi');

INSERT INTO galleries (gallery_name,location,contact_email) VALUES
('Canvas House','Hyderabad','canvas@example.com'),
('Art Avenue','Bengaluru','avenue@example.com'),
('Modern Frames','Mumbai','frames@example.com');

INSERT INTO artworks (artist_id,title,category,creation_year,price,availability) VALUES
(1,'Royal Heritage','Traditional',2021,85000,'Available'),
(1,'Village Morning','Landscape',2022,65000,'Sold'),
(2,'Colors of Life','Abstract',2023,95000,'Available'),
(2,'Silent Beauty','Portrait',2022,72000,'Sold'),
(3,'Ocean Dreams','Landscape',2024,110000,'Available'),
(3,'Golden Sunset','Landscape',2023,78000,'Reserved'),
(4,'Urban Rhythm','Modern',2024,125000,'Sold'),
(4,'City Lights','Modern',2022,90000,'Available'),
(5,'Blue Horizon','Abstract',2023,105000,'Sold'),
(5,'The Garden','Nature',2024,68000,'Available');

INSERT INTO exhibitions (gallery_id,exhibition_name,start_date,end_date) VALUES
(1,'Indian Heritage Collection','2026-01-10','2026-02-10'),
(2,'Contemporary Art Week','2026-03-01','2026-03-20'),
(3,'Colors and Forms','2026-04-05','2026-04-30');

INSERT INTO exhibition_artworks VALUES
(1,1),(1,2),(1,4),
(2,3),(2,7),(2,8),
(3,5),(3,9),(3,10);

INSERT INTO sales (artwork_id,customer_id,sale_date,sale_amount) VALUES
(2,1,'2026-02-15',65000),
(4,2,'2026-03-05',72000),
(7,3,'2026-03-18',125000),
(9,4,'2026-04-12',105000);

INSERT INTO payments (sale_id,payment_date,amount,payment_method,payment_status) VALUES
(1,'2026-02-15',65000,'UPI','Paid'),
(2,'2026-03-05',72000,'Card','Paid'),
(3,'2026-03-18',125000,'Bank Transfer','Paid'),
(4,'2026-04-12',50000,'Card','Partial');
