CREATE DATABASE LibraryJaradat;

CREATE TABLE Authors 
(IDAuthors int primary key identity(1,1),
NameAuthor varchar(30)
);

INSERT INTO Authors (NameAuthor )
VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('Agatha Christie'),
('J.R.R. Tolkien'),
('Mark Twain');

CREATE TABLE Users 
(IDUsers int primary key identity(1,1),
NameUsers varchar(30)
);


INSERT INTO Users (NameUsers) 
VALUES ('Alice Smith'),
 ('Bob Johnson'),
('Charlie Brown'),
('Diana Prince'),
 ('Edward Norton');


CREATE TABLE Employees
(IDEmployees int primary key identity(1,1),
NameEmployees varchar(30)
);

INSERT INTO Employees (NameEmployees) 
VALUES ('Emma Watson'),
 ('Liam Neeson'),
 ('Natalie Portman'),
 ('Robert Downey Jr.'),
 ('Scarlett Johansson');

CREATE TABLE Categories
(IDCategories int primary key identity(1,1),
NameCategories varchar(30)
);
INSERT INTO Categories (NameCategories)
VALUES ('Fantasy'),
 ('Mystery'),
 ('Adventure'),
 ('Science Fiction'),
 ('Historical Fiction');


CREATE TABLE Section (
IDSection int primary key identity(1,1),
NameSection  varchar(30)
);

INSERT INTO Section (NameSection) 
VALUES ('New Arrivals'),
('Best Sellers'),
('Children’s Books'),
('Reference'),
 ('Classic Literature');

CREATE TABLE Books (
IDBooks int primary key identity(1,1),
Title varchar(30),CopiesNumber int,
IDAuthors int,
IDUsers int,
IDSection int,
 FOREIGN KEY (IDAuthors) REFERENCES Authors(IDAuthors),
  FOREIGN KEY (IDUsers) REFERENCES Users(IDUsers),
 FOREIGN KEY (IDSection) REFERENCES Section(IDSection)
);

INSERT INTO Books (Title, CopiesNumber, IDAuthors, IDUsers, IDSection) 
VALUES ('Harry Potter and the Sorcerer', 10, 1, 1, 1),
 ('A Game of Thrones', 5, 2, 2, 2),
 ('Murder on the Orient Express', 3, 2, 3, 3),
 ('The Hobbit', 7, 4, 4, 4),
('The Adventures of Tom Sawyer', 4, 3, 5, 5);
UPDATE Books
SET IDAuthors = 3
WHERE IDBooks=5;

UPDATE Books
SET IDAuthors = 2
WHERE IDBooks=3;

 CREATE TABLE Categories_Books (
ID int primary key identity(1,1),
IDCategories int,
IDBooks int,
FOREIGN KEY (IDCategories) REFERENCES Categories(IDCategories),
FOREIGN KEY (IDBooks) REFERENCES Books(IDBooks),
);
INSERT INTO Categories_Books (IDCategories, IDBooks)
VALUES (1, 1),
 (1, 2),
(2, 3),
 (5, 5);
 
 CREATE TABLE Section_Employees (
ID int primary key identity(1,1),
IDEmployees int,
IDSection  int,
FOREIGN KEY (IDEmployees) REFERENCES Employees(IDEmployees),
FOREIGN KEY (IDSection ) REFERENCES Section(IDSection ),
);

INSERT INTO Section_Employees (IDEmployees, IDSection) 
VALUES (1, 1),
 (2, 2),
 (3, 3),
 (4, 4),
 (5, 5);
 /*one to many*/
SELECT  Books.IDBooks,Books.Title,Authors.NameAuthor,Authors.IDAuthors
FROM Books
INNER JOIN Authors ON Authors.IDAuthors=Books.IDAuthors;

SELECT  Books.IDBooks,Books.Title,Authors.NameAuthor,Authors.IDAuthors
FROM Books
left JOIN Authors ON Authors.IDAuthors=Books.IDBooks;

SELECT  Books.IDBooks,Books.Title,Authors.NameAuthor,Authors.IDAuthors
FROM Books
right JOIN Authors ON Authors.IDAuthors=Books.IDBooks;









/*many to many*/
SELECT Books.Title, Categories.NameCategories AS CategoryName
FROM Books
INNER JOIN Categories_Books ON Books.IDBooks = Categories_Books.IDBooks
INNER JOIN Categories ON Categories_Books.IDCategories = Categories.IDCategories;

SELECT Books.Title, Categories.NameCategories AS CategoryName
FROM Books
left JOIN Categories_Books ON Books.IDBooks = Categories_Books.IDBooks
left JOIN Categories ON Categories_Books.IDCategories = Categories.IDCategories;

SELECT Books.Title, Categories.NameCategories AS CategoryName
FROM Books
right JOIN Categories_Books ON Books.IDBooks = Categories_Books.IDBooks
right JOIN Categories ON Categories_Books.IDCategories = Categories.IDCategories;


SELECT Books.Title, Categories.NameCategories AS CategoryName
FROM Books
full JOIN Categories_Books ON Books.IDBooks = Categories_Books.IDBooks
full JOIN Categories ON Categories_Books.IDCategories = Categories.IDCategories;
select * from Categories_Books;






