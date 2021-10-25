USE Project
Go

-- Customer
INSERT INTO dbo.Customer(
    fullName,phoneNumber,username,emailAddress,userAddress,userPassword
    )   
VALUES
    ('Emily Soto', 86913536 ,'spiritedIcecream8','EmilySoto@gmail.com','767 Rios Summit Suite 255 New Seanchester, MA 79836','Ofv6L&*8tS&id'),
    ('Michael Ponce',87925784,'adoringHeron8','MichaelPonce@yahoo.com','7952 Dawson Plains Suite 895 South Darrell, KS 13800','1p(uAcPQL))'),
    ('Michael Davis',98322225,'trustingLemur8','MichaelDavis@outlook.com','847 Brenda Rapids West Tiffanyland, LA 20789','25LZKRF!BS'),
    ('Philip Rogers',97344507,'decimalDinosaur1','PhilipRogers@gmail.com','59803 Jones Street Chadtown, SD 89378','5JUS6OngZZCeEg');

-- Credit Card
INSERT INTO dbo.CreditCard(
    cardNumber,custID,expiryDate
    )   
VALUES
    (123123123,1,'2021-12-25'),
    (234234234,2,'2021-12-25'),
    (345345345,3,'2021-12-25'),
    (456456456,4,'2021-12-25');

-- This will need to change the card number as its just a temp 

INSERT INTO dbo.OrderTable(
    custID,orderDate,orderStatus
    )   
VALUES
    (1,'2021-12-25',0),
    (2,'2021-11-15',1),
    (1,'2021-11-5',2),
    (4,'2021-1-25',2);

INSERT INTO dbo.Shipment(
    shipmentDate,trackingNum
    )   
VALUES
    ('2021-12-27',10001),
    ('2021-12-28',10002),
    ('2021-12-29',10003),  
    ('2021-2-25',10004),
    ('2021-1-25',10005);
-- This will need to change the card number as its just a temp 
INSERT INTO dbo.ProductType(
    ptDescription, productTypeID, parentID
    )
VALUES
    -- Main Categories
    ('Phone', 1, 32),
    ('Television Set', 2, 32),
    ('Gaming Console', 3, 32),
    ('Furniture', 4, NULL),
    ('Edible Items', 5, NULL),
    ('Stationary', 6, NULL),
    ('Laptop', 7, 32),
    -- Child Categories 

    -- Category 1: Phones
    ('Apple iPhone', 8, 1),
    ('Samsung Phones', 9, 1),
    ('Huawei Phones', 10, 1),

    -- Category 2: Television Sets
    ('Sony', 11, 2),
    ('Panasonic', 12, 2),
    ('Xaomi', 13, 2),

    -- Category 3: Gaming Consoles
    ('Microsoft', 14, 3),
    ('Sony', 15, 3),

    -- Category 4: Furniture
    ('Table', 16, 4),
    ('Sofa', 17, 4),

    -- Category 5: Edible Items
    ('Chips', 18, 29),
    ('Cold Drink', 19, 30),
    ('Beer', 20, 31),

    -- Category 6: Stationary
    ('Pen', 21, 6),
    ('Pencil', 22, 6),
    ('Eraser', 23, 6),

    -- Category 7: Laptop
    ('Samsung', 24, 7),
    ('Microsoft', 25, 7),
    ('Apple', 26, 7),
    ('Google', 27, 7),

    -- creating more heirarchy

    -- food
    ('Human Food', 28, 5),
    ('Fast food/snacks', 29, 28),
    ('Drinks (non alcoholic)', 30, 28),
    ('Drinks (alcoholic)', 31, 28),

    -- electronics
    ('Electronics', 32, NULL);

INSERT INTO dbo.Shop(
    sName
    )   
VALUES
    ('Apple Store'),
    ('Samsung Store'),
    ('Best Buy'),
    ('Seven Eleven'),
    ('Value Dollar'),
    ('Google Store'),
    ('Subway'),
    ('Stationary Foreva'),
    ('IKEA');

