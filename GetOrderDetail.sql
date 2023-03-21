PREPARE GetOrderDetail 
FROM 'SELECT OrderID, Quantity, TotalCost 
FROM Orders
WHERE BookingID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;
