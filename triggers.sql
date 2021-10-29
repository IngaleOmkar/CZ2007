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