INSERT INTO dbo.Product(
    shopID, pDescription, pName, color, size, price, productTypeID
)
VALUES
    -- Apple products: iPhone XS Max, iPhone 11 Pro, iPhone 12 Pro Max, iPhone 13 Pro
    -- Sold at Apple Store
    (1, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Gold', 'Large', '799', 8),
    (1, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Space Grey', 'Large', '799', 8),
    (1, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'White', 'Large', '799', 8),

    (1, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Gold', 'Medium', '899', 8),
    (1, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Space Grey', 'Medium', '899', 8),
    (1, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'White', 'Medium', '899', 8),

    (1, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Gold', 'Large', '999', 8),
    (1, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Space Grey', 'Large', '999', 8),
    (1, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'White', 'Large', '999', 8),

    (1, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Gold', 'Medium', '1099', 8),
    (1, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Space Grey', 'Medium', '1099', 8),
    (1, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'White', 'Medium', '1099', 8),
    -- Sold at Best Buy
    (3, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Gold', 'Large', '799', 8),
    (3, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Space Grey', 'Large', '799', 8),
    (3, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'White', 'Large', '799', 8),

    (3, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Gold', 'Medium', '899', 8),
    (3, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Space Grey', 'Medium', '899', 8),
    (3, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'White', 'Medium', '899', 8),

    (3, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Gold', 'Large', '999', 8),
    (3, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Space Grey', 'Large', '999', 8),
    (3, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'White', 'Large', '999', 8),

    (3, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Gold', 'Medium', '1099', 8),
    (3, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Space Grey', 'Medium', '1099', 8),
    (3, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'White', 'Medium', '1099', 8),

    -- Samsung phones sold at samsung shops
    (2, 'Samsun phone s20+', 'S20+', 'Gold', 'Large', '799', 9),
    (2, 'Samsun phone s20+', 'S20+', 'Black', 'Large', '799', 9),
    (2, 'Samsun phone s20+', 'S20+', 'White', 'Large', '799', 9),

    (2, 'Samsun phone Note 5', 'Note 5', 'Gold', 'Large', '499', 9),
    (2, 'Samsun phone Note 5', 'Note 5', 'Black', 'Large', '499', 9),
    (2, 'Samsun phone Note 5', 'Note 5', 'White', 'Large', '499', 9),

    -- Samsung phones sold at best buy
    (3, 'Samsun phone s20+', 'S20+', 'Gold', 'Large', '799', 9),
    (3, 'Samsun phone s20+', 'S20+', 'Black', 'Large', '799', 9),
    (3, 'Samsun phone s20+', 'S20+', 'White', 'Large', '799', 9),

    (3, 'Samsun phone Note 5', 'Note 5', 'Gold', 'Large', '499', 9),
    (3, 'Samsun phone Note 5', 'Note 5', 'Black', 'Large', '499', 9),
    (3, 'Samsun phone Note 5', 'Note 5', 'White', 'Large', '499', 9),

    -- Huawei Phone sold at best buy
    (3, 'Huawei Mate 20 Pro', 'Mate 20 Pro', 'Gold', 'Large', '699', 10),
    (3, 'Huawei Mate 20 Pro', 'Mate 20 Pro', 'Black', 'Large', '699', 10),
    (3, 'Huawei Mate 20 Pro', 'Mate 20 Pro', 'White', 'Large', '699', 10),

    -- TVs solely sold at best buy
    (3, 'Sony TV', 'Sony TV', 'Black', 'Large', '699', 11),
    (3, 'Panasonic TV', 'Panasonic TV', 'Black', 'Large', '699', 12),
    (3, 'Xaomi TV', 'Xaomi TV', 'Black', 'Large', '699', 13),

    (3, 'Sony TV', 'Sony TV', 'Black', 'Medium', '599', 11),
    (3, 'Panasonic TV', 'Panasonic TV', 'Black', 'Medium', '599', 12),
    (3, 'Xaomi TV', 'Xaomi TV', 'Black', 'Medium', '599', 13),

    (3, 'Sony TV', 'Sony TV', 'Black', 'Small', '499', 11),
    (3, 'Panasonic TV', 'Panasonic TV', 'Black', 'Small', '499', 12),
    (3, 'Xaomi TV', 'Xaomi TV', 'Black', 'Small', '499', 13),

    -- Gaming consoles sold solely at Best Buy
    (3, 'X Box 360 256 GB', 'X Box 360 256 GB', 'Black', 'Large', '699', 14),
    (3, 'PS5 256 GB', 'PS5 256 GB', 'Black', 'Large', '699', 15),

    (3, 'X Box 360 512 GB', 'X Box 360 512 GB', 'Black', 'Large', '799', 14),
    (3, 'PS5 512 GB', 'PS5 512 GB', 'Black', 'Large', '799', 15),

    -- Tables and sofas sold at IKEA
    (9, 'Big sofa', 'Sofa, Big', 'Black', 'Large', '599', 16),
    (9, 'Big table', 'Table, Big', 'Black', 'Large', '599', 17),

    (9, 'Medium sofa', 'Sofa, Medium', 'Black', 'Medium', '399', 16),
    (9, 'Medium table', 'Table, Medium', 'Black', 'Medium', '399', 17),

    (9, 'Small sofa', 'Sofa, Small', 'Black', 'Small', '199', 16),
    (9, 'Small table', 'Table, Small', 'Black', 'Small', '199', 17),

    (9, 'Big sofa', 'Sofa, Big', 'Blue', 'Large', '599', 16),
    (9, 'Big table', 'Table, Big', 'Blue', 'Large', '599', 17),

    (9, 'Medium sofa', 'Sofa, Medium', 'Blue', 'Medium', '399', 16),
    (9, 'Medium table', 'Table, Medium', 'Blue', 'Medium', '399', 17),

    (9, 'Small sofa', 'Sofa, Small', 'Blue', 'Small', '199', 16),
    (9, 'Small table', 'Table, Small', 'Blue', 'Small', '199', 17),

    (9, 'Big sofa', 'Sofa, Big', 'Green', 'Large', '599', 16),
    (9, 'Big table', 'Table, Big', 'Green', 'Large', '599', 17),

    (9, 'Medium sofa', 'Sofa, Medium', 'Green', 'Medium', '399', 16),
    (9, 'Medium table', 'Table, Medium', 'Green', 'Medium', '399', 17),

    (9, 'Small sofa', 'Sofa, Small', 'Green', 'Small', '199', 16),
    (9, 'Small table', 'Table, Small', 'Green', 'Small', '199', 17),

    -- Chips, cold drinks in Subway, Value Dollar, Seven 11
    (7, 'Chips', 'Lays', 'Yellow', 'Small', '3', 18),
    (7, 'Cold Drink', 'Coca Cola', 'Red', 'Small', '3', 19),

    (7, 'Chips', 'Lays', 'Yellow', 'Large', '5', 18),
    (7, 'Cold Drink', 'Coca Cola', 'Red', 'Large', '5', 19),

    (7, 'Chips', 'Lays', 'Yellow', 'Medium', '4', 18),
    (7, 'Cold Drink', 'Coca Cola', 'Red', 'Medium', '4', 19),

    (5, 'Chips', 'Lays', 'Yellow', 'Small', '3', 18),
    (5, 'Cold Drink', 'Coca Cola', 'Red', 'Small', '3', 19),

    (5, 'Chips', 'Lays', 'Yellow', 'Large', '5', 18),
    (5, 'Cold Drink', 'Coca Cola', 'Red', 'Large', '5', 19),

    (5, 'Chips', 'Lays', 'Yellow', 'Medium', '4', 18),
    (5, 'Cold Drink', 'Coca Cola', 'Red', 'Medium', '4', 19),

    (4, 'Chips', 'Lays', 'Yellow', 'Small', '3', 18),
    (4, 'Cold Drink', 'Coca Cola', 'Red', 'Small', '3', 19),

    (4, 'Chips', 'Lays', 'Yellow', 'Large', '5', 18),
    (4, 'Cold Drink', 'Coca Cola', 'Red', 'Large', '5', 19),

    (4, 'Chips', 'Lays', 'Yellow', 'Medium', '4', 18),
    (4, 'Cold Drink', 'Coca Cola', 'Red', 'Medium', '4', 19),

    -- Beer at Seven 11
    (4, 'Beer', 'Beer Small', 'Green', 'Small', '7', 20),
    (4, 'Beer', 'Beer Medium', 'Green', 'Medium', '7', 20),
    (4, 'Beer', 'Beer Large', 'Green', 'Large', '7', 20),

    -- Pen, Pencil, Eraser at Stationary Foreva
    (8, 'Pen', 'Pen', 'red', 'NA', '0.5', 21),
    (8, 'Pencil', 'Pencil', 'red', 'NA', '0.5', 22),
    (8, 'Eraser', 'Eraser', 'white', 'Large', '0.5', 23),

    (8, 'Pen', 'Pen', 'blue', 'NA', '0.5', 21),
    (8, 'Eraser', 'Eraser', 'white', 'Medium', '0.5', 23),

    (8, 'Pen', 'Pen', 'Black', 'NA', '0.5', 21),
    (8, 'Eraser', 'Eraser', 'white', 'Small', '0.5', 23),

    -- Laptops sold at apple store, samsung store, best buy and google store
    (1, 'Macbook pro 13 inch', 'Macbook Pro 13', 'Silver', 'Small', '1899', 26),
    (1, 'Macbook pro 15 inch', 'Macbook Pro 15', 'Silver', 'Large', '2899', 26),
    (3, 'Macbook pro 13 inch', 'Macbook Pro 13', 'Silver', 'Small', '1899', 26),
    (3, 'Macbook pro 15 inch', 'Macbook Pro 15', 'Silver', 'Large', '2899', 26),

    (2, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Small', '899', 24),
    (2, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Large', '1899', 24),
    (3, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Small', '899', 24),
    (3, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Large', '1899', 24),

    (3, 'Windows Notebook', 'Dell Notebook', 'Silver', 'Small', '999', 25),
    (3, 'Windows Notebook', 'Dell Notebook', 'Silver', 'Large', '1599', 25),

    (6, 'Google Notebook', 'Google Notebook', 'Silver', 'Small', '599', 27),
    (6, 'Google Notebook', 'Google Notebook', 'Silver', 'Large', '999', 27),
    (3, 'Google Notebook', 'Google Notebook', 'Silver', 'Small', '599', 27),
    (3, 'Google Notebook', 'Google Notebook', 'Silver', 'Large', '999', 27);

INSERT INTO dbo.OrderItem(
    orderID,shipmentId,productID,quantity,unitPrice,itemStatus
    )   
VALUES
    (1,NULL,2,2,10.5,0),
    (1,NULL,14,2,19.5,0),
    (2,1,3,1,10.5,1),
    (2,2,10,1,17.5,0),
    (3,NULL,29,10,1.5,2),
    (4,3,4,5,10.5,1);
    -- (1,NULL,2,10,0.5,1);

INSERT INTO dbo.Invoice(
    orderID,invoiceStatus,invoiceDate
    )   
VALUES
    (1,1,'2021-12-25'),
    (2,2,'2021-12-26'),
    (3,0,'2021-12-27'),
    (4,0,'2021-12-28'),
    (5,2,'2021-12-29'),
    (6,1,'2021-12-20'),
    (7,0,'2021-12-31');

INSERT INTO dbo.Payment(
    invoiceNumber,cardNumber,amount,paymentDate
    )   
VALUES
    (1,123123123,100,'2021-12-25'),
    (1,234234234 ,100,'2021-12-25'),
    (1,456456456,100,'2021-12-25'),
    (1,123123123 ,100,'2021-12-25'),
    (1,234234234 ,100,'2021-12-25');


INSERT INTO dbo.RestrictedTo(
    shopID, productTypeID
    )
VALUES
    -- Apple Store, iPhone
    (1, 8),
    -- Apple Store, Mac
    (1, 26),
    -- Samsung Store, Samsung Phone
    (2, 9),
    -- Samsung Store, Samsung Laptop
    (2, 24),
    -- Best Buy, all electronics
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (3, 12),
    (3, 13),
    (3, 14),
    (3, 15),
    (3, 24),
    (3, 25),
    (3, 26),
    (3, 27),
    -- 7-11, Edible items.
    (4, 18),
    (4, 19),
    (4, 20),
    -- Value Dollar, edible items, stationary
    (5, 18),
    (5, 19),
    (5, 20),
    (5, 21),
    (5, 22),
    (5, 23),
    -- Google store, tvs, phones, laptops 
    (6, 9),
    (6, 10),
    (6, 11),
    (6, 12),
    (6, 13),
    (6, 27),
    -- Subway, cold drink, chips
    (7, 18),
    (7, 19),
    -- Stationary Foreva, staionary
    (8, 21),
    (8, 22),
    (8, 23),
    -- IKEA, Furniture
    (9, 16),
    (9, 17);

