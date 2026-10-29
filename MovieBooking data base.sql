CREATE DATABASE MovieBookingDB;

USE MovieBookingDB;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    genre VARCHAR(50),
    language VARCHAR(30),
    duration_minutes INT,
    rating DECIMAL(3,1)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    age INT
);
	CREATE TABLE Bookings (
		booking_id INT PRIMARY KEY,
		customer_id INT,
		movie_id INT,
		tickets_booked INT,
		ticket_price DECIMAL(10,2),
		booking_date DATE,
		booking_status VARCHAR(30),
		FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
		FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
	);
INSERT INTO Movies VALUES
(1, 'bahubali', 'Action', 'Telugu', 187, 8.0),
(2, 'Jersey', 'Drama', 'Telugu', 157, 8.5),
(3, 'F1', 'action', 'English', 148, 8.8),
(4, 'Leo', 'Action', 'Tamil', 164, 7.8),
(5, 'Jawan', 'Action', 'Hindi', 169, 7.2),
(6, '3 Idiots', 'Comedy', 'Hindi', 170, 8.4),
(7, 'Avatar', 'Sci-Fi', 'English', 162, 7.9),
(8, 'Radhe Shyam', 'Romance', 'Telugu', 138, 5.2);

INSERT INTO Customers VALUES
(1, 'Surya', 'surya87@gmail.com', 'Chennai', 21),
(2, 'Kiran', 'kiran88@gmail.com', 'Hyderabad', 22),
(3, 'Ravi', 'ravi999@gmail.com', 'Chennai', 23),
(4, 'kumar', 'kumar@gmail.com', 'Bangalore', 20),
(5, 'teja', 'teja4@gmail.com', 'Vijayawada', 24),
(6, 'Rahul', 'rahul@gmail.com', 'Chennai', 25),
(7, 'Sneha', 'sneha@gmail.com', 'Mumbai', 21),
(8, 'Arjun', 'arjun@gmail.com', 'Hyderabad', 26),
(9, 'Divya', NULL, 'Chennai', 22),
(10, 'Manoj', 'manoj@gmail.com', NULL, 27);

INSERT INTO Bookings VALUES
(1, 1, 1, 3, 200.00, '2026-10-01', 'Confirmed'),
(2, 2, 3, 2, 250.00, '2026-10-02', 'Confirmed'),
(3, 3, 2, 4, 180.00, '2026-10-03', 'Confirmed'),
(4, 4, 4, 2, 220.00, '2026-10-04', 'Cancelled'),
(5, 5, 6, 5, 150.00, '2026-10-05', 'Confirmed'),
(6, 6, 1, 4, 200.00, '2026-10-06', 'Confirmed'),
(7, 7, 5, 3, 230.00, '2026-10-07', 'Pending'),
(8, 8, 3, 6, 250.00, '2026-10-08', 'Confirmed'),
(9, 1, 2, 2, 180.00, '2026-10-09', 'Confirmed'),
(10, 2, 6, 4, 150.00, '2026-10-10', 'Pending'),
(11, 3, 1, 5, 200.00, '2026-10-11', 'Confirmed'),
(12, 4, 7, 3, 240.00, '2026-10-12', 'Cancelled'),
(13, 5, 4, 2, 220.00, '2026-10-13', 'Confirmed'),
(14, 6, 3, 4, 250.00, '2026-10-14', 'Confirmed'),
(15, 8, 5, 3, 230.00, '2026-10-15', 'Pending');

SHOW TABLES;

SELECT * FROM Movies;
SELECT * FROM Customers;
SELECT * FROM Bookings;

SELECT * FROM Movies;

SELECT movie_name, genre, rating
FROM Movies;

SELECT *
FROM Movies
WHERE rating > 7.5;

SELECT *
FROM Bookings
WHERE tickets_booked BETWEEN 2 AND 5;

SELECT *
FROM Movies
WHERE genre IN ('Action', 'Comedy');

SELECT *
FROM Customers
WHERE city = 'Chennai';

SELECT *
FROM Bookings
ORDER BY ticket_price DESC
LIMIT 5;

SELECT DISTINCT genre
FROM Movies;

SELECT COUNT(*) AS total_movies
FROM Movies;

SELECT COUNT(*) AS total_customers
FROM Customers;

SELECT SUM(tickets_booked * ticket_price) AS total_revenue
FROM Bookings;

SELECT
    AVG(rating) AS average_rating,
    MAX(rating) AS highest_rating,
    MIN(rating) AS lowest_rating
FROM Movies;

SELECT
    m.movie_name,
    SUM(b.tickets_booked) AS total_tickets
FROM Movies m
INNER JOIN Bookings b
    ON m.movie_id = b.movie_id
GROUP BY m.movie_id, m.movie_name;

SELECT
    m.movie_name,
    SUM(b.tickets_booked) AS total_tickets
FROM Movies m
INNER JOIN Bookings b
    ON m.movie_id = b.movie_id
GROUP BY m.movie_id, m.movie_name
HAVING SUM(b.tickets_booked) > 10;

SELECT
    booking_status,
    COUNT(*) AS total_bookings
FROM Bookings
GROUP BY booking_status;

SELECT *
FROM Customers
WHERE email IS NULL
   OR city IS NULL;
   
   SELECT
    email,
    COUNT(*) AS duplicate_count
FROM Customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1;

SELECT
    movie_name,
    rating,
    CASE
        WHEN rating >= 8 THEN 'Excellent'
        WHEN rating >= 6 AND rating < 8 THEN 'Good'
        WHEN rating < 6 THEN 'Needs Improvement'
    END AS movie_category
FROM Movies;

SELECT
    c.customer_name,
    m.movie_name,
    b.booking_date,
    b.tickets_booked
FROM Bookings b
INNER JOIN Customers c
    ON b.customer_id = c.customer_id
INNER JOIN Movies m
    ON b.movie_id = m.movie_id;
    
    SELECT
    m.movie_name,
    b.booking_id,
    b.tickets_booked
FROM Movies m
LEFT JOIN Bookings b
    ON m.movie_id = b.movie_id;
    
    SELECT
    c.customer_id,
    c.customer_name
FROM Customers c
LEFT JOIN Bookings b
    ON c.customer_id = b.customer_id
WHERE b.booking_id IS NULL;

SELECT
    m.movie_name,
    SUM(b.tickets_booked * b.ticket_price) AS total_revenue
FROM Movies m
INNER JOIN Bookings b
    ON m.movie_id = b.movie_id
GROUP BY m.movie_id, m.movie_name
ORDER BY total_revenue DESC
LIMIT 1;










