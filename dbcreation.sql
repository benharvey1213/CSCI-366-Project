-- Users Table
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (UserID SERIAL NOT NULL PRIMARY KEY, Username varchar(255) NOT NULL, Password varchar(255) NOT NULL);

INSERT INTO Users (username, password) VALUES ('ben.harvey', 'hackme1');
INSERT INTO Users (username, password) VALUES ('steven.glasford', 'hackme2');
INSERT INTO Users (username, password) VALUES ('luke.tollefson', 'hackme3');
INSERT INTO Users (username, password) VALUES ('kyle.pietrowski', 'hackme4');
INSERT INTO Users (username, password) VALUES ('alex.wilcox', 'hackme5');


-- Messages Table
DROP TABLE IF EXISTS Messages;
CREATE TABLE Messages (MessageID SERIAL NOT NULL PRIMARY KEY, UserIDFrom int NOT NULL, UserIDTo int NOT NULL, Time timestamp NOT NULL, ProductID int NOT NULL, MessageBody varchar(1000) NOT NULL);

INSERT INTO Messages (useridfrom, useridto, time, productid, messagebody) VALUES (2, 3, '2020-03-31 10:21:15', 2, 'Hello, I''m inquiring about this item.');
INSERT INTO Messages (useridfrom, useridto, time, productid, messagebody) VALUES (1, 4, '2020-03-31 10:21:15', 1, 'Hello, I''m inquiring about this item.');
INSERT INTO Messages (useridfrom, useridto, time, productid, messagebody) VALUES (3, 1, '2020-03-31 10:21:15', 3, 'Hello, I''m inquiring about this item.');


-- Views Table
DROP TABLE IF EXISTS Views;
CREATE TABLE Views (ViewID SERIAL NOT NULL PRIMARY KEY, UserID int NOT NULL, ProductID int NOT NULL, Liked boolean NOT NULL);

INSERT INTO Views (UserID, ProductID, Liked) VALUES (1, 3, FALSE);
INSERT INTO Views (UserID, ProductID, Liked) VALUES (1, 2, TRUE);
INSERT INTO Views (UserID, ProductID, Liked) VALUES (3, 1, FALSE);
INSERT INTO Views (UserID, ProductID, Liked) VALUES (2, 2, TRUE);
INSERT INTO Views (UserID, ProductID, Liked) VALUES (2, 1, TRUE);
INSERT INTO Views (UserID, ProductID, Liked) VALUES (3, 2, FALSE);


-- Products Table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (ProductID SERIAL NOT NULL PRIMARY KEY, UserID int NOT NULL, ProductName varchar(255) NOT NULL, Price money NOT NULL, Category varchar(255) NOT NULL, Location varchar(500) NOT NULL, Condition varchar(500) NOT NULL, Pictures varchar(500));

INSERT INTO Products (UserID, ProductName, Price, Category, Location, Condition, Pictures) VALUES (1, 'Samsung Galaxy S8', 200.00, 'Technology', 'Fargo, ND', 'used', 'url-to-pictures');
INSERT INTO Products (UserID, ProductName, Price, Category, Location, Condition, Pictures) VALUES (2, 'Lenovo Legion Y530 Laptop', 750.00, 'Technology', 'Fargo, ND', 'slightly used', 'url-to-pictures');
INSERT INTO Products (UserID, ProductName, Price, Category, Location, Condition, Pictures) VALUES (3, 'Fender Stratocaster Electric Guitar', 100.00, 'Technology', 'Fargo, ND', 'used', 'url-to-pictures');
INSERT INTO Products (UserID, ProductName, Price, Category, Location, Condition, Pictures) VALUES (4, 'Rubik''s Cube', 10.00, 'Toys and Games', 'Fargo, ND', 'like new', 'url-to-pictures');
INSERT INTO Products (UserID, ProductName, Price, Category, Location, Condition, Pictures) VALUES (1, 'Coffee Mug', 200.00, 'Home and Garden', 'Fargo, ND', 'heavily used', 'url-to-pictures');
INSERT INTO Products (UserID, ProductName, Price, Category, Location, Condition, Pictures) VALUES (2, 'Ray Bans', 1200.00, 'Clothing', 'Fargo, ND', 'new', 'url-to-pictures');