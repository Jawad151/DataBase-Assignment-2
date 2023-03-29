create database airport

use airport

-----------------------------------------------------------------------------------------------------
--POINT 1




CREATE TABLE plane_type (
  model_no VARCHAR(20) PRIMARY KEY,
  capacity INT NOT NULL,
  Weightage INT NOT NULL
);

INSERT INTO plane_type(model_no ,CAPACITY,weightage)
VALUES ('BOEING 720' ,120 , 39412 ),
       ('Airbus A380', 853, 575000),
       ('Boeing 737', 215, 82000),
       ('Embraer E175', 76, 44200),
       ('Cessna 172', 4, 2300),
	   ('Boeing 787', 330, 254000),
       ('Airbus A319', 124, 64500),
       ('Global 7500', 19, 49900),
       ('Embraer E190', 114, 51900),
       ('Cessna Citation X', 8, 16100),
       ('Airbus A321', 236, 93500),
       ('Boeing 767', 375, 362000),
       ('Boeing 757', 289, 127000),
       ('Embraer E145', 50, 20500),
       ('Bombardier 650', 12, 22800),
       ('Cessna CJ3', 6, 10100),
       ('Gulfstream G650', 19, 34500),
       ('Boeing 737 MAX', 230, 82000),
       ('Airbus A330', 440, 242000),
       ('Boeing 777X', 426, 352000);



CREATE TABLE Hanger (
  number INT PRIMARY KEY,
  capacity INT NOT NULL,
  location VARCHAR(20) NOT NULL
);



INSERT INTO Hanger (number, capacity, location)
VALUES (3, 12, 'West Hangar Row'),
       (4, 8, 'East Hangar Row'),
       (5, 15, 'North Hangar Row'),
       (6, 6, 'South Hangar Row'),
       (8, 10, 'Central Hangar Row'),
       (7, 4, 'West Hangar Row'),
       (9, 14, 'North Hangar Row'),
       (12, 7, 'East Hangar Row'),
       (15, 9, 'South Hangar Row'),
       (18, 11, 'Central Hangar Row'),
       (21, 6, 'West Hangar Row'),
       (24, 12, 'North Hangar Row'),
       (27, 8, 'East Hangar Row'),
       (30, 13, 'South Hangar Row'),
       (33, 5, 'Central Hangar Row'),
       (36, 9, 'West Hangar Row'),
       (39, 11, 'North Hangar Row'),
       (42, 7, 'East Hangar Row'),
       (45, 15, 'South Hangar Row'),
       (48, 10, 'Central Hangar Row');





CREATE TABLE airplane_ (
  reg_no int PRIMARY KEY,
  plane_t VARCHAR(20) NOT NULL,
  hanger INT,
  FOREIGN KEY (plane_t) REFERENCES plane_type(model_no),
  FOREIGN KEY (hanger) REFERENCES Hanger(number)
);


INSERT INTO airplane_(reg_no, plane_t, hanger)
VALUES (1, 'BOEING 720', 3),
       (2, 'Airbus A380', 4),
       (3, 'Boeing 737', 5),
       (4, 'Embraer E175', 6),
       (5, 'Cessna 172',8),
       (6, 'Boeing 787', 7),
       (7, 'Airbus A319', 9),
       (8, 'Global 7500', 12),
       (9, 'Embraer E190',15 ),
       (10, 'Cessna Citation X', 18),
       (11, 'Airbus A321', 21),
       (12, 'Boeing 767', 24),
       (13, 'Boeing 757', 27),
       (14, 'Embraer E145', 30),
       (15, 'Bombardier 650', 33),
       (16, 'Cessna CJ3', 36),
       (17, 'Gulfstream G650', 39),
       (18, 'Boeing 737 MAX', 42),
       (19, 'Airbus A330', 45),
       (20,'Boeing 777X' , 48);





-----------------------------------------------------------------------------------------------------
---- POINT 2



-- OWNER table
CREATE TABLE OWNER (
    owner_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    contact_info VARCHAR(50) NOT NULL
);


