USE JAMESDAVIS
GO

/* Inserting vehicle data and creating tables */
IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'RaceType' )
CREATE TABLE RaceType (
	Racenumber int IDENTITY (2,2) Primary Key,
	RaceDiscipline varchar (20),
	RaceTrackSurface varchar (15),
	TrackVariation varchar (255),
	RaceDescription varchar (255),
	RaceLocation varchar (255),
	VehicleTypes varchar (255),
	VehicleTypeID char (2),
	Teams varchar (255));
GO 

INSERT INTO RaceType (
	 Racediscipline, RaceTrackSurface, Trackvariation, RaceDescription, RaceLocation, VehicleTypes, VehicleTypeID, Teams)
	values ('Formula 1', 'Asphalt', 'Grand prix circuit', 'British Grand Prix', 'Silverstone', 'Formula 1 cars', 'F1', 'Ferrari, Red Bull, McLaren'),
	('Touring cars', 'Asphalt', 'S300 circuit', '3rd race of the season', 'Brands Hatch', 'Hatchbacks, saloons','TC','Honda, Subaru, Citroen'),
	('Super Bikes', 'Asphalt', 'National circuit', 'Mid-season race', 'Donnington Park', 'Racing Motorbikes', 'MB', 'Yamaha, Suzuki, Aprilia'),
	('12h Endurance Race', 'Asphalt/ Concrete', 'Nordschleife', '12 hours of Nürburgring', 'Nürburgring', 'LMP prototype cars, GT Cars', 'ED', 'Aston Martin, Ferrari, Audi');
GO

