CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE City (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Street (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE WarehouseAddresses (
    ID INT AUTO_INCREMENT,
    CityID INT,
    StreetID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CityID) REFERENCES City(ID),
    FOREIGN KEY (StreetID) REFERENCES Street(ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    AddressID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (AddressID) REFERENCES WarehouseAddresses(ID)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    WarehouseAmount INT,
    WarehouseID INT,
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);


INSERT INTO Countries (Name)
	VALUES ('Country-1'), ('Country-2');

INSERT INTO City (Name)
	VALUES ('City-1'), ('City-2');

INSERT INTO Street (Name)
	VALUES ('Street-1'), ('Street-2');

INSERT INTO WarehouseAddresses (CityID, StreetID)
	VALUES (1, 1), (2, 2);

INSERT INTO Warehouses (Name, AddressID)
	VALUES ('Warehouse-1', 1), ('Warehouse-2', 2);

INSERT INTO ProductInventory (ProductName, WarehouseAmount, WarehouseID, CountryID)
	VALUES ('AwersomeProduct', 2, 1, 1), ('AwersomeProduct', 5, 2, 2);
