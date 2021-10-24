USE PROJECT
GO

INSERT INTO dbo.Payment(
    invoiceNumber,cardNumber,amount,paymentDate
    )   
VALUES
    (1,123123123,100,'2021-12-25'),
    (1,234234234 ,100,'2021-12-25'),
    (1,456456456,100,'2021-12-25'),
    (1,123123123 ,100,'2021-12-25'),
    (1,234234234 ,100,'2021-12-25');

-- This will need to change the card number as its just a temp 