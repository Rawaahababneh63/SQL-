create database SQL1
CREATE TABLE Books (
BookID INTEGER PRIMARY KEY ,
Title VARCHAR(50),
AuthorID INTEGER,
PublishedYear  INTEGER,
CopiesAvailable  INTEGER,
BookCategory VARCHAR(50)
);


CREATE TABLE Authors (
AuthorID INT PRIMARY KEY,
FirstName  VARCHAR(50),
LastName  VARCHAR(50),
BirthYear  INT);
insert  into Books(BookID ,Title ,AuthorID ,PublishedYear ,CopiesAvailable ,BookCategory )
values(1,'The Catcher in the Rye',1,1951,20,'Literary Fiction');


insert  into Books(BookID ,Title ,AuthorID ,PublishedYear ,CopiesAvailable ,BookCategory )
values(2,'1984',2,1984,30,'Fiction');

update Books 
set title='1984 Books'
where bookid=2;

insert  into Books(BookID ,Title ,AuthorID ,PublishedYear ,CopiesAvailable ,BookCategory )
values(3,'To Kill a Mockingbird',3,1960,10,'Drama');

insert  into Books(BookID ,Title ,AuthorID ,PublishedYear ,CopiesAvailable ,BookCategory )
values(4,'The Great Gatsby',4,1925,35,'Fiction');
insert  into Books(BookID ,Title ,AuthorID ,PublishedYear ,CopiesAvailable ,BookCategory )
values(5,'The Great Day',5,2005,35,'Fiction');


SELECT * from Books;


insert  into Authors(AuthorID,FirstName,LastName ,BirthYear )
values
(1,'Jack','Jwain',1478),
(2,'Mark','Twain',1835),
(3,'Agatha','Christie',1890),
(4,'Gabriel','García',1850),
(5,'J.K.','Rowling',1965);
SELECT * from Authors;


SELECT AVG(publishedyear) from Books as publishedyearAVG;
SELECT count(copiesavailable) from Books AS COUNTBOOKS;
SELECT min(copiesavailable) FROM Books AS LowerestNumberBooks; /*to show lowerest number of copies books*/
SELECT MAX(copiesavailable) from Books AS HighestNumberBooks;  /*to show hight number of copies books*/
TRUNCATE TABLE Books;
DROP  TABLE Authors;