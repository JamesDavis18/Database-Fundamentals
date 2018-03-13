create table "producttable" (
	"prodCode" varchar(5),
	"pName" varchar(20),
	"pPhotoLoc" varchar(30),
	"pMaxspeed" int(3),
	"pWeight" int(6),
	"plength" float(3),
	"prodPower_Thrust" int(6),
	"pEngine_capacity" varchar(7),
	"pEngine_cylinders" int(1), 
	"pWingspan" float(4),
	"pRange" varchar(10),
	"pCool_factor" number(2,0);

insert into producttable
	(prodCode, pName, pPhotoLoc, pMaxspeed, pWeight, plength, prodPower,)
	values ('D2','Welte 180', 'welte.jpg', 25, 9200, 7.30, 174,); 
	
insert into producttable
	(prodCode, pName, pPhotoLoc, pMaxspeed, prodPower_Thrust, pEngine_capacity, pCool_factor)
	values ('N/A', 'Mclaren F1', 'mcclarenf1.jpg', 618, '3.800cc', 9);
	
insert into producttable
	(prodCode, pName, pPhotoLoc, pMaxspeed, prodPower_Thrust, pEngine_capacity, pEngine_cylinders)
	values ('A4', 'Kawasaki ZXR 750', 'kawasaki.jpg', 160, '749cc',);
	
insert into producttable
	(prodcode, pName, pPhotoLoc, pMaxspeed, prodPower_Thrust, plength, pWeight, pWingspan, pRange)
	values ('A1', 'Airbus A380-800', 'airbus380.png', 127800, 72.75, 560000, 72.75, '14800miles');