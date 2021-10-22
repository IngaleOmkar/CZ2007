USE Project
GO

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
