USE PROJECT
GO

INSERT INTO dbo.OrderTable(
    custID,orderDate,orderStatus
    )   
VALUES
    (1,'2021-12-25',0),
    (2,'2021-11-15',1),
    (1,'2021-11-5',2),
    (4,'2021-1-25',2);