-- INSERTING VALUES
INSERT INTO OWNER (owner_id, name, address, contact_info)
VALUES
(1001, 'John Doe', '123 Main St, Anytown USA', '555-1234'),
(1002, 'Jane Smith', '456 Elm St, Anytown USA', '555-5678'),
(1003, 'Bob Johnson', '789 Oak St, Anytown USA', '555-9012'),
(1004, 'Mary Wilson', '234 Maple St, Anytown USA', '555-3456'),
(1005, 'Tom Jones', '567 Pine St, Anytown USA', '555-7890'),
(1006, 'Sara Lee', '890 Cedar St, Anytown USA', '555-1234'),
(1007, 'James Brown', '123 Elm St, Anytown USA', '555-5678'),
(1008, 'Emily Davis', '456 Oak St, Anytown USA', '555-9012'),
(1009, 'William Clark', '789 Maple St, Anytown USA', '555-3456'),
(1010, 'Olivia Taylor', '234 Pine St, Anytown USA', '555-7890'),
(1011, 'Charles White', '567 Cedar St, Anytown USA', '555-1234'),
(1012, 'Sophia Harris', '890 Elm St, Anytown USA', '555-5678'),
(1013, 'Daniel Martin', '123 Oak St, Anytown USA', '555-9012'),
(1014, 'Isabella Thompson', '456 Maple St, Anytown USA', '555-3456'),
(1015, 'Matthew Davis', '789 Pine St, Anytown USA', '555-7890'),
(1016, 'Ava Hernandez', '234 Cedar St, Anytown USA', '555-1234'),
(1017, 'Christopher Martinez', '567 Elm St, Anytown USA', '555-5678'),
(1018, 'Mia Lopez', '890 Oak St, Anytown USA', '555-9012'),
(1019, 'David Gonzalez', '123 Maple St, Anytown USA', '555-3456'),
(1020, 'Emma Wilson', '456 Pine St, Anytown USA', '555-7890');



-- OWNS table
CREATE TABLE OWNS (
    serial_number INT NOT NULL,
    owner_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    PRIMARY KEY (serial_number, owner_id),
    FOREIGN KEY (serial_number) REFERENCES AIRPLANE_(reg_no),
    FOREIGN KEY (owner_id) REFERENCES OWNER(owner_id)
);

-- INSERTING VALUES
INSERT INTO OWNS (serial_number, owner_id, purchase_date)
VALUES
(1, 1001, CONVERT (date, '17-DEC-1980')),
(2, 1001, CONVERT (date, '12-OCT-1990')),
(3, 1002, CONVERT (date, '03-JAN-1992')),
(4, 1002, CONVERT (date, '08-MAR-2023')),
(5, 1003, CONVERT (date, '12-JUL-2008')),
(6, 1003, CONVERT (date, '13-SEP-1989')),
(7, 1004, CONVERT (date, '14-MAR-2023')),
(8, 1004, CONVERT (date, '29-MAR-1991')),
(9, 1005, CONVERT (date, '17-DEC-2008')),
(10, 1005, CONVERT (date, '17-NOV-2021')),
(11, 1006, CONVERT (date, '17-OCT-2021')),
(12, 1006, CONVERT (date, '17-SEP-1995')),
(13, 1007, CONVERT (date, '25-JUN-1999')),
(14, 1007, CONVERT (date, '01-APR-2005')),
(15, 1008, CONVERT (date, '01-MAR-2023')),
(16, 1008, CONVERT (date, '09-AUG-2022')),
(17, 1009, CONVERT (date, '07-NOV-1995')),
(18, 1009, CONVERT (date, '05-OCT-1998')),
(19, 1010, CONVERT (date, '02-DEC-2004')),
(20, 1010, CONVERT (date, '14-AUG-2001'));


CREATE TABLE EMPLOYEE_ (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    contact_info VARCHAR(50) NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL,
    Shift__ VARCHAR(20) NOT NULL

);

