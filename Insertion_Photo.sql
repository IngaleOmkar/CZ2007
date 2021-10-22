-- DO NOT USE THIS - NOT COMPLETE 
USE Project
GO

INSERT INTO dbo.Photo(
    shopId, content, productID
)
VALUES
    (1, (SELECT 'jpg',IMAGE FROM OPENROWSET(BULK N'omkaringale/Desktop/Y2S1/Databases/SQLProjects/Project/CZ2007/Images/laptop.jpg', SINGLE_BLOB) AS IMAGE), 1);

    (1, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Gold', 'Large', '799', 1),
    (1, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Space Grey', 'Large', '799', 2),
    (1, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'White', 'Large', '799', 3),

    (1, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Gold', 'Medium', '899', 4),
    (1, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Space Grey', 'Medium', '899', 5),
    (1, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'White', 'Medium', '899', 6),

    (1, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Gold', 'Large', '999', 7),
    (1, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Space Grey', 'Large', '999', 8),
    (1, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'White', 'Large', '999', 9),

    (1, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Gold', 'Medium', '1099', 10),
    (1, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Space Grey', 'Medium', '1099', 11),
    (1, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'White', 'Medium', '1099', 12),
    -- Sold at Best Buy
    (3, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Gold', 'Large', '799', 13),
    (3, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'Space Grey', 'Large', '799', 14),
    (3, 'iPhone XS Max is a 6.5 inch display phone.', 'iPhone XS Max', 'White', 'Large', '799', 15),

    (3, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Gold', 'Medium', '899', 16),
    (3, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'Space Grey', 'Medium', '899', 17),
    (3, 'iPhone 11 Pro is a 6.1 inch display phone.', 'iPhone 11 Pro', 'White', 'Medium', '899', 18),

    (3, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Gold', 'Large', '999', 19),
    (3, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'Space Grey', 'Large', '999', 20),
    (3, 'iPhone 12 Pro Max is a 6.7 inch display phone.', 'iPhone 12 Pro Max', 'White', 'Large', '999', 21),

    (3, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Gold', 'Medium', '1099', 22),
    (3, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'Space Grey', 'Medium', '1099', 23),
    (3, 'iPhone 13 Pro is a 6.1 inch display phone.', 'iPhone 13 Pro', 'White', 'Medium', '1099', 24),

    -- Samsung phones sold at samsung shops
    (2, 'Samsun phone s20+', 'S20+', 'Gold', 'Large', '799', 25),
    (2, 'Samsun phone s20+', 'S20+', 'Black', 'Large', '799', 26),
    (2, 'Samsun phone s20+', 'S20+', 'White', 'Large', '799', 27),

    (2, 'Samsun phone Note 5', 'Note 5', 'Gold', 'Large', '499', 28),
    (2, 'Samsun phone Note 5', 'Note 5', 'Black', 'Large', '499', 29),
    (2, 'Samsun phone Note 5', 'Note 5', 'White', 'Large', '499', 30),

    -- Samsung phones sold at best buy
    (3, 'Samsun phone s20+', 'S20+', 'Gold', 'Large', '799', 31),
    (3, 'Samsun phone s20+', 'S20+', 'Black', 'Large', '799', 32),
    (3, 'Samsun phone s20+', 'S20+', 'White', 'Large', '799', 33),

    (3, 'Samsun phone Note 5', 'Note 5', 'Gold', 'Large', '499', 34),
    (3, 'Samsun phone Note 5', 'Note 5', 'Black', 'Large', '499', 35),
    (3, 'Samsun phone Note 5', 'Note 5', 'White', 'Large', '499', 36),

    -- Huawei Phone sold at best buy
    (3, 'Huawei Mate 20 Pro', 'Mate 20 Pro', 'Gold', 'Large', '699', 37),
    (3, 'Huawei Mate 20 Pro', 'Mate 20 Pro', 'Black', 'Large', '699', 38),
    (3, 'Huawei Mate 20 Pro', 'Mate 20 Pro', 'White', 'Large', '699', 39),

    -- TVs solely sold at best buy
    (3, 'Sony TV', 'Sony TV', 'Black', 'Large', '699', 40),
    (3, 'Panasonic TV', 'Panasonic TV', 'Black', 'Large', '699', 41),
    (3, 'Xaomi TV', 'Xaomi TV', 'Black', 'Large', '699', 42),

    (3, 'Sony TV', 'Sony TV', 'Black', 'Medium', '599', 43),
    (3, 'Panasonic TV', 'Panasonic TV', 'Black', 'Medium', '599', 44),
    (3, 'Xaomi TV', 'Xaomi TV', 'Black', 'Medium', '599', 45),

    (3, 'Sony TV', 'Sony TV', 'Black', 'Small', '499', 46),
    (3, 'Panasonic TV', 'Panasonic TV', 'Black', 'Small', '499', 47),
    (3, 'Xaomi TV', 'Xaomi TV', 'Black', 'Small', '499', 47),

    -- Gaming consoles sold solely at Best Buy
    (3, 'X Box 360 256 GB', 'X Box 360 256 GB', 'Black', 'Large', '699', 48),
    (3, 'PS5 256 GB', 'PS5 256 GB', 'Black', 'Large', '699', 49),

    (3, 'X Box 360 512 GB', 'X Box 360 512 GB', 'Black', 'Large', '799', 50),
    (3, 'PS5 512 GB', 'PS5 512 GB', 'Black', 'Large', '799', 51),

    -- Tables and sofas sold at IKEA
    (9, 'Big sofa', 'Sofa, Big', 'Black', 'Large', '599', 52),
    (9, 'Big table', 'Table, Big', 'Black', 'Large', '599', 53),

    (9, 'Medium sofa', 'Sofa, Medium', 'Black', 'Medium', '399', 54),
    (9, 'Medium table', 'Table, Medium', 'Black', 'Medium', '399', 55),

    (9, 'Small sofa', 'Sofa, Small', 'Black', 'Small', '199', 56),
    (9, 'Small table', 'Table, Small', 'Black', 'Small', '199', 57),

    (9, 'Big sofa', 'Sofa, Big', 'Blue', 'Large', '599', 58),
    (9, 'Big table', 'Table, Big', 'Blue', 'Large', '599', 59),

    (9, 'Medium sofa', 'Sofa, Medium', 'Blue', 'Medium', '399', 60),
    (9, 'Medium table', 'Table, Medium', 'Blue', 'Medium', '399', 61),

    (9, 'Small sofa', 'Sofa, Small', 'Blue', 'Small', '199', 62),
    (9, 'Small table', 'Table, Small', 'Blue', 'Small', '199', 63),

    (9, 'Big sofa', 'Sofa, Big', 'Green', 'Large', '599', 64),
    (9, 'Big table', 'Table, Big', 'Green', 'Large', '599', 65),

    (9, 'Medium sofa', 'Sofa, Medium', 'Green', 'Medium', '399', 66),
    (9, 'Medium table', 'Table, Medium', 'Green', 'Medium', '399', 67),

    (9, 'Small sofa', 'Sofa, Small', 'Green', 'Small', '199', 68),
    (9, 'Small table', 'Table, Small', 'Green', 'Small', '199', 69),

    -- Chips, cold drinks in Subway, Value Dollar, Seven 11
    (7, 'Chips', 'Lays', 'Yellow', 'Small', '3', 70),
    (7, 'Cold Drink', 'Coca Cola', 'Red', 'Small', '3', 71),

    (7, 'Chips', 'Lays', 'Yellow', 'Large', '5', 72),
    (7, 'Cold Drink', 'Coca Cola', 'Red', 'Large', '5', 73),

    (7, 'Chips', 'Lays', 'Yellow', 'Medium', '4', 74),
    (7, 'Cold Drink', 'Coca Cola', 'Red', 'Medium', '4', 75),

    (5, 'Chips', 'Lays', 'Yellow', 'Small', '3', 76),
    (5, 'Cold Drink', 'Coca Cola', 'Red', 'Small', '3', 77),

    (5, 'Chips', 'Lays', 'Yellow', 'Large', '5', 78),
    (5, 'Cold Drink', 'Coca Cola', 'Red', 'Large', '5', 79),

    (5, 'Chips', 'Lays', 'Yellow', 'Medium', '4', 80),
    (5, 'Cold Drink', 'Coca Cola', 'Red', 'Medium', '4', 81),

    (4, 'Chips', 'Lays', 'Yellow', 'Small', '3', 82),
    (4, 'Cold Drink', 'Coca Cola', 'Red', 'Small', '3', 83),

    (4, 'Chips', 'Lays', 'Yellow', 'Large', '5', 84),
    (4, 'Cold Drink', 'Coca Cola', 'Red', 'Large', '5', 85),

    (4, 'Chips', 'Lays', 'Yellow', 'Medium', '4', 86),
    (4, 'Cold Drink', 'Coca Cola', 'Red', 'Medium', '4', 87),

    -- Beer at Seven 11
    (4, 'Beer', 'Beer Small', 'Green', 'Small', '7', 88),
    (4, 'Beer', 'Beer Medium', 'Green', 'Medium', '7', 89),
    (4, 'Beer', 'Beer Large', 'Green', 'Large', '7', 90),

    -- Pen, Pencil, Eraser at Stationary Foreva
    (8, 'Pen', 'Pen', 'red', 'NA', '0.5', 91),
    (8, 'Pencil', 'Pencil', 'red', 'NA', '0.5', 92),
    (8, 'Eraser', 'Eraser', 'white', 'Large', '0.5', 93),

    (8, 'Pen', 'Pen', 'blue', 'NA', '0.5', 94),
    (8, 'Eraser', 'Eraser', 'white', 'Medium', '0.5', 95),

    (8, 'Pen', 'Pen', 'Black', 'NA', '0.5', 96),
    (8, 'Eraser', 'Eraser', 'white', 'Small', '0.5', 97),

    -- Laptops sold at apple store, samsung store, best buy and google store
    (1, 'Macbook pro 13 inch', 'Macbook Pro 13', 'Silver', 'Small', '1899', 98),
    (1, 'Macbook pro 15 inch', 'Macbook Pro 15', 'Silver', 'Large', '2899', 99),
    (3, 'Macbook pro 13 inch', 'Macbook Pro 13', 'Silver', 'Small', '1899', 100),
    (3, 'Macbook pro 15 inch', 'Macbook Pro 15', 'Silver', 'Large', '2899', 101),

    (2, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Small', '899', 102),
    (2, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Large', '1899', 103),
    (3, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Small', '899', 104),
    (3, 'Samsung Notebook', 'Samsung Notebook', 'Silver', 'Large', '1899', 105),

    (3, 'Windows Notebook', 'Dell Notebook', 'Silver', 'Small', '999', 106),
    (3, 'Windows Notebook', 'Dell Notebook', 'Silver', 'Large', '1599', 107),

    (6, 'Google Notebook', 'Google Notebook', 'Silver', 'Small', '599', 108),
    (6, 'Google Notebook', 'Google Notebook', 'Silver', 'Large', '999', 109),
    (3, 'Google Notebook', 'Google Notebook', 'Silver', 'Small', '599', 110),
    (3, 'Google Notebook', 'Google Notebook', 'Silver', 'Large', '999', 111);
