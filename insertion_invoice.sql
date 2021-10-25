USE PROJECT
GO

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