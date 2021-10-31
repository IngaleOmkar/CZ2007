--Given a customer by an email address, returns the product ids that have been ordered 
and paid by this customer but not yet shipped.

SELECT o.productID FROM Customer c, OrderTable t, OrderItem o, Invoice i 
WHERE c.CustID = t.CustID AND t.orderID = o.orderID AND o.orderID = i.orderID
AND i.invoiceStatus = 1 
AND o.shipmentId IS NULL
AND c.emailAddress = 'email address here';

--Return the descriptions of all the 2nd level product types. The product types with no parent will  be  regarded  as  1st  level  product  types  and  their  direct  child  product  types  will  be regarded as 2nd level.

SELECT p2.productTypeID, p2.ptDescription  FROM ProductType p1, ProductType p2
WHERE p1.productTypeID = p2.parentID AND p1.parentID IS NULL; 


--Get 3 random customers and return their email addresses

SELECT TOP 3 email_address FROM Customer
ORDER BY NEWID();


--Return TotalRevenue by month for each Shop Name.

SELECT sName, invoiceYear, invoiceMonth, SUM(Revenue) AS TotalRevenue FROM (
	SELECT p.shopID, YEAR(i.invoiceDate) AS invoiceYear, MONTH(i.invoiceDate) AS invoiceMonth, SUM(o.unitPrice*o.quantity) as Revenue FROM OrderItem o, Invoice i, Product p
		WHERE o.orderID = i.orderID AND i.invoiceStatus = 2 AND o.productID = p.productID 
		GROUP BY p.shopID, invoiceDate
) AS MonthlyRevenue
FULL JOIN Shop s ON s.shopID = MonthlyRevenue.shopID 
GROUP BY sName,invoiceYear,invoiceMonth
;


-- 2) Get Top 3 productTypeID according to Quantity Sold

SELECT TOP 3 p1.productTypeID, SUM(o1.quantity) as "Quantity Sold"
FROM Product p1, Invoice I1, OrderTable or1, OrderItem o1
WHERE 
o1.orderID = or1.orderID
AND or1.orderID = I1.orderID
AND or1.orderID = o1.orderID
AND or1.orderStatus <> 2
AND i1.invoiceStatus = 2
AND o1.productID = p1.productID
GROUP BY p1.productTypeID
ORDER BY SUM(o1.quantity) DESC;


-- 4) Find 2 product ids that are ordered together the most. 

;WITH Pair AS (SELECT DISTINCT or1.orderID,o1.productID AS productID1, o2.productID AS productID2
      FROM OrderTable or1, OrderItem o1, OrderItem o2
      WHERE 
      or1.orderID = o1.orderID
      AND or1.orderID = o2.orderID
      AND o1.sequenceNum <> o2.sequenceNum
      AND o1.productID < o2.productID) 

SELECT Pair.productID1, Pair.productID2, COUNT(*) AS 'Number Order Together'
  FROM Pair
  GROUP BY Pair.productID1,Pair.productID2
  HAVING COUNT(*) = (
    SELECT TOP 1 COUNT(*) AS 'Count'
    FROM Pair
      GROUP BY Pair.productID1,Pair.productID2
      ORDER BY 'Count' DESC)
  

--7) Get Number Of Payment, Paid Amount, Total Amount and Unpaid Amount for every orderID

;WITH Temp AS (
SELECT * 
    FROM ( SELECT i.orderID, COUNT(*) AS "Number Of Payment"
    FROM Invoice i, Payment p
    WHERE i.orderID = p.invoiceNumber 
    GROUP BY i.orderID) AS A

    LEFT JOIN ( SELECT  oi.orderID as "orderID1", SUM(oi.unitPrice*oi.quantity) AS "Total Amount" 
            FROM OrderItem oi
            GROUP BY oi.orderID)  AS B
    ON A.orderId=B.orderId1

    LEFT JOIN ( SELECT  p.invoiceNumber as "orderID2", SUM(p.amount) AS "Paid Amount"
            FROM Payment p
            GROUP BY p.invoiceNumber)  AS C

    ON A.orderId=C.orderId2
)

SELECT orderID, [Number Of Payment], [Total Amount], [Paid Amount], [Total Amount] - [Paid Amount] AS "Unpaid Amount"
FROM Temp

