--When the full payment to an invoice is made, the invoice status is changed from ‘issued’ to ‘paid’. 

CREATE TRIGGER FullPayment 
ON Payment
AFTER INSERT
AS 
BEGIN

	SELECT invoiceNum, SUM(OrderItem.unitPrice*OrderItem.quantity) AS totalCost INTO #TotalCost FROM Invoice, OrderItem 
		WHERE OrderItem.orderID=Invoice.orderID
		GROUP BY invoiceNum;
	SELECT invoiceNumber, SUM(amount) AS TotalPaid INTO #Paid FROM Payment GROUP BY invoiceNumber;
	
	UPDATE Invoice SET invoiceStatus = 1 
		WHERE invoiceNum IN (
					SELECT invoiceNum FROM #TotalCost,#Paid 
						WHERE #Paid.invoiceNumber = #TotalCost.invoiceNum 
							AND #TotalCost.totalCost > #Paid.TotalPaid);

	UPDATE Invoice SET invoiceStatus = 2 
		WHERE invoiceNum IN (
					SELECT invoiceNum FROM #TotalCost,#Paid 
						WHERE #Paid.invoiceNumber = #TotalCost.invoiceNum 
							AND #TotalCost.totalCost <= #Paid.TotalPaid);

END

GO

--When an order item is shipped, its status is changed from ‘processing’ to ‘shipped’.
--OrderItem cannot be shipped when invoice is not fully paid

CREATE TRIGGER ShipOrderItem 
ON OrderItem
AFTER UPDATE
AS 
BEGIN
	IF UPDATE(shipmentId)
	BEGIN
		UPDATE o SET shipmentId=NULL FROM OrderItem o WHERE EXISTS(
			SELECT * FROM inserted
			 LEFT JOIN Invoice ON Invoice.orderID = inserted.orderID
			 WHERE (invoiceStatus <> 2 OR invoiceStatus IS NULL) AND inserted.shipmentId IS NOT NULL AND inserted.sequenceNum = o.sequenceNum
				AND inserted.orderID = o.orderID
		);
		IF EXISTS (SELECT * FROM inserted
			 LEFT JOIN Invoice ON Invoice.orderID = inserted.orderID
			 WHERE (invoiceStatus <> 2 OR invoiceStatus IS NULL) AND inserted.shipmentId IS NOT NULL)
		BEGIN
			;THROW 51000, 'Cannot ship orderItem that are not fully paid',1 
		END
	END
	UPDATE OrderItem SET itemStatus = 1 WHERE shipmentId IS NOT NULL;
END


--When all the products in an order have been shipped, the order status is changed from ‘processing’ to ‘completed’. 
GO
CREATE TRIGGER ChangeOrderStatus 
ON OrderItem
AFTER UPDATE
AS 
BEGIN
	UPDATE OrderTable SET orderStatus = 1 WHERE orderID NOT IN(SELECT DISTINCT orderID FROM orderItem WHERE itemStatus!=1);
END

GO

-- Check if payment exceed total amount, Third paymenmt must be full payment


CREATE TRIGGER FullPayment 
ON Payment
INSTEAD OF INSERT
AS 
BEGIN

DECLARE @in INT
DECLARE @cn INT
DECLARE @am INT
DECLARE @pd DATE

DECLARE @ta INT -- Total Amount
DECLARE @pa INT -- Paid Amount
DECLARE @paTemp INT -- Paid Amount
DECLARE @pn INT -- Payment Number

SELECT @in=invoiceNumber FROM INSERTED
SELECT @cn=cardNumber FROM INSERTED
SELECT @am=amount FROM INSERTED
SELECT @pd=paymentDate FROM INSERTED

SET @pn = (SELECT COUNT(*) FROM Payment WHERE Payment.invoiceNumber = @in)

-- Total Amount
SET @ta = (SELECT SUM(OrderItem.unitPrice*OrderItem.quantity) 
FROM Invoice, OrderItem 
WHERE OrderItem.orderID=Invoice.orderID AND Invoice.invoiceNum=@in)

-- Paid Amount
SET @paTemp = (SELECT SUM(amount) FROM Payment WHERE Payment.invoiceNumber=@in)

IF (@paTemp > 0)
    SET @pa = @paTemp
ELSE 
    SET @pa = 0

-- Check if payment exceed total amount and check if third payment is full
IF ((@am > (@ta-@pa)) OR (((@pn)=2) AND @am < (@ta-@pa)))
    ROLLBACK TRANSACTION
ELSE
    INSERT INTO dbo.Payment(invoiceNumber,cardNumber,amount,paymentDate) 
    VALUES  (@in,@cn,@am,@pd);


END

GO



-- Check if payment of an order is paid, it cannot be cancel anymore.
CREATE TRIGGER CancelPaid
ON OrderTable
INSTEAD OF UPDATE
AS 
BEGIN

DECLARE @ci INT
DECLARE @od INT
DECLARE @os INT
DECLARE @oi INT

DECLARE @is SMALLINT --Invoice Status

SELECT @ci=custId FROM INSERTED
SELECT @od=orderDate FROM INSERTED
SELECT @os=orderStatus FROM INSERTED
SELECT @oi=orderID FROM INSERTED

SET @is = (SELECT invoiceStatus FROM Invoice WHERE Invoice.orderID = @oi)

IF (@is != 0)
    ROLLBACK TRANSACTION

END

GO