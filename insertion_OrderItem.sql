USE PROJECT
GO

INSERT INTO dbo.OrderItem(
    orderID,shipmentId,productID,quantity,unitPrice,itemStatus -- 2 out of stock
    )   
VALUES
    (1,NULL,2,5,10.5,0),
    (2,NULL,2,20,10.5,0),
    (3,NULL,2,2,10.5,0),
    (4,NULL,3,4,10.5,0),
    (5,NULL,3,14,10.5,0),
    (6,NULL,3,8,10.5,0),
    (7,NULL,4,7,10.5,0),
    (8,NULL,4,6,10.5,0),
    (9,NULL,4,24,10.5,0),

    (11,NULL,14,2,19.5,2),
    (10,1,2,10,10.5,1),
    (10,2,3,9,10.5,1),
    (10,2,1,8,10.5,1),
    (10,4,3,7,10.5,1),
    (10,5,3,6,10.5,1),
    (12,NULL,10,1,17.5,2),
    (11,NULL,29,10,1.5,2),
    (10,3,4,5,10.5,1);