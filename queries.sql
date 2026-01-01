-- Query 1: Retrieve booking information with customer name and vehicle name
SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Vehicles v ON b.vehicle_id = v.vehicle_id;



-- Query 2: Find all vehicles that have never been booked
SELECT 
    vehicle_id,
    name,
    type,
    model,
    registration_number,
    rental_price,
    status
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Bookings b 
    WHERE b.vehicle_id = v.vehicle_id
);



-- Query 3: Retrieve all available vehicles of a specific type (cars)
SELECT 
    vehicle_id,
    name,
    type,
    model,
    registration_number,
    rental_price,
    status
FROM Vehicles
WHERE type = 'car' AND status = 'available';



-- Query 4: Find total bookings per vehicle (only vehicles with more than 2 bookings)
SELECT 
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
INNER JOIN Bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;
