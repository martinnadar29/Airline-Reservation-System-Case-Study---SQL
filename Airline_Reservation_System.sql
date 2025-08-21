
create database Airline_case_study 
use Airline_case_study
-- ==============================
-- Airline Reservation System
-- ==============================

-- Drop tables if already exist
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Flights;

-- ==============================
-- 1. Flights Table
-- ==============================
CREATE TABLE Flights (
    FlightID VARCHAR(10) PRIMARY KEY,
    Airline VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    Price DECIMAL(10,2)
);

INSERT INTO Flights VALUES
('F001','Air India','Mumbai','Delhi','2025-08-22 08:00','2025-08-22 10:10',5500),
('F002','Indigo','Mumbai','Bangalore','2025-08-22 09:30','2025-08-22 11:45',4200),
('F003','Vistara','Delhi','Kolkata','2025-08-23 06:00','2025-08-23 08:15',6000),
('F004','SpiceJet','Chennai','Delhi','2025-08-23 14:10','2025-08-23 16:45',4800),
('F005','Air India','Bangalore','Goa','2025-08-24 07:20','2025-08-24 08:50',3500),
('F006','Indigo','Kolkata','Mumbai','2025-08-24 19:00','2025-08-24 21:40',5200),
('F007','Vistara','Delhi','Mumbai','2025-08-25 06:30','2025-08-25 08:30',5800),
('F008','SpiceJet','Mumbai','Hyderabad','2025-08-25 11:15','2025-08-25 13:00',4000),
('F009','Air India','Hyderabad','Chennai','2025-08-26 08:10','2025-08-26 09:40',3700),
('F010','Indigo','Goa','Mumbai','2025-08-26 15:45','2025-08-26 17:10',3600),
('F011','Vistara','Mumbai','Delhi','2025-08-27 07:00','2025-08-27 09:10',NULL),
('F012','SpiceJet','Bangalore','Delhi','2025-08-27 18:00','2025-08-27 20:40',5100),
('F013','Air India','Chennai','Kolkata','2025-08-28 05:50','2025-08-28 08:30',5500),
('F014','Indigo','Mumbai','Pune','2025-08-28 09:40','2025-08-28 10:20',1800),
('F015','Vistara','Delhi','Hyderabad','2025-08-28 20:10','2025-08-28 22:10',6000);

