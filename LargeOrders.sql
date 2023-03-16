CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `Capstoner`@`%` 
    SQL SECURITY DEFINER
VIEW `LargeOrders` AS
    SELECT 
        `Customer`.`CustomerID` AS `CustomerID`,
        CONCAT(`Customer`.`GuestFirstName`,
                ' ',
                `Customer`.`GuestLastName`) AS `FullName`,
        `Orders`.`OrderID` AS `OrderID`,
        `Orders`.`TotalCost` AS `TotalCost`,
        `Menu`.`MenuID` AS `MenuID`,
        `MenuItems`.`Type` AS `Type`,
        `MenuItems`.`Item` AS `Item`
    FROM
        ((((`Customer`
        JOIN `Bookings` ON ((`Customer`.`CustomerID` = `Bookings`.`CustomerID`)))
        JOIN `Orders` ON ((`Bookings`.`BookingID` = `Orders`.`BookingID`)))
        JOIN `Menu` ON ((`Orders`.`MenuID` = `Menu`.`MenuID`)))
        JOIN `MenuItems` ON ((`Menu`.`ItemID` = `MenuItems`.`ItemID`)))
    WHERE
        (`Orders`.`TotalCost` >= 40)
    ORDER BY `Orders`.`TotalCost`