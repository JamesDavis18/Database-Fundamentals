SELECT `producttable`.`pname`, `producttable`.prodcode`, `producttable.`productType`, `pcategories`.`ID`
FROM `pcategories`
LEFT JOIN `producttable` ON `pcategories`.`ID` = `producttable`.`pID`
ORDER BY `producttable`.`prodcode`;