-- INSERTING VALUES
INSERT INTO EMPLOYEE_ (employee_id, name, position, contact_info,Salary,Shift__)
VALUES
(1001, 'John Smith', 'Airport Manager', '555-1234',50000,'Day'),
(1002, 'Jane Doe', 'Chief Pilot', '555-5678',50000,'Day'),
(1003, 'Bob Johnson', 'Director of Maintenance', '555-9012',25000,'Day'),
(1004, 'Samantha Lee', 'Line Service Technician', '555-3456',10000,'Day'),
(1005, 'Tom Thompson', 'Charter Sales Representative', '555-7890',20000,'Night'),
(1006, 'Maggie Chen', 'Ground Operations Coordinator', '555-2345',30000,'Day'),
(1007, 'Bill Davis', 'Client Services Manager', '555-6789',40000,'Night'),
(1008, 'Emily Kim', 'Flight Instructor', '555-0123',50000,'Night'),
(1009, 'Mike Wilson', 'FBO Manager', '555-4567',55000,'Day'),
(1010, 'Grace Lee', 'Aircraft Detailer', '555-8901',60000,'Day'),
(1011, 'Alex Rodriguez', 'Air Traffic Controller', '555-2345',40000,'Night'),
(1012, 'Emma Martinez', 'Ramp Agent', '555-6789',70000,'Day'),
(1013, 'David Nguyen', 'Private Jet Broker', '555-0123',80000,'Day'),
(1014, 'Olivia Davis', 'Aviation Sales Manager', '555-4567',20000,'Day'),
(1015, 'Ryan Patel', 'Flight Planner', '555-8901',10000,'Day'),
(1016, 'Sophia Kim', 'Aircraft Dispatcher', '555-2345',12000,'Night'),
(1017, 'Jacob Chen', 'Maintenance Controller', '555-6789',16000,'Day'),
(1018, 'Ava Wilson', 'Private Jet Concierge', '555-0123',18000,'Day'),
(1019, 'Daniel Lee', 'Aviation Safety Specialist', '555-4567',40000,'Night'),
(1020, 'Natalie Brown', 'FBO Customer Service Representative', '555-8901',50000,'Night');





CREATE TABLE SERVICE_ (
    reg_id INT NOT NULL,
    emp_id int not null,
	date_of_maintenance DATE NOT NULL,
    hours_spent INT NOT NULL,
    work_code VARCHAR(50) NOT NULL,
	foreign key (emp_id) references EMPLOYEE_(employee_id), 
	foreign key(reg_id) references airplane_(reg_no) 
);



-- INSERT VALUES
INSERT INTO SERVICE_(reg_id, date_of_maintenance, hours_spent, work_code,emp_id)
VALUES 
(1, '2003-10-20', 7, 'W001',1001),
(2, '2005-06-02', 4, 'W002',1001),
(3, '2007-09-09', 5, 'W003',1002),
(4, '2010-01-11', 0, 'W004',1003),
(5, '2011-12-24', 6, 'W005',1004),
(6, '2013-03-30', 3, 'W006',1009),
(7, '2015-08-08', 8, 'W007',1002),
(8, '2016-11-18', 4, 'W008',1009),
(9, '2018-01-01', 0, 'W009',1010),
(10, '2019-05-02', 2, 'W010',1011),
(11, '2006-12-14', 7, 'W011',1020),
(12, '2009-02-22', 4, 'W012',1009),
(13, '2012-06-09', 6, 'W013',1001),
(14, '2014-10-01', 3, 'W014',1002),
(15, '2016-12-25', 5, 'W015',1009),
(16, '2018-04-30', 2, 'W016',1007),
(17, '2019-09-12', 0, 'W017',1008),
(18, '2005-08-01', 4, 'W018',1003),
(19, '2008-01-15', 5, 'W019',1002),
(20, '2011-07-22', 3, 'W020',1008);

update SERVICE_ set date_of_maintenance = '2023-03-28' where reg_id = 2
update SERVICE_ set date_of_maintenance = '2023-03-27' where reg_id = 5
update SERVICE_ set date_of_maintenance = '2023-03-26' where reg_id = 8
update SERVICE_ set date_of_maintenance = '2023-03-28' where reg_id = 16



-----------------------------------------------------------------------------------------------------
--Point 3

Create table Person(
SSN VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(10) not null,
address1 varchar(20) not null,
PHONE VARCHAR(10)
);