-- ==============================
-- 2. Passengers Table
-- ==============================
CREATE TABLE Passengers (
    PassengerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

INSERT INTO Passengers VALUES
('P001','Rajesh Kumar',34,'M','rajesh@gmail.com','9876543210'),
('P002','Sneha Patel',29,'F','sneha@yahoo.com',NULL),
('P003','Arjun Mehta',42,'M','arjun@gmail.com','9988776655'),
('P004','Priya Sharma',26,'F','priya@outlook.com',NULL),
('P005','Rohit Verma',38,'M',NULL,'9876001122'),
('P006','Kavya Nair',31,'F','kavya@gmail.com','9001234567'),
('P007','Amit Singh',27,'M','amit@yahoo.com','9123456789'),
('P008','Neha Gupta',35,'F','neha@hotmail.com','9765432100'),
('P009','Vikram Rao',41,'M','vikram@outlook.com',NULL),
('P010','Ananya Das',24,'F','ananya@gmail.com','9876501234'),
('P011','Suresh Iyer',33,'M','suresh@rediff.com','9123456000'),
('P012','Meera Jain',28,'F','meera@gmail.com','8899776655'),
('P013','Manish Tiwari',37,'M',NULL,'9988991122'),
('P014','Pooja Reddy',30,'F','pooja@yahoo.com','9112233445'),
('P015','Karan Malhotra',29,'M','karan@gmail.com',NULL);

-- ==============================
-- 3. Bookings Table
-- ==============================
CREATE TABLE Bookings (
    BookingID VARCHAR(10) PRIMARY KEY,
    FlightID VARCHAR(10),
    PassengerID VARCHAR(10),
    BookingDate DATE,
    SeatNo VARCHAR(5),
    Status VARCHAR(20),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

INSERT INTO Bookings VALUES
('B001','F001','P001','2025-08-15','12A','Confirmed'),
('B002','F001','P002','2025-08-15','12B','Confirmed'),
('B003','F002','P003','2025-08-16','15C','Cancelled'),
('B004','F003','P004','2025-08-16',NULL,'Confirmed'),
('B005','F004','P005','2025-08-17','8A','Confirmed'),
('B006','F005','P006','2025-08-17','9C','Pending'),
('B007','F006','P007','2025-08-18','14D','Confirmed'),
('B008','F006','P008','2025-08-18','14E','Confirmed'),
('B009','F007','P009','2025-08-19','7B','Cancelled'),
('B010','F008','P010','2025-08-19','10F','Confirmed'),
('B011','F009','P011','2025-08-20','6C','Pending'),
('B012','F010','P012','2025-08-20','11D','Confirmed'),
('B013','F011','P013','2025-08-21','13A','Confirmed'),
('B014','F012','P014','2025-08-21',NULL,'Confirmed'),
('B015','F013','P015','2025-08-22','5B','Confirmed');

select * from Passengers;
select * from Bookings;
select * from Flights ;

Basic Level (1–5)

1.List all flights from Mumbai.

select * 
from flights 
where Source ="Mumbai"

2.Find all passengers whose phone number is NULL.

select * 
from passengers 
where phone is null

3.Show bookings that are in “Pending” status.

select * 
from bookings 
where status ="Pending"

4.Get passenger names who have booked a flight with Air India.

select p.name,f.airline 
from passengers as p 
join bookings as b
on p.passengerid=b.passengerid
join flights  as f  
on f.flightid=b.flightid 
where f.airline ="Air india"


5.Display all unique airlines from the Flights table.

select distinct (airline)
from flights 


Intermediate Level 

6.Find the total number of bookings per airline.
select f.airline,count(b.bookingid) Number_of_Booking_per_plane 
from flights as f
join bookings as b 
on f.flightid=b.flightid 
group by f.airline 


7.Retrieve the average flight price per airline.
select airline,avg(price) as avg_per_flight
from flights 
group by airline
order by avg_per_flight desc


8.Show the top 5 most expensive flights.
select Airline,price
from flights 
order by price desc 
limit 5 

9.List passengers who have more than 1 booking.

select p.name,count(*) as Number_of_booking 
from passengers as p
join bookings as b 
on p.passengerid=b.passengerid 
group by p.name 
having  Number_of_booking>1




10.Find all flights that do not have a confirmed booking.

SELECT f.flightid, f.airline
FROM flights f
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.flightid = f.flightid 
      AND b.status = 'Confirmed'
);

Advanced Questions (11–15)

11.Show the total revenue generated per flight (only from confirmed bookings).

select f.Airline,sum(price) as Revenue_generated_per_flight 
from flights as f 
join bookings as b 
on f.flightid=b.flightid
where b.status = "Confirmed"
group by f.airline


12.Find the most frequently booked route (Source ➝ Destination).

SELECT f.Source, f.Destination, COUNT(b.BookingID) AS Total_Bookings
FROM Flights f
JOIN Bookings b ON f.FlightID = b.FlightID
GROUP BY f.Source, f.Destination
ORDER BY Total_Bookings DESC
LIMIT 1;


13.Retrieve the passenger(s) who booked the most flights overall.

select p.name ,count(b.bookingid) as Number_of_booked_flight 
from passengers  as p 
join bookings as b 
on p.passengerid=b.passengerid
group by p.name 


14.Display the flight with the highest number of cancellations.

select f.Airline,count(*) Number_of_cancellation
from flights as f 
join bookings as b 
on f.flightid=b.flightid
where b.status = "Cancelled" 
group by f.Airline 

15.Find the % of bookings that are Cancelled, Confirmed, Pending (Booking Status Ratio).
SELECT 
    Status,
    COUNT(*) AS Total_Bookings,
    ROUND( (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Bookings)), 2 ) AS Percentage
FROM Bookings
GROUP BY Status;

