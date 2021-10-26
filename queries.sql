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