-- INSERTING VALUES
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('123-45', 'John', '123 Main St', '555-1234');
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('234-56', 'Jane', '456 Oak Ave', '555-2345');
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('345-67', 'Bob', '789 Elm St', '555-3456');
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('456-78', 'Alice', '321 Maple Dr', '555-4567');
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('567-89', 'Sam', '654 Pine Ln', '555-5678');
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('678-90', 'Kate', '987 Cedar Rd', '555-6789'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('789-01', 'Mike', '432 Birch Blvd', '555-7890'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('890-12', 'Sara', '765 Oak St', '555-8901'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('901-23', 'Tom', '234 Cedar Ave', '555-9012'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('012-34', 'Emily', '567 Elm Dr', '555-0123'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('123-46', 'Mark', '987 Maple Ln', '555-1230'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('234-54', 'Lisa', '654 Oak Ave', '555-2341'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('345-68', 'Eric', '321 Pine St', '555-3452'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('456-75', 'Julia', '789 Birch Rd', '555-4563'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('567-98', 'Tim', '432 Cedar Blvd', '555-5674'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('678-09', 'Lena', '765 Oak Dr', '555-6785'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('789-10', 'Max', '234 Maple Ln', '555-7896'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('890-21', 'Hannah', '567 Pine Ave', '555-8907'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('901-28', 'Nick', '987 Cedar St', '555-9018'); 
INSERT INTO Person (SSN, NAME, address1, PHONE) VALUES ('012-43', 'Amy', '654 Elm Dr', '555-0129');

_

CREATE TABLE Pilot_ (
    Lic_num VARCHAR(10) PRIMARY KEY,
    Restr VARCHAR(20) NOT NULL,
    SSN_P VARCHAR(10) NOT NULL,
	authorized varchar(15) NOT NULL,
	plane varchar(20) not null,
    FOREIGN KEY (SSN_P) REFERENCES Person(Ssn),
	FOREIGN KEY (plane) REFERENCES plane_type(model_no)
);
-- INSERTING VALUES
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L001', 'None', '123-45','authorized','BOEING 720');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L019', 'Glasses', '234-56','authorized','Airbus A380');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L018', 'Contacts', '345-67','authorized','Boeing 737');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L002', 'None', '456-78','unauthorized','Embraer E175');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L017', 'None', '567-89','authorized','Cessna 172');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L003', 'Glasses', '678-90','unauthorized','Boeing 787');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L016', 'Contacts', '789-01','authorized','Airbus A319');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L015', 'None', '890-12','unauthorized','Airbus A319');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L021', 'None', '901-23','authorized','Embraer E190');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L004', 'Glasses', '012-34','authorized','Cessna Citation X');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L014', 'Contacts', '123-45','unauthorized','Cessna Citation X');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L005', 'None', '234-56','authorized','Airbus A321');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L006', 'None', '345-67','authorized','Boeing 757');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L013', 'Contacts', '456-78','authorized','Embraer E145');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L007', 'Glasses', '567-89','authorized','Airbus A321');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L012', 'None', '678-90','authorized','Cessna CJ3');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L008', 'None', '789-01','authorized','Airbus A321');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L009', 'Contacts', '890-12','unauthorized','Airbus A321');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L011', 'Glasses', '901-23','unauthorized','Boeing 757');
INSERT INTO Pilot_ (Lic_num, Restr, SSN_P,authorized,plane) VALUES ('L010', 'None', '012-34','unauthorized','Boeing 757');






CREATE TABLE Corporation (
    Name VARCHAR(20) PRIMARY KEY,
	EMP_id INT NOT NULL,
    Address2 VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
	Owned varchar(20) NOT NULL,
	FOREIGN KEY (Owned) REFERENCES plane_type(model_no),
	FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE_(employee_id)
);

SELECT *FROM Corporation 
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('ABC Corporation', '123 Main St, Suite 100', '555-1234','BOEING 720',1001);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('XYZ Company', '456 Elm St, Suite 200', '555-5678','Airbus A380',1002);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('123 Industries', '789 Oak St, Suite 300', '555-9012','Boeing 737',1003);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Acme Corp', '101 Maple Ave, Suite 400', '555-3456','Boeing 737',1004);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Global Enterprises', '234 Pine St, Suite 500', '555-7890','Cessna 172',1005);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Big Corporation', '567 Birch St, Suite 600', '555-1234','Boeing 787',1006);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Small Business Inc.', '890 Cedar St, Suite 700', '555-5678','Airbus A319',1007);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Tech Company', '1234 Walnut St, Suite 800', '555-9012','Global 7500',1008);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('International Corp', '5678 Cedar St, Suite 900', '555-3456','Embraer E190',1009);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Innovative Solutions', '9012 Pine St, Suite 1000', '555-7890','Cessna Citation X',1010);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('New Ventures Inc.', '3456 Maple Ave, Suite 1100', '555-1234','Airbus A321',1011);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Global Innovations', '7890 Elm St, Suite 1200', '555-5678','Boeing 767',1012);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Enterprise Corp', '123 Pine St, Suite 1300', '555-9012','Boeing 757',1013);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Next Generation', '456 Oak St, Suite 1400', '555-3456','Embraer E145',1014);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Technology Inc.', '789 Walnut St, Suite 1500', '555-7890','Bombardier 650',1015);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Advanced Solutions', '1234 Birch St, Suite 1600', '555-1234','Cessna CJ3',1016);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Digital Enterprises', '5678 Cedar St, Suite 1700', '555-5678','Gulfstream G650',1017);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Dynamic Corp', '9012 Pine St, Suite 1800', '555-9012','Boeing 737 MAX',1018);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Future Solutions', '3456 Maple Ave, Suite 1900', '555-3456','Airbus A330',1019);
	INSERT INTO Corporation (Name, Address2, Phone,Owned,EMP_id ) VALUES  ('Innovative Technologies', '7890 Elm St, Suite 2000', '555-7890','Boeing 777X',1020);