/* IF NOT EXISTS statement required to stop uneccsary  
IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Locations' )
 CREATE TABLE Locations (
	LocationNum int IDENTITY (2,2) Primary Key,
	LocationID varchar (3),
	RaceID varchar (6),
	TrackName varchar (255),
	Tracklength decimal (4,3),
	Tracktype varchar (255),
	Corners int,
	TownCity varchar (15),
	Country varchar (15),
	PostcodeAddressCode varchar (10),
	Coordinates varchar (20));
GO 

INSERT INTO Locations (
	LocationID, RaceID, TrackName, Tracklength, Tracktype, Corners, TownCity, Country, PostcodeAddressCode, Coordinates)
	values ('SpF', 'R23Sf', 'Spa Francorchamps', 7.004, 'Permanent circuit', 20, 'Malmedy', 'Belgium', 'N/A', '50.4369° N, 5.9720° E'),
	('Sn', 'R57Sn', 'Snetterton', 4.78, 'Pernament circuit', 13, 'Norwich', 'UK', 'NR16 2JU', '52.4636° N, 0.9458° E'),
	('AD', 'R12Ad', 'Adelaide Street Circuit', 3.219, 'Street circuit', 16, 'Adelaide', 'Australia', 'N/A', '34.92866 S, 138.59863  E'),
	('HcK', 'R48HcK', 'Hockenheimring', 4.574, 'Permanent circuit', 17, 'Heidelberg', 'Germany', '68754', '49.3299° N, 8.5709° E');
GO

IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'EventInfo' )
CREATE TABLE EventInfo (
	EventNum int IDENTITY (2,2) Primary Key,
	EventID varchar (3),
	RaceDisipline varchar (255),
	VehicleCategory varchar (3),
	VehiclePower int,
	VehicleCC int,
	VehicleWeight int,
	VehicleMaxspeed  int,
	Number_of_laps varchar (2),
	No_of_races char (1),
	BookingID char (1),
	DaysBooked int,
	Time_of_raceday varchar (25),
	Seat_Capacity int,
	Customer_name varchar (255));
GO 

INSERT INTO EventInfo (
	EventID, RaceDisipline, VehicleCategory, VehiclePower, VehicleCC, VehicleWeight, VehicleMaxspeed, Number_of_laps, No_of_races, BookingID, DaysBooked, Time_of_raceday, Seat_Capacity, Customer_name)
	values ('R1S', 'World Rally Championship', 'Rally cars', 380, 1600, 1200, 124, 'N/A', 1, 'S1', 3, '6 hours', 90000, 'Harrison Beale'),
	('R7F', 'Truck racing', 'Racing Trucks', 1100, 13000, 5500, 100, 20, 3, 'S15', 3, '5 hours', 25000, 'David Franks'),
	('R12H', 'GT3', 'GT3 Supercars', 600,  3800,  1419, 205, 23, 2, 'S55', 3, '7 hours', 210000, 'Bethany Green'),
	('R3G', 'Endurance Racing', 'LMP Endurance racers', 1000, 7500, 930, 213, 'N/A', 1,'S74', 2, '24 hours', 120000, 'Grahame Long');
GO

UPDATE EventInfo
   SET Number_of_laps = NULL
   where EventId = 'R3G';
GO

IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Booking' )
CREATE TABLE Booking (
	BookingNum int IDENTITY (2,2) Primary Key,
	BookingID varchar (3),
	CustomerName varchar (255),
	DateInfo date,
	ArrivalTime time,
	RaceID varchar (6),
	DaysBooked int,
	SeatsBooked int,
	StandName varchar (15),
	SeatingType varchar (15),
	Accomodation varchar (255));
GO 

INSERT INTO Booking
	(BookingID, CustomerName, DateInfo, ArrivalTime, RaceID, DaysBooked, SeatsBooked, StandName, SeatingType, Accomodation)
	values ('S1', 'Harrison Beale', 'HB1', '3/5/19', '8:00', 'R23Sf', 1, 5 ,'Stand 1', 'Standard', 'Hotel'),
	('S15', 'David Franks', 'DF1', '6/3/17', '10:30', 'R57Sn', 3, 2, 'Apex stand', 'Executive', 'Hotel'),
	('S55', 'Bethany Green', 'BG1', '5/7/18', '12:30', 'R12Ad', 2, 7, 'N/A', 'Own seating', 'Tents'),
	('S74', 'Grahame Long', 'GL1', '15/7/15', '14:00', 'R48HcK', 1, 4, 'Stand 5', 'Standard', 'Caravan');
GO

IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'DateInfo' )
CREATE TABLE DateInfo (
	DateID int IDENTITY (2,2) Primary Key,
	EventID varchar (3),
	DateInfo date,
	Race_start_time time,
	Duration varchar (10),
	WeekNum int,
	No_of_Days int,
	CustomerID char (3));
GO 

INSERT INTO DateInfo
	(EventID, Race_start_time, Duration, WeekNum, No_of_Days, CustomerID)
	values ('S1', '3/5/19', '9:00', 'All day', 20, 3, 'HB1'),
	('R7F', '6/3/17', '11:00', '5 hours', 13, 2, 'DF1'),
	('R12H', '5/7/18', '14:15', '3 hours', 28, 2, 'BG1'),
	('R3G', '15/10/15', '16:00', '2 hours 15 minutes', 42, 1, 'GL1');
GO

IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Vendor' )
CREATE TABLE Vendor (
	VendorNum int IDENTITY (2,2) Primary Key,
	VendorID varchar (2),
	BookingID varchar (2),
	Vendor_name varchar (255),
	EventID varchar (2),
	TicketNumber int,
	People_Attending int,
	Ticket_price decimal (8,2),
	Ticket_Type varchar (255),
	Seat_number int );
GO

INSERT INTO Vendor
	(VendorID, BookingID, Vendor_name, EventID, TicketNumber, People_Attending, Ticket_price, Ticket_type, Seat_number)
	values ('BRC', 'S1', 'British Racing Company', 'S1', 53, 1, '£35.00','Standard', 56),
	('FTC', 'S15', 'Fast tickets.com', 'R7F', 445, 5, '£175.00', 'Group', 12),
	('RL', 'S55', 'Racingline', 'R12H', 642, 2, '£54.00', 'Senior', 37),
	('EVC', 'S74', 'EventCheck', 'R3G', 32, 6, '£192.00', 'Executive', 120)
GO

/* Select statements and variations */
/* This section includes Join variations, Subqueries and others */
/* Full outer join example, not possible in MySql */
SELECT * FROM DateInfo
FULL OUTER JOIN Vendor On DateInfo.EventID = Vendor.EventID;
GO