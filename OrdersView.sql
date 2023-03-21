CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `Capstoner`@`%` 
    SQL SECURITY DEFINER
VIEW `OrdersView` AS
    SELECT 
        `Orders`.`OrderID` AS `OrderID`,
        `Orders`.`Quantity` AS `Quantity`,
        `Orders`.`TotalCost` AS `TotalCost`
    FROM
        `Orders`
    WHERE
        (`Orders`.`Quantity` >= 2)