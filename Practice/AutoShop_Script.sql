--DROP DATABASE--
IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME='AutoShopDB')
BEGIN
	DROP DATABASE AutoShopDB;
END;

--CREATE DATABASE--
IF NOT EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME='AutoShopDB')
BEGIN
	CREATE DATABASE AutoShopDB;
END;

--USE DATABASE--
USE AutoShopDB;

--DROP TABLES IF EXISTS--
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Cars;

--CREATE TABLES--
--Departments--
CREATE TABLE Departments(ID INT IDENTITY(001,1),
Name VARCHAR(150) NOT NULL,
PRIMARY KEY(ID)
);

--Employees--
CREATE TABLE Employees(ID INT NOT NULL IDENTITY(1,1),
FName VARCHAR(50) NOT NULL,
LName VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(11),
ManagerID INT,
DepartmentID INT NOT NULL,
Salary INT NOT NULL,
HireDate DATE NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY(ManagerID) REFERENCES Employees(ID),
FOREIGN KEY(DepartmentID) REFERENCES Departments(ID)
);

--Customers--
CREATE TABLE Customers(ID INT NOT NULL IDENTITY(0001,1),
FName VARCHAR(50) NOT NULL,
LName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(11),
PreferredContact VARCHAR(5) NOT NULL,
PRIMARY KEY(ID)
);

--Cars--
CREATE TABLE Cars(ID INT NOT NULL IDENTITY(1,1),
CustomerID INT NOT NULL,
EmployeeID INT NOT NULL,
Model VARCHAR(50) NOT NULL,
Status VARCHAR(25) NOT NULL,
TotalCost INT NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (CustomerID) REFERENCES Customers(ID),
FOREIGN KEY (EmployeeID) REFERENCES Employees(ID)
);

--ADD CONSTRAINTS--
ALTER TABLE Customers
ADD CONSTRAINT UNQ_Email UNIQUE (Email);

ALTER TABLE Customers
ADD CONSTRAINT UND_Phone UNIQUE (PhoneNumber);

--INSERTS--
INSERT INTO Departments
(Name)
VALUES('HR'),
('Sales'),
('Tech');

INSERT INTO Employees
(FName, LName, PhoneNumber, ManagerID, DepartmentID, Salary, HireDate)
VALUES('James', 'Smith', 1234567890, NULL, 1, 1000, '2002-01-01'),
('John', 'Johnson', 2468101214, '1', 1, 400, '2005-03-23'),
('Michael', 'Williams', 1357911131, '1', 2, 600, '2009-05-12'),
('Johnathon', 'Smith', 1212121212, '2', 1, 500, '2016-07-24');

INSERT INTO Customers
(FName, LName, Email, PhoneNumber, PreferredContact)
VALUES
('William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),
('David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),
('Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL');

INSERT INTO Cars
(CustomerID, EmployeeID, Model, Status, TotalCost)
VALUES('1', '2', 'Ford F-150', 'READY', '230'),
('1', '2', 'Ford F-150', 'READY', '200'),
('2', '1', 'Ford Mustang', 'WAITING', '100'),
('3', '3', 'Toyota Prius', 'WORKING', '1254');


--SELECT--
SELECT * FROM Customers;