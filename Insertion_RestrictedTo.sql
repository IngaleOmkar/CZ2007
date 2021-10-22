USE Project
GO

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