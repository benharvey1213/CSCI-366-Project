-- Users Table
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    UserID SERIAL NOT NULL PRIMARY KEY, 
    Username varchar(255) NOT NULL, 
    Password varchar(255) NOT NULL
);

INSERT INTO Users 
    (username, password) 
VALUES 
    ('ben.harvey', 'hackme1'),
    ('steven.glasford', 'hackme2'),
    ('luke.tollefson', 'hackme3'),
    ('kyle.pietrowski', 'hackme4'),
    ('alex.wilcox', 'hackme5');


-- Messages Table
DROP TABLE IF EXISTS Messages;
CREATE TABLE Messages (
    MessageID SERIAL NOT NULL PRIMARY KEY,
    UserIDFrom int NOT NULL,
    UserIDTo int NOT NULL,
    Time timestamp NOT NULL,
    ProductID int NOT NULL,
    MessageBody varchar(1000) NOT NULL
);

INSERT INTO Messages 
    (useridfrom, useridto, time, productid, messagebody) 
VALUES 
    (2, 3, '2020-03-31 10:21:15', 2, 'Hello, I''m inquiring about this item.'),
    (1, 4, '2020-03-31 10:21:15', 1, 'Hello, I''m inquiring about this item.'),
    (3, 1, '2020-03-31 10:21:15', 3, 'Hello, I''m inquiring about this item.');


-- Views Table
DROP TABLE IF EXISTS Views;
CREATE TABLE Views (
    ViewID SERIAL NOT NULL PRIMARY KEY,
    UserID int NOT NULL,
    ProductID int NOT NULL,
    Liked boolean NOT NULL
);

INSERT INTO Views 
    (UserID, ProductID, Liked) 
VALUES 
    (1, 3, FALSE),
    (1, 2, TRUE),
    (3, 1, FALSE),
    (2, 2, TRUE),
    (2, 1, TRUE),
    (3, 2, FALSE);


-- Products Table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID SERIAL NOT NULL PRIMARY KEY,
    UserID int NOT NULL,
    ProductName varchar(255) NOT NULL,
    Price money NOT NULL,
    Category varchar(255) NOT NULL,
    Location varchar(500) NOT NULL,
    Condition varchar(500) NOT NULL,
    Pictures varchar(500)
);

INSERT INTO Products 
    (UserID, ProductName, Price, Category, Location, Condition, Pictures) 
VALUES 
    (1, 'Samsung Galaxy S8', 200.00, 'Technology', 'Fargo, ND', 'used', 'url-to-pictures'),
    (2, 'Lenovo Legion Y530 Laptop', 750.00, 'Technology', 'Fargo, ND', 'slightly used', 'url-to-pictures'),
    (3, 'Fender Stratocaster Electric Guitar', 100.00, 'Technology', 'Fargo, ND', 'used', 'url-to-pictures'),
    (4, 'Rubik''s Cube', 10.00, 'Toys and Games', 'Fargo, ND', 'like new', 'url-to-pictures'),
    (1, 'Coffee Mug', 200.00, 'Home and Garden', 'Fargo, ND', 'heavily used', 'url-to-pictures'),
    (2, 'Ray Bans', 1200.00, 'Clothing', 'Fargo, ND', 'new', 'url-to-pictures');


-- Example Queries
\echo 'Find all products ben.harvey likes'
SELECT *
FROM Products
WHERE Products.ProductID IN (SELECT Views.ProductID
                             FROM Users JOIN Views ON(Users.UserID = Views.UserID)
                             WHERE Views.Liked = TRUE AND Users.Username = 'ben.harvey');

\echo 'Find all products steven.glasford hasn"t seen'
SELECT *
FROM Products
WHERE Products.ProductID NOT IN (SELECT Views.ProductID
                                 FROM Users JOIN Views ON(Users.UserID = Views.UserID)
                                 WHERE Users.Username = 'steven.glasford');

\echo 'Order products by increasing number of views'
SELECT p.ProductID, COUNT(v.UserID) viewCount
FROM Products p FULL JOIN Views v ON(p.ProductID = v.ProductID)
GROUP BY p.ProductID
ORDER BY viewCount;

\echo 'Find all products in Fargo, ND'
SELECT *
FROM Products
WHERE Location = 'Fargo, ND';

\echo 'Find all messages sent/received by luke.tollefson'
SELECT *
FROM Messages
WHERE Messages.useridfrom IN(SELECT UserID
                             FROM Users
                             WHERE Users.Username = 'luke.tollefson')
      OR
      Messages.useridto IN(SELECT UserID
                           FROM Users
                           WHERE Users.Username = 'luke.tollefson');

\echo 'Find all of steven.glasford"s listings'
SELECT *
FROM Products
WHERE Products.UserID IN (SELECT UserID
                          FROM Users
                          WHERE Username = 'steven.glasford');
