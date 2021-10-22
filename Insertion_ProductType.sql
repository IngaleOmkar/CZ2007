USE Project
GO

INSERT INTO dbo.ProductType(
    ptDescription, productTypeID, parentID
    )
VALUES
    -- Main Categories
    ('Phone', 1, NULL),
    ('Television Set', 2, NULL),
    ('Gaming Console', 3, NULL),
    ('Furniture', 4, NULL),
    ('Edible Items', 5, NULL),
    ('Stationary', 6, NULL),
    ('Laptop', 7, NULL),
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
    ('Chips', 18, 5),
    ('Cold Drink', 19, 5),
    ('Beer', 20, 5),

    -- Category 6: Stationary
    ('Pen', 21, 6),
    ('Pencil', 22, 6),
    ('Eraser', 23, 6),

    -- Category 7: Laptop
    ('Samsung', 24, 7),
    ('Microsoft', 25, 7),
    ('Apple', 26, 7),
    ('Google', 27, 7);