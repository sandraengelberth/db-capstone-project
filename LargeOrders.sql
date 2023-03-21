CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `Capstoner`@`%` 
    SQL SECURITY DEFINER
VIEW `LargeOrders` AS
    SELECT 
        `Customer`.`CustomerID` AS `CustomerID`,
        `Customer`.`FullName` AS `FullName`,
        `Orders`.`OrderID` AS `OrderID`,
        `Orders`.`TotalCost` AS `TotalCost`,
        `Menu`.`MenuName` AS `MenuName`,
        `MenuItems`.`Type` AS `Type`,
        `MenuItems`.`Item` AS `Item`
    FROM
        (((`Customer`
        JOIN `Orders` ON ((`Customer`.`CustomerID` = `Orders`.`CustomerID`)))
        JOIN `Menu` ON ((`Orders`.`MenuID` = `Menu`.`MenuID`)))
        JOIN `MenuItems` ON ((`Menu`.`ItemID` = `MenuItems`.`ItemID`)))
    WHERE
        (`Orders`.`TotalCost` > 150)