CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `Capstoner`@`%` 
    SQL SECURITY DEFINER
VIEW `BestSellers` AS
    SELECT 
        `Menu`.`MenuName` AS `MenuName`
    FROM
        `Menu`
    WHERE
        `Menu`.`MenuName` IN (SELECT 
                `Orders`.`Quantity`
            FROM
                `Orders`
            WHERE
                (`Orders`.`Quantity` >= 2))