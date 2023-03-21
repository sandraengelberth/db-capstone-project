CREATE DEFINER=`Capstoner`@`%` PROCEDURE `CancelOrder`(OrderID INT)
BEGIN
DELETE FROM Orders Where OrderID = OrderID;

SELECT CONCAT("Order ", OrderID, " is cancelled") AS Confirmation;
END