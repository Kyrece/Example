CREATE DATABASE Danlenciaga;

USE Danlenciaga; 

CREATE TABLE Clothes_Listing (
  CID int NOT NULL,
  Male_Female varchar(255),
  Name varchar(255),
  Available_Sizes varchar(255),
  List_Cost float,
  Stock int,
  PRIMARY KEY(CID)
);'IN'

INSERT INTO Clothes_Listing VALUES (1, 'MALE', 'Dan T-shirt', 'S,M,L,XL,XXL', 30.99, 97); 
INSERT INTO Clothes_Listing VALUES (2, 'MALE', 'Dan Hoodie', 'S,M,L,XL,XXL', 999.99, 40);
INSERT INTO Clothes_Listing VALUES (3, 'FEMALE', 'Dan Leggings ', 'S,M,L,XL,XXL', 449.99, 10); 
SELECT * FROM Clothes_Listing; 

CREATE TABLE Orders (
  SID int NOT NULL, 
  Clothing_Purchased int NOT NULL, 
  Order_Date varchar(255),
  Order_total float, 
  Clothing_Size varchar(255), 
  Quantity int, 
  Shipping_Date varchar(255),
  PRIMARY KEY(SID),
  FOREIGN KEY(Clothing_Purchased) REFERENCES Clothes_Listing(CID)
); 

INSERT INTO Orders VALUES (123456789, 2, '03-04-2024', 2119.97, 'XL', 2, 'In Progress'); 
INSERT INTO Orders VALUES (987654321, 1, '02-14-2024', 32.84, 'M', 1, '02-29-2024'); 
INSERT INTO Orders VALUES (111111111, 3, '07-02-2023', 1430.96, 'M', 3, '07-04-2023');
SELECT * FROM Orders; 

CREATE TABLE Payment ( 
  Card_Number varchar(255), 
  Expiration_Month int,
  Expiration_Year int,
  Security_Code int, 
  Billing_Address varchar(255),
  SID int NOT NULL,
  FOREIGN KEY (SID) REFERENCES Orders(SID)
);

INSERT INTO Payment VALUES ('111-222-3333', 04 , 28, 999, '123 Dan Street, United States', 123456789); 
INSERT INTO Payment VALUES ('444-555-6666', 01 , 01, 101, '456 Ishouldveincludedaregioncolumn, Danchigan', 987654321); 
INSERT INTO Payment VALUES ('777-888-9999', 12 , 25, 353, '789 Dan Boulevard, Danifornia', 111111111); 
SELECT * FROM Payment; 

CREATE TABLE Shipping_Customer (
  FirstName varchar(255),
  LastName varchar(255),
  Email varchar(255), 
  PhoneNumber varchar(255), 
  Address varchar(255), 
  Country_Region varchar(255), 
  Zipcode varchar(255), 
  City varchar(255), 
  State varchar(255), 
  SID int NOT NULL, 
  FOREIGN KEY (SID) REFERENCES Orders(SID)
);

INSERT INTO Shipping_Customer VALUES ('Kyrece', 'Smith', 'yodaddeh@gmail.com', '101-101-1010', '12345 Plus Ultra', 'Jadan', '48188', 'Dankyo', 'Dankyo', 123456789); 
INSERT INTO Shipping_Customer VALUES ('Lonely', 'Valentine', 'plsloveme@gmail.com', '353-844-9821', '456 Ishouldveincludedaregioncolumn', 'Danited States', '48187', 'Imstrugglingtocomeupwithstuff', 'Danchigan', 987654321); 
INSERT INTO Shipping_Customer VALUES ('Dan', 'Stan', 'ilovedan@gmail.com', '999-999-9999', '789 Dan Boulevard', 'Danited States', '54687', 'Dan Angeles', 'Danifornia', 111111111); 
SELECT * FROM Shipping_Customer; 