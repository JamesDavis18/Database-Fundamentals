-- Create Table Queries --

CREATE TABLE RaceType
	(Racenumber int NOT NULL AUTO_INCREMENT Primary Key,
	Racediscipline varchar (20),
	Race-track-surface varchar (15),
	Track-variation varchar (255),
	RaceDescription varchar (255),
	RaceLocation varchar (255),
	Vehicle-Types varchar (255),
	VehicleTypeID char (2),
	Teams varchar (255));
	
CREATE TABLE Location
	(LocationNum int NOT NULL AUTO_INCREMENT Primary Key,
	LocationID varchar (3),
	EventID char (3),
	RaceID varchar (6),
	TrackName varchar (255),
	Tracklength float (2,3),
	Tracktype varchar (255),
	Corners int (100),
	Town-city varchar (15),
	Country varchar (15),
	Postcode-AddressCode varchar (10),
	Coordinates varchar (20));

CREATE TABLE EventInfo
	(EventNum int NOT NULL AUTO_INCREMENT Primary Key,
	EventID varchar (3),
	RaceDisipline varchar (255),
	VehicleCategory varchar (3),
	VehiclePower int (4),
	VehicleCC int (7),
	VehicleWeight int (7),
	Vehicle-maxspeed  int (3),
	Number_of_laps varchar (2),
	No_of_races char (1),
	Booking ID char (1),
	DaysBooked int (1),
	Time_of_raceday varchar (10),
	Seat_Capacity int,
	Customer_name varchar (255));

CREATE TABLE Booking
	(BookingNum int NOT NULL AUTO_INCREMENT Primary Key,
	BookingID varchar (3),
	CustomerName varchar (255),
	DateInfo date,
	ArrivalTime time,
	RaceID varchar (6),
	DaysBooked int (2),
	SeatsBooked int (2),
	Stand-Name varchar (15),
	SeatingType varchar (15),
	Accomodation varchar (255));
	
CREATE TABLE DateInfo
	(DateID int NOT NULL AUTO_INCREMENT Primary Key,
	EventID varchar (3),
	DateInfo date,
	Race_start_time time,
	Duration varchar (10),
	Week int (3),
	No_of_Days int (2),
	CustomerID char (3));

CREATE TABLE Vendor
	(VendorNum int NOT NULL AUTO_INCREMENT Primary Key,
	VendorID varchar (2),
	BookingID varchar (2),
	Vendor_name varchar (255),
	EventID varchar (2),
	TicketNumber int (3),
	People_Attending int (2),
	Ticket_price decimal (8,2),
	Ticket_Type varchar (255),
	Seat_number int (4));

-- Alter Table Queries --

ALTER TABLE DateInfo AUTO_INCREMENT=100;
ALTER TABLE Booking AUTO_INCREMENT=1000;
ALTER TABLE Vendor AUTO_INCREMENT=50;
ALTER TABLE RaceType AUTO_INCREMENT=10;
	
-- Insert Queries --

INSERT INTO RaceType
	(Racenumber, Racediscipline, Race-track-surface, Track-variation, RaceDescription, RaceLocation, Vehicle-Types, VehicleTypeID, Teams)
	values (12, 'Formula 1', 'Asphalt', 'Grand prix circuit', 'British Grand Prix', 'Silverstone', 'Formula 1 cars' 'F1');

INSERT INTO Location
	(LocationID, EventID, RaceID, TrackName, Tracklength, Tracktype, Town-city, Country, Postcode-AddressCode, Coordinates) 
	values ('SpF', 'R23Sf' 'Spa Francorchamps' 7.004 'Permanent circuit' 20 'Malmedy' 'Belgium' 'N/A' '50.4369° N', '5.9720° E');

INSERT INTO EventInfo
	(EventID, RaceDisipline, VehicleCategory, VehiclePower, VehicleCC, VehicleWeight, Vehicle-maxspeed, Number_of_laps, No_of_races, Booking ID, DaysBooked, Time_of_raceday, Seat_Capacity, Customer_name)
	values ('R1S', 'World Rally Championship', 380, 1600, 1,200, 124, 'N/A', 1, 'S1', 3, '6 hours', 90000, 'Harrison Beale');
 
INSERT INTO Booking
	(BookingID, CustomerName, DateInfo, ArrivalTime, RaceID, DaysBooked, SeatsBooked, Stand-Name, SeatingType, Accomodation)
	values ('S1', 'Harrison Beale', 'HB1', '3/5/19', '8:00', 'R23Sf', 1, 5 ,'Stand 1', 'Standard', 'Hotel');
	
INSERT INTO DateInfo
	(EventID, Race_start_time, Duration, Week, No_of_Days, CustomerID)
	values ('S1', '3/5/19', '9:00', 'All day', 20, 3, 'HB1');

INSERT INTO Vendor
	(VendorID, BookingID, Vendor_name, EventID, TicketNumber, People_Attending, Ticket_price, Ticket_type, Seat_number)
	values ('BRC', 'S1', 'British Racing Company', 'S1', 53, 1, '£35.00', 56);
 
-- Select Queries --	
	
SELECT * FROM DateInfo
FULL OUTER JOIN Vendor On DateInfo.EventID = Vendor.EventID;

SELECT BookingID, Customer_name, Customer ID, DateInfo, Stand_name, ArrivalTime, SeatingType, Accommodationtype FROM Booking
UNION
SELECT * FROM DateInfo;

SELECT EventID, Vehicle Category, VehiclePower, RaceDiscipline, No_of_laps, No_of_races 
FROM EventInfo
INNER JOIN DateInfo ON EventInfo.EventID = DateInfo. EventID;

SELECT EventID, Vehicle Category, Vehicle_Power, RaceDiscipline, No_of_laps, No_of_races 
FROM EventInfo
INNER JOIN Booking ON EventInfo.EventID = Booking. EventID;

SELECT DateInfo.EventID, DateInfo.DateID, DateInfo.Date, DateInfo.Race Start Time, DateInfo.Duration, Location.LocationID, Location.Track Name,  Location.Track Length, Location.Track Type
FROM Location
LEFT JOIN DateInfo ON Location.EventID =  DateInfo.EventID
ORDER BY Location.Track Name;

SELECT  Racetype.Racenumber, Racetype.Race discipline, Racetype.Race track surface, Racetype.Vehicle types, Location.LocationID, Location.Track Name Location.Track Length, Location.Town/city, Location.Country
FROM Racetype
RIGHT JOIN Location ON Racetype.Racenumber = Location.Racenumber;

SELECT * 
FROM Booking
WHERE BookingID BETWEEN S15 AND S55;

DELETE FROM Vendor
WHERE Vendor Name= ‘Fast tickets.com’;

SELECT * FROM Vendor
WHERE Ticket price BETWEEN £35.00 AND £175.00;

SELECT 'BookingID', 'Customer name', 'Customer ID', 'Date', 'Time of arrival'
FROM Booking
WHERE BookingID IN (SELECT VendorID
			FROM Vendor
			WHERE Seat Number < 56);

SELECT Race_number, 'Race discipline', 'Race track surface', 'Track variation', 'Vehicle types', 'Teams', 'Race discipline'
FROM RaceType
WHERE RaceID IN (SELECT VehicleType
			FROM Location
			WHERE Track Length < 5km);

SELECT * FROM RaceType
WHERE Race track surface = ‘Asphalt’;

SELECT Ticket_price 

-- Update Queries --

UPDATE RaceType  
ADD Vehicle length Varchar(20), Vehicle width Varchar(20), Engine type Varchar(15);
