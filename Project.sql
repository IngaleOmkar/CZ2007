/* Creating the database */
CREATE DATABASE Project;

USE Project;

CREATE TABLE Customer(
    custID int NOT NULL identity(1,1),
    emailAddress VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    phoneNumber int NOT NULL,
    userAddress VARCHAR(200) NOT NULL,
    userPassword VARCHAR(50) NOT NULL,
    PRIMARY KEY (custID),
    UNIQUE (emailAddress, username)
);

CREATE TABLE CreditCard(
    cardNumber int NOT NULL,
    custID int NOT NULL,
    expiryDate DATE NOT NULL,
    PRIMARY KEY (cardNumber),
    FOREIGN KEY(custID) REFERENCES Customer(custID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE OrderTable(
    orderID int NOT NULL identity(1,1),
    custID int NOT NULL,
    orderDate DATE NOT NULL DEFAULT GETDATE(),
    orderStatus SMALLINT NOT NULL DEFAULT 0, -- 0 - processing, 1 - completed, 2 - canceled 
    PRIMARY KEY (orderID),
    FOREIGN KEY(custID) REFERENCES Customer(custID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(orderStatus >= 0 AND orderStatus < 3) -- itemStatus must be within 0 and 2
);

CREATE TABLE Invoice(
    invoiceNum int NOT NULL identity(1,1),
    orderID int NOT NULL,
    invoiceStatus SMALLINT NOT NULL DEFAULT 0, -- 0 -not paid, 1 - partially paid, 2 - fully paid
    invoiceDate DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY(invoiceNum),
    FOREIGN KEY(orderID) REFERENCES OrderTable(orderID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(invoiceStatus >= 0 AND invoiceStatus < 3) -- invoiceStatus must be within 0 and 2
);

CREATE TABLE Payment(
    paymentID int NOT NULL identity(1,1),
    invoiceNumber int NOT NULL,
    cardNumber int NOT NULL,
    amount REAL NOT NULL DEFAULT 0,
    paymentDate DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY(paymentID),
    FOREIGN KEY(invoiceNumber) REFERENCES Invoice(invoiceNum),
    FOREIGN KEY(cardNumber) REFERENCES CreditCard(cardNumber)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(amount >= 0)
);

CREATE TABLE Shipment(
    shipmentID int NOT NULL identity(1,1),
    shipmentDate DATE NOT NULL DEFAULT GETDATE(),
    trackingNum int NOT NULL,
    PRIMARY KEY(shipmentID),
);

CREATE TABLE Shop(
    shopID int NOT NULL identity(1,1),
    sName VARCHAR(20) NOT NULL,
    PRIMARY KEY(shopID)
);

CREATE TABLE ProductType(
    ptDescription VARCHAR(50) NOT NULL,
    productTypeID int NOT NULL,
    parentID int DEFAULT NULL, -- NULL- no parent
    PRIMARY KEY(productTypeID),
    FOREIGN KEY (parentID) REFERENCES ProductType(productTypeID),
    CHECK(productTypeID != parentID) -- productType cannot be its own parent
);

CREATE TABLE Product(
    productID int NOT NULL identity(1,1),
    shopID int NOT NULL,
    pName VARCHAR(30) NOT NULL,
    color VARCHAR(20) NOT NULL,
    price REAL NOT NULL DEFAULT 0,
    pDescription VARCHAR(100) DEFAULT NULL,
    productTypeID int NOT NULL,
    size VARCHAR(10) NOT NULL DEFAULT NULL,
    PRIMARY KEY(productID),
    FOREIGN KEY (shopID) REFERENCES Shop(shopID),
    FOREIGN KEY (productTypeID) REFERENCES ProductType(productTypeID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(price >= 0)
);

CREATE TABLE Photo(
    photoID int NOT NULL identity(1,1),
    content IMAGE NOT NULL,
    productID int NOT NULL,
    PRIMARY KEY(photoID),
    FOREIGN KEY(productID) REFERENCES Product(productID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE RestrictedTo(
    shopID int NOT NULL,
    productTypeID int NOT NULL,
    PRIMARY KEY(shopID, productTypeID),
    FOREIGN KEY(shopId) REFERENCES Shop(shopId),
    FOREIGN KEY(productTypeID) REFERENCES ProductType(productTypeID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE OrderItem(
    orderID int NOT NULL,
    sequenceNum int,
    shipmentId int,
    productID int NOT NULL,
    quantity int DEFAULT 1,
    unitPrice REAL NOT NULL DEFAULT 0,
    itemStatus SMALLINT DEFAULT 0, -- 0 - processing, 1 - Shipped, 2 - out of stock
    PRIMARY KEY(orderID, sequenceNum),
    FOREIGN KEY(orderID) REFERENCES OrderTable(orderID),
    FOREIGN KEY(shipmentId) REFERENCES Shipment(shipmentID),
    FOREIGN KEY(productID) REFERENCES Product(productID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(quantity > 0), -- must at least have 1 qty
    CHECK(unitPrice > 0), -- unit price cannot be below 0
    CHECK(itemStatus >= 0 AND itemStatus < 3) -- itemStatus must be within 0 and 2
);
GO;

CREATE TRIGGER TRG
ON OrderItem
INSTEAD OF INSERT

AS

DECLARE @sid INT
DECLARE @iid INT

DECLARE @shipid INT
DECLARE @pid INT
DECLARE @qty INT
DECLARE @up REAL
DECLARE @istatus SMALLINT

SELECT @iid=orderID FROM INSERTED
SELECT @sid=sequenceNum FROM INSERTED
SELECT @shipid=shipmentId FROM INSERTED
SELECT @pid=productID FROM INSERTED
SELECT @qty=quantity FROM INSERTED
SELECT @up=unitPrice FROM INSERTED
SELECT @istatus=itemStatus FROM INSERTED


--check if inserted AreaID exists in table -for setting SurfaceID
-- IF NOT EXISTS (SELECT * FROM OrderItem WHERE orderID=@iid)
-- SET @sid=1
-- ELSE
-- SET @sid=(  SELECT MAX(O.sequenceNum)+1 
--             FROM OrderItem O
--             WHERE O.orderID=@Iid
--           )

-- INSERT INTO OrderItem (orderID, sequenceNum, shipmentId, productID, quantity, unitPrice, itemStatus)
--             VALUES  (@iid,@sid,@shipid,@pid,@qty,@up,@istatus)

-- GO;

-- Set Sequence Num & Check When an invoice is issued(paid partially or fully), no more order item can be added to the order

-- Check if order is paid, item cannot be added anymore
IF((SELECT SUM(i.invoiceStatus) 
FROM OrderTable o, OrderItem oi, Invoice i
WHERE (
    i.orderID = @iid
    AND oi.orderID = @iid
    AND o.orderID = @iid
)) <> 0) 
ROLLBACK TRANSACTION


IF (NOT EXISTS (SELECT * FROM OrderItem WHERE orderID=@iid))
    SET @sid=1
ELSE

SET @sid=(  SELECT MAX(O.sequenceNum)+1 
            FROM OrderItem O
            WHERE O.orderID=@Iid
        )

-- If there is already productId inside the orderTable, we update the quantity
IF (NOT EXISTS (SELECT * FROM OrderItem WHERE (orderID=@iid) AND (productID=@pid)))
    INSERT INTO OrderItem (orderID, sequenceNum, shipmentId, productID, quantity, unitPrice, itemStatus)
                VALUES  (@iid,@sid,@shipid,@pid,@qty,@up,@istatus)
ELSE
    UPDATE OrderItem
    SET quantity = quantity + @qty
    WHERE orderID = @iid AND productID = @pid


GO;


