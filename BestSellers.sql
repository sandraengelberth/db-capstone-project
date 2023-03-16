CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `Capstoner`@`%` 
    SQL SECURITY DEFINER
VIEW `BestSellers` AS
    SELECT 
        `Menu`.`MenuID` AS `MenuID`
    FROM
        `Menu`
    WHERE
        `Menu`.`MenuID` IN (SELECT 
                `Orders`.`Quantity`
            FROM
                `Orders`
            WHERE
                (`Orders`.`Quantity` >= 2))