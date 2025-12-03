--DROP DATABASE--
IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME='LibraryDB')
BEGIN
	DROP DATABASE LibraryDB;
END;

--CREATE DATABASE--
IF NOT EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME='LibraryDB')
BEGIN
	CREATE DATABASE LibraryDB;
END;

--USE LibraryDB--
USE LibraryDB;

--CREATE TABLES--
--Authors--
CREATE TABLE Authors(ID INT IDENTITY(1,1),
Name VARCHAR(100) NOT NULL,
Country VARCHAR(20) NOT NULL,
PRIMARY KEY(ID)
);

--Books--
CREATE TABLE Books(ID INT IDENTITY(1,1),
Title VARCHAR(100),
PRIMARY KEY (ID)
);

--BookAuthors--
CREATE TABLE BookAuthors(BookID INT NOT NULL,
AuthorID INT NOT NULL,
FOREIGN KEY (BookID) REFERENCES Books(ID),
FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);

--INSERT DATA---
--Authors--
INSERT INTO Authors(Name, Country)
VALUES('James Mathew','USA'),
('Enosh Alfred', 'India'),
('Eliud Pya', 'Kenya'),
('Adamant Oking', 'Zambia'),
('Titus Titus', 'South Africa'),
('Lewis Nelson', 'USA');

--Books--
INSERT INTO Books(Title)
VALUES('Think and Grow'),
('My Love'),
('Change is Inevitable'),
('Hawk Eyed'),
('Many a Time'),
('Waiting Forever'),
('Teachers'),
('The Mountain Before You'),
('Edged'),
('Calm in the Storm');

--BookAuthors--
INSERT INTO BookAuthors(BookID, AuthorID)
VALUES(1,2),
(2,4),
(3,1),
(4,1),
(5,5),
(6,4),
(7,6),
(8,2),
(9,4),
(10,5);

--SELECT--
--View all books and their authors--
SELECT 
ba.AuthorID AS 'Author ID',
a.Name AS "Author's Name",
ba.BookID as 'Book ID',
b.Title AS 'Book Title'
FROM BookAuthors ba
INNER JOIN Authors a ON a.ID=ba.AuthorID
INNER JOIN Books b ON b.ID=ba.BookID;

--View the top 50% records in the library--
SELECT TOP(50) PERCENT 
ba.AuthorID AS 'Author ID',
a.Name AS "Author's Name",
ba.BookID as 'Book ID',
b.Title AS 'Book Title'
FROM BookAuthors ba
INNER JOIN Authors a ON a.ID=ba.AuthorID
INNER JOIN Books b ON b.ID=ba.BookID
ORDER BY 'Author ID' ASC;

--Count the total number of books in the library--
SELECT COUNT(*) AS 'Total Books in the Library' 
FROM BookAuthors;

--View the number of books for each has written--
SELECT Authors.Name AS 'Author Name',
COUNT(Name) AS 'Number of Books'
FROM BookAuthors
INNER JOIN Authors ON Authors.ID = BookAuthors.AuthorID
GROUP BY Name
ORDER BY 'Number of Books' DESC;

--CREATE A TEMPORARY TABLE TO STORE BOOK DETAILS--
--DROP TABLE--

DROP TABLE IF EXISTS #Book_Details;

CREATE TABLE #Book_Details(BookID INT,
Book_Title VARCHAR(100),
Author VARCHAR(100));

INSERT INTO #Book_Details
SELECT b.ID,
b.Title,
a.Name
From BookAuthors ba
JOIN Books b ON ba.BookID = b.ID
JOIN Authors a ON ba.AuthorID=a.ID;

SELECT * FROM #Book_Details ORDER BY BookID ASC;

