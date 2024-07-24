-- Views.sql

-- View 1: PassengerPurchases
-- This view shows the purchases made by passengers at the duty-free shops.
CREATE VIEW PassengerPurchasesView1 AS
SELECT 
    p.PASSENGER_ID, 
    p.PASSENGER_NAME, 
    p.PASSENGER_EMAIL, 
    s.SALEID, 
    s.DATEOFSALE, 
    s.TOTALAMOUNT, 
    pr.PRODUCTNAME, 
    pr.PRICE, 
    e.EMPLOYEENAME
FROM 
    Passengers p
JOIN 
    Sales s ON p.PASSENGER_ID = s.CustomerID
JOIN 
    Products pr ON s.SaleID = pr.ProductID
JOIN 
    Employees e ON s.EmployeeID = e.EmployeeID;

-- View 2: FlightPassengerDetails
-- This view shows flight details along with the passengers who have booked the flights.
CREATE VIEW FlightPassengerDetailsView2 AS
SELECT 
    f.FLIGHT_ID, 
    f.FLIGHT_NUMBER, 
    f.DEPARTURE_TIME, 
    f.ARRIVAL_TIME, 
    f.DEPARTURE_AIRPORT, 
    f.ARRIVAL_AIRPORT, 
    p.PASSENGER_ID, 
    p.PASSENGER_NAME, 
    p.PASSENGER_EMAIL, 
    b.BOOKING_ID, 
    b.SEAT_NUMBER
FROM 
    Flights f
JOIN 
    Bookings b ON f.FLIGHT_ID = b.FLIGHT_ID
JOIN 
    Passengers p ON b.PASSENGER_ID = p.PASSENGER_ID;

-- Queries on Views

-- Queries on View 1: PassengerPurchases

-- Query 1: Retrieve all purchases made by a specific passenger.
SELECT * 
FROM PassengerPurchasesView1
WHERE PASSENGER_ID = 103;

-- Query 2: Retrieve total sales amount made by all passengers.
SELECT PASSENGER_ID, PASSENGER_NAME, SUM(TOTALAMOUNT) AS TOTAL_SPENT
FROM PassengerPurchasesView1
GROUP BY PASSENGER_ID, PASSENGER_NAME;

-- Queries on View 2: FlightPassengerDetails

-- Query 1: Retrieve all passengers booked on a specific flight.
SELECT * 
FROM FlightPassengerDetailsView2
WHERE FLIGHT_ID = 202;

-- Query 2: Retrieve details of all flights a specific passenger is booked on.
SELECT * 
FROM FlightPassengerDetailsView2
WHERE PASSENGER_ID = 101;



commit;
