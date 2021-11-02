--Given a customer by an email address, returns the product ids that have been ordered 
-- and paid by this customer but not yet shipped.

SELECT o.productID FROM Customer c, OrderTable t, OrderItem o, Invoice i 
WHERE c.CustID = t.CustID AND t.orderID = o.orderID AND o.orderID = i.orderID
AND i.invoiceStatus = 1 
AND o.shipmentId IS NULL
AND c.emailAddress = 'email address here';

--Return the descriptions of all the 2nd level product types. The product types with no parent will  be  regarded  as  1st  level  product  types  and  their  direct  child  product  types  will  be regarded as 2nd level.

SELECT p2.productTypeID, p2.ptDescription  FROM ProductType p1, ProductType p2
WHERE p1.productTypeID = p2.parentID AND p1.parentID IS NULL; 


--Get 3 random customers and return their email addresses

SELECT TOP 3 emailAddress FROM Customer
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
    FROM ( SELECT  oi.orderID as "orderID", SUM(oi.unitPrice*oi.quantity) AS "Total Amount" 
            FROM OrderItem oi
            GROUP BY oi.orderID ) AS A

    LEFT JOIN ( SELECT i.orderID as "orderID1", COUNT(*) AS "Number Of Payment"
    FROM Invoice i, Payment p
    WHERE i.orderID = p.invoiceNumber 
    GROUP BY i.orderID)  AS B

    ON A.orderId=B.orderId1

    LEFT JOIN ( SELECT  p.invoiceNumber as "orderID2", SUM(p.amount) AS "Paid Amount"
            FROM Payment p
            GROUP BY p.invoiceNumber)  AS C

    ON A.orderID=C.orderId2
)


-- 8) Additional 

SELECT orderID,  ISNULL([Number Of Payment], 0 ) AS "Number Of Payment", ISNULL([Total Amount], 0 ) AS "Total Amount", ISNULL([Paid Amount], 0 ) AS "Paid Amount", ISNULL([Total Amount], 0 ) - ISNULL([Paid Amount], 0 ) AS "Unpaid Amount"
FROM Temp

;WITH Pair AS (SELECT DISTINCT or1.orderID AS orderID1, or2.orderID AS orderID2 ,o1.productID AS productID1, o2.productID AS productID2, or1.custID
      FROM OrderTable or1, OrderTable or2, OrderItem o1, OrderItem o2
      WHERE 
      or1.orderID = o1.orderID
      AND or2.orderID = o2.orderID
      AND or1.custID = or2.custID
      AND o1.productID < o2.productID
      AND o1.productID = 2) 

SELECT DISTINCT p.productID2
FROM Pair p, ProductType pt1, ProductType pt2, product pro1, product pro2
WHERE p.productID1 = pro1.productID
AND   p.productID2 = pro2.productID
AND   (pro1.productTypeID = pro2.productTypeID 

OR    (pt1.productTypeID = pro1.productTypeID
AND    pt2.productTypeID = pro2.productTypeID
AND    pt2.parentID = pt1.parentID) )