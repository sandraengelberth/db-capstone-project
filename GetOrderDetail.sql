PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost From Orders WHERE BookingID = ?';

SET @id =1;
EXECUTE GetOrderDetail USING @id;