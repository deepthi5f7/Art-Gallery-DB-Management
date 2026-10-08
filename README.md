# Art Gallery Database Management System

A MySQL database project designed to manage artists, artworks, customers, exhibitions, galleries, sales, and payments in an art gallery.

## Technologies
- MySQL
- SQL
- Git / GitHub

## Main Features
- Artist and artwork management
- Customer management
- Gallery and exhibition management
- Artwork sales and payment tracking
- Primary keys and foreign keys
- CRUD operations
- JOIN queries
- Aggregate functions
- GROUP BY and HAVING
- Subqueries
- Views
- Business-oriented SQL reports

## Database Structure

Main tables:
- `artists`
- `customers`
- `galleries`
- `artworks`
- `exhibitions`
- `exhibition_artworks`
- `sales`
- `payments`

## How to Run

1. Install MySQL 8.x.
2. Open MySQL Workbench or MySQL Command Line Client.
3. Run `database/art_gallery_db.sql`.
4. Select the `art_gallery_db` database.
5. Run the queries in `sql/queries.sql`.
6. Run `sql/views.sql` to create reporting views.

## GitHub Upload

```bash
git init
git add .
git commit -m "Initial commit - Art Gallery DB Management System"
git branch -M main
git remote add origin YOUR_GITHUB_REPOSITORY_URL
git push -u origin main
```

## Project Objective

The objective of this project is to demonstrate practical SQL and database management skills by designing and querying a relational database for an art gallery.

## Skills Demonstrated
SQL, MySQL, database design, normalization concepts, DDL, DML, joins, subqueries, aggregate functions, views, constraints, and reporting.
