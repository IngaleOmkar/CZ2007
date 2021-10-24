USE PROJECT
GO

INSERT INTO dbo.Payment(
    cardNumber,custID,expiryDate
    )   
VALUES
    (123123123,1,'2021-12-25'),
    (234234234,2,'2021-12-25'),
    (345345345,3,'2021-12-25'),
    (456456456,4,'2021-12-25');

-- This will need to change the card number as its just a temp 