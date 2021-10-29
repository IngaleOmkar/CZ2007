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
AND or1.orderStatus = 1
AND i1.invoiceStatus = 2
AND o1.productID = p1.productID
GROUP BY p1.productTypeID
ORDER BY SUM(o1.quantity) DESC;


-- 4) Find 2 product ids that are ordered together the most. 

SELECT o1.productID, o2.productID, COUNT(*) as "Number Order Together"
FROM OrderTable or1, OrderItem o1, OrderItem o2
WHERE 
or1.orderID = o1.orderID
AND or1.orderID = o2.orderID
AND o1.sequenceNum <> o2.sequenceNum
AND o1.productID < o2.productID
GROUP BY o1.productID, o2.productID
HAVING COUNT(*) = (
SELECT TOP 1 COUNT(*)
FROM OrderTable or1, OrderItem o1, OrderItem o2
WHERE 
or1.orderID = o1.orderID
AND or1.orderID = o2.orderID
AND o1.sequenceNum <> o2.sequenceNum
AND o1.productID < o2.productID
GROUP BY o1.productID, o2.productID
ORDER BY COUNT(o1.productID) DESC)


--7) Get payment number for each product type 

SELECT pd.productTypeID, COUNT(p.invoiceNumber) AS "Number of Payment" , AVG(pd.price) AS "Average Product Price"
FROM Invoice i, OrderTable ot , OrderItem oi, Payment p, Product pd
WHERE i.invoiceStatus = 2
AND i.orderID = ot.orderID
AND oi.orderID = ot.orderID
AND p.invoiceNumber = ot.orderID
AND oi.productID = pd.productID
GROUP BY pd.productTypeID 

