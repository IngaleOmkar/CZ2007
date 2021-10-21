/* Creating the database */
CREATE DATABASE Project;
GO

USE Project;
GO

CREATE TABLE Customer(
    Cust_ID int NOT NULL IDENTITY(1,1),
    email_address VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone_number int NOT NULL,
    user_address VARCHAR(200) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    PRIMARY KEY (Cust_ID),
    UNIQUE (email_address, username)
);

CREATE TABLE CreditCard(
    CardNumber int NOT NULL,
    Cust_ID int NOT NULL,
    ExpiryDate DATE NOT NULL,
    PRIMARY KEY (CardNumber),
    FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Order_Table(
    orderID int NOT NULL IDENTITY(1,1),
    Cust_ID int NOT NULL,
    order_date DATE NOT NULL,
    -- 0 - processing, 1 - completed, 2 - canceled 
    order_status SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (orderID),
    FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Invoice(
    invoiceNum int NOT NULL IDENTITY(1,1),
    orderID int NOT NULL,
    -- 0 -not paid, 1 - partially paid, 2 - fully paid
    invoice_status SMALLINT NOT NULL DEFAULT 0,
    invoice_date DATE NOT NULL,
    PRIMARY KEY(invoiceNum),
    FOREIGN KEY(orderID) REFERENCES Order_Table(orderID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Payment(
    paymentID int NOT NULL IDENTITY(1,1),
    invoice_number int NOT NULL,
    CardNumber int NOT NULL,
    amount REAL NOT NULL DEFAULT 0,
    payment_date DATE NOT NULL,
    PRIMARY KEY(paymentID),
    FOREIGN KEY(invoice_number) REFERENCES Invoice(invoiceNum),
    FOREIGN KEY(CardNumber) REFERENCES CreditCard(CardNumber)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Shipment(
    shipmentID int NOT NULL IDENTITY(1,1),
    shipment_date DATE NOT NULL,
    trackingNum int NOT NULL,
    PRIMARY KEY(shipmentID),
);

CREATE TABLE Shop(
    shopID int NOT NULL IDENTITY(1,1),
    sName VARCHAR(20) NOT NULL,
    PRIMARY KEY(shopID)
);

CREATE TABLE ProductType(
    ptDescription VARCHAR(50) NOT NULL,
    productTypeID int NOT NULL,
    -- (-1)- no parent
    parentID int DEFAULT -1,
    PRIMARY KEY(productTypeID),
    FOREIGN KEY (parentID) REFERENCES ProductType(productTypeID)
);

CREATE TABLE Product(
    productID int NOT NULL IDENTITY(1,1),
    shopID int NOT NULL,
    pName VARCHAR(20) NOT NULL,
    color VARCHAR(20) NOT NULL,
    price REAL NOT NULL DEFAULT 0,
    pDescription VARCHAR(100) DEFAULT NULL,
    productTypeID int NOT NULL,
    size int NOT NULL DEFAULT 0,
    PRIMARY KEY(productID, shopID),
    FOREIGN KEY (shopID) REFERENCES Shop(shopID),
    FOREIGN KEY (productTypeID) REFERENCES ProductType(productTypeID)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(price >= 0)
);

CREATE TABLE Photo(
    shopId int NOT NULL,
    photoID int NOT NULL IDENTITY(1,1),
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
    sequenceNum int NOT NULL IDENTITY(1,1),
    shipmentId int NOT NULL,
    productID int NOT NULL,
    quantity int DEFAULT 1,
    unitPrice REAL NOT NULL,
    -- 0 - processing, 1 - Shipped, 2 - out of stock
    itemStatus SMALLINT DEFAULT 0,
    PRIMARY KEY(orderID, sequenceNum),
    FOREIGN KEY(orderID) REFERENCES Order_Table(orderID),
    FOREIGN KEY(shipmentId) REFERENCES Shipment(shipmentID),
    FOREIGN KEY(productID, shopID) REFERENCES Product(productID, shopID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

GO  
