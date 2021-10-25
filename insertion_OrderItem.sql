USE PROJECT
GO

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