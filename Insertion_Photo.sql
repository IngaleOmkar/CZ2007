-- DO NOT USE THIS - NOT COMPLETE 
USE Project
GO

INSERT INTO dbo.Photo(
    content, productID
)
VALUES
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 1),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 2),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 3),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 4),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 5),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 6),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 7),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 8),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 9),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 10),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 11),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 12),
    -- Sold at Best Buy
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 13),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 14),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 15),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 16),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 17),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 18),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 19),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 20),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 21),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 22),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 23),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 24),

    -- Samsung phones sold at samsung shops
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 25),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 26),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 27),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 28),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 29),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 30),

    -- Samsung phones sold at best buy
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 31),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 32),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 33),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 34),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 35),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 36),

    -- Huawei Phone sold at best buy
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 37),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 38),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\phone.jpg', SINGLE_BLOB) AS T1), 39),

    -- TVs solely sold at best buy
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 40),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 41),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 42),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 43),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 44),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 45),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 46),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 47),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\tv.jpg', SINGLE_BLOB) AS T1), 47),

    -- Gaming consoles sold solely at Best Buy
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\xbox.jpg', SINGLE_BLOB) AS T1), 48),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\xbox.jpg', SINGLE_BLOB) AS T1), 49),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\xbox.jpg', SINGLE_BLOB) AS T1), 50),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\xbox.jpg', SINGLE_BLOB) AS T1), 51),

    -- Tables and sofas sold at IKEA
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 52),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 53),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 54),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 55),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 56),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 57),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 58),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 59),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 60),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 61),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 62),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 63),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 64),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 65),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 66),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 67),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\sofa.jpg', SINGLE_BLOB) AS T1), 68),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\table.jpg', SINGLE_BLOB) AS T1), 69),

    -- Chips, cold drinks in Subway, Value Dollar, Seven 11
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 70),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 71),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 72),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 73),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 74),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 75),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 76),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 77),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 78),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 79),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 80),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 81),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 82),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 83),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 84),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 85),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\chips.jpg', SINGLE_BLOB) AS T1), 86),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 87),

    -- Beer at Seven 11
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 88),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 89),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\bottle.jpg', SINGLE_BLOB) AS T1), 90),

    -- Pen, Pencil, Eraser at Stationary Foreva
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\pen.png', SINGLE_BLOB) AS T1), 91),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\pencil.jpg', SINGLE_BLOB) AS T1), 92),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\eraser.jpg', SINGLE_BLOB) AS T1), 93),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\pen.png', SINGLE_BLOB) AS T1), 94),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\eraser.jpg', SINGLE_BLOB) AS T1), 95),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\pen.png', SINGLE_BLOB) AS T1), 96),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\eraser.jpg', SINGLE_BLOB) AS T1), 97),

    -- Laptops sold at apple store, samsung store, best buy and google store
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 98),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 99),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 100),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 101),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 102),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 103),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 104),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 105),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 106),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 107),

    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 108),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 109),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 110),
    ((SELECT * FROM OPENROWSET(BULK N'C:\Users\Raju\Desktop\CZ2007\Images\laptop.jpg', SINGLE_BLOB) AS T1), 111);
