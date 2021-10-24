USE PROJECT
GO

INSERT INTO dbo.OrderItem(
    orderID,sequenceNum,productID,shopID,shipmentId,quantity,unitPrice,itemStatus
    )   
VALUES
    (1,1,2,1,NULL,2,10.5,0),
    (1,2,14,3,NULL,2,19.5,0),
    (2,1,3,1,1,1,10.5,1),
    (2,2,10,1,2,1,17.5,0),
    (3,1,29,2,NULL,10,1.5,2),
    (4,1,4,1,3,5,10.5,1),
    (1,3,2,1,NULL,10,0.5,1);