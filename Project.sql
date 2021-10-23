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

CREATE TABLE Order_Table(
    orderID int NOT NULL identity(1,1),
    custID int NOT NULL,
    orderDate DATE NOT NULL DEFAULT GETDATE(),
    orderStatus SMALLINT NOT NULL DEFAULT 0, -- 0 - processing, 1 - completed, 2 - canceled 
    PRIMARY KEY (orderID),
    FOREIGN KEY(custID) REFERENCES Customer(custID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(orderStatus > 0 AND orderStatus < 3) -- itemStatus must be within 0 and 2
);

CREATE TABLE Invoice(
    invoiceNum int NOT NULL identity(1,1),
    orderID int NOT NULL,
    invoiceStatus SMALLINT NOT NULL DEFAULT 0, -- 0 -not paid, 1 - partially paid, 2 - fully paid
    invoiceDate DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY(invoiceNum),
    FOREIGN KEY(orderID) REFERENCES Order_Table(orderID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(invoiceStatus > 0 AND invoiceStatus < 3) -- invoiceStatus must be within 0 and 2
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
    pName VARCHAR(20) NOT NULL,
    color VARCHAR(20) NOT NULL,
    price REAL NOT NULL DEFAULT 0,
    pDescription VARCHAR(100) DEFAULT NULL,
    productTypeID int NOT NULL,
    size VARCHAR(10) NOT NULL DEFAULT NULL,
    PRIMARY KEY(productID, shopID),
    FOREIGN KEY (shopID) REFERENCES Shop(shopID),
    FOREIGN KEY (productTypeID) REFERENCES ProductType(productTypeID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(price >= 0)
);

CREATE TABLE Photo(
    shopId int NOT NULL,
    photoID int NOT NULL identity(1,1),
    content IMAGE NOT NULL,
    productID int NOT NULL,
    PRIMARY KEY(photoID),
    FOREIGN KEY(productID, shopId) REFERENCES Product(productID, shopID)
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
    shopID int NOT NULL,
    sequenceNum int,
    shipmentId int,
    productID int NOT NULL,
    quantity int DEFAULT 1,
    unitPrice REAL NOT NULL DEFAULT 0,
    itemStatus SMALLINT DEFAULT 0, -- 0 - processing, 1 - Shipped, 2 - out of stock
    PRIMARY KEY(orderID, sequenceNum),
    FOREIGN KEY(orderID) REFERENCES Order_Table(orderID),
    FOREIGN KEY(shipmentId) REFERENCES Shipment(shipmentID),
    FOREIGN KEY(productID, shopID) REFERENCES Product(productID, shopID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(quantity > 0), -- must at least have 1 qty
    CHECK(unitPrice > 0), -- unit price cannot be below 0
    CHECK(itemStatus > 0 AND itemStatus < 3) -- itemStatus must be within 0 and 2
);
