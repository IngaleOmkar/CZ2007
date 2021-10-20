/* Creating the database */
CREATE DATABASE Project;
GO

USE Project;
GO

CREATE TABLE Customer(
    Cust_ID int NOT NULL,
    email_address VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    full_name VARCHAR(100),
    phone_number int,
    user_address VARCHAR(200),
    user_password VARCHAR(50),
    PRIMARY KEY (Cust_ID),
    UNIQUE (email_address, username)
);

CREATE TABLE CreditCard(
    CardNumber int NOT NULL,
    Cust_ID int NOT NULL,
    ExpiryDate DATE NOT NULL,
    PRIMARY KEY (CardNumber),
    FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
);

CREATE TABLE Order_Table(
    orderID int NOT NULL,
    Cust_ID int NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    PRIMARY KEY (orderID),
    FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
);

CREATE TABLE Invoice(
    invoiceNum int NOT NULL,
    orderID int NOT NULL,
    invoice_status VARCHAR(20) NOT NULL,
    invoice_date DATE NOT NULL,
    PRIMARY KEY(invoiceNum),
    FOREIGN KEY(orderID) REFERENCES Order_Table(orderID)
);

CREATE TABLE Payment(
    paymentID int NOT NULL,
    invoice_number int NOT NULL,
    CardNumber int NOT NULL,
    amount REAL NOT NULL,
    payment_date DATE NOT NULL,
    PRIMARY KEY(paymentID),
    FOREIGN KEY(invoice_number) REFERENCES Invoice(invoiceNum),
    FOREIGN KEY(CardNumber) REFERENCES CreditCard(CardNumber)
);

CREATE TABLE Shipment(
    shipmentID int NOT NULL,
    shipment_date DATE NOT NULL,
    trackingNum int NOT NULL,
    PRIMARY KEY(shipmentID)
);

CREATE TABLE Shop(
    shopID int NOT NULL,
    sName VARCHAR(20) NOT NULL,
    PRIMARY KEY(shopID)
);

CREATE TABLE ProductType(
    ptDescription VARCHAR(50) NOT NULL,
    productTypeID int NOT NULL,
    parentID int NOT NULL,
    PRIMARY KEY(productTypeID),
    FOREIGN KEY (parentID) REFERENCES ProductType(productTypeID)
);

CREATE TABLE Product(
    productID int NOT NULL,
    shopID int NOT NULL,
    productType VARCHAR(20) NOT NULL,
    pName VARCHAR(20) NOT NULL,
    color VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,
    pDescription VARCHAR(100) NOT NULL,
    productTypeID int NOT NULL,
    size int NOT NULL,
    PRIMARY KEY(productID, shopID),
    FOREIGN KEY (shopID) REFERENCES Shop(shopID),
    FOREIGN KEY (productTypeID) REFERENCES ProductType(productTypeID)
);

CREATE TABLE Photo(
    shopId int NOT NULL,
    photoID int NOT NULL,
    content VARCHAR(20) NOT NULL,
    productID int NOT NULL,
    PRIMARY KEY(photoID),
    FOREIGN KEY(productID, shopId) REFERENCES Product(productID, shopID)
);

CREATE TABLE RestrictedTo(
    shopID int NOT NULL UNIQUE,
    productTypeID int NOT NULL UNIQUE,
    PRIMARY KEY(shopID, productTypeID),
    FOREIGN KEY(shopId) REFERENCES Shop(shopId),
    FOREIGN KEY(productTypeID) REFERENCES ProductType(productTypeID)
);

CREATE TABLE OrderItem(
    orderID int NOT NULL,
    shopID int NOT NULL,
    sequenceNum int NOT NULL,
    shipmentId int NOT NULL,
    productID int NOT NULL,
    quantity int NOT NULL,
    unitPrice FLOAT NOT NULL,
    itemStatus VARCHAR(20) NOT NULL,
    PRIMARY KEY(orderID, sequenceNum),
    FOREIGN KEY(orderID) REFERENCES Order_Table(orderID),
    FOREIGN KEY(shipmentId) REFERENCES Shipment(shipmentID),
    FOREIGN KEY(productID, shopID) REFERENCES Product(productID, shopID)
);