UPDATE Corporation SET Address2 = '234 Maple St, Anytown USA' WHERE NAME = 'Acme Corp'
UPDATE Corporation SET Address2 = '789 Maple St, Anytown USA' WHERE NAME = 'Technology Inc.'
UPDATE Corporation SET Address2 = '890 Elm St, Anytown USA' WHERE NAME = 'Next Generation'

-----------------------------------------------------------------------------------------------
---- POINT 4


-- TYPE table
CREATE TABLE TYPE (
    type_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO TYPE (type_id, name)
VALUES 
(1, 'Boeing 747'),
(2, 'Airbus A380'),
(3, 'Boeing 737'),
(4, 'Airbus A320'),
(5, 'Boeing 777'),
(6, 'Embraer E190'),
(7, 'Bombardier CRJ700'),
(8, 'Boeing 767'),
(9, 'Airbus A350'),
(10, 'Cessna 172'),
(11, 'Gulfstream G550'),
(12, 'Boeing 787'),
(13, 'Piper PA-28'),
(14, 'Cirrus SR22'),
(15, 'Dassault Falcon 7X'),
(16, 'Beechcraft King Air 350'),
(17, 'Boeing 737 MAX'),
(18, 'Airbus A319'),
(19, 'Cessna Citation X'),
(20, 'Embraer Phenom 100');


-- FLIES table
CREATE TABLE FLIES (
    pilot_id varchar(10) NOT NULL,
    type_id INT NOT NULL,
    PRIMARY KEY (pilot_id, type_id),
    FOREIGN KEY (pilot_id) REFERENCES PILOT_(Lic_num),
    FOREIGN KEY (type_id) REFERENCES TYPE(type_id)
);
-- INSERTING VALUES
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L001', 1);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L002', 3);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L003', 2);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L004', 4);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L005', 1);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L006', 2);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L007', 3);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L008', 4);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L009', 1);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L010', 4);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L011', 3);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L012', 4);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L013', 1);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L014', 2);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L015', 3);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L016', 4);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L017', 1);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L018', 2);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L019', 3);
INSERT INTO FLIES (pilot_id, type_id) VALUES ('L001', 4);

-- WORKS_ON table

CREATE TABLE WORKS_ON (
    employee_id INT NOT NULL,
    type_id INT NOT NULL,
    PRIMARY KEY (employee_id, type_id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE_(employee_id),
    FOREIGN KEY (type_id) REFERENCES TYPE(type_id)
);
-- INSERTING VALUES
INSERT INTO WORKS_ON (employee_id, type_id)
VALUES
(1001, 1),
(1001, 2),
(1002, 3),
(1002, 4),
(1003, 1),
(1003, 3),
(1004, 2),
(1004, 4),
(1005, 1),
(1005, 4),
(1006, 2),
(1006, 3),
(1007, 1),
(1007, 4),
(1008, 2),
(1008, 3),
(1009, 1),
(1009, 2),
(1010, 3),
(1010, 4);



-----------------------------------------------------------------------------------------------------

--16.
-- Write a SQL query to find the names of employees who have worked on planes owned 
--by a particular corporation, sorted by the total number of maintenance hours worked.
--MAPPING OF THREE TABLES

select EMPLOYEE_.name,SERVICE_.hours_spent
FROM EMPLOYEE_
JOIN Corporation ON EMPLOYEE_.employee_id = Corporation.EMP_id 
 JOIN  SERVICE_ ON   EMPLOYEE_.employee_id = SERVICE_.emp_id
ORDER BY SERVICE_.hours_spent



-----------------------------------------------------------------------------------------------------