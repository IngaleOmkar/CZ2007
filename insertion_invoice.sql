USE PROJECT
GO

INSERT INTO dbo.Invoice(
    orderID,invoiceStatus,invoiceDate -- 0 -not paid, 1 - partially paid, 2 - fully paid
    )   
VALUES
    (1,1,'2021-12-25'), --Cust 1
    (2,0,'2021-12-26'), --Cust 1
    (3,1,'2021-12-27'), --Cust 1
    (4,0,'2021-12-28'), --Cust 3
    (5,1,'2021-12-29'), --Cust 4
    (6,0,'2021-12-20'), --Cust 5
    (7,1,'2021-12-31'), --Cust 6
    (8,0,'2021-12-31'), --Cust 1
    (9,1,'2021-12-31'), --Cust 1
    (10,2,'2021-12-31'), --Cust 2
    (11,0,'2021-12-31'), --Cust 1
    (12,0,'2021-12-31') --Cust 4
    ;