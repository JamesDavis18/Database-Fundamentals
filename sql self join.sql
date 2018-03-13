SELECT `producttable.`prodCode`, AS `pName`, `pcategories`.`pCategory`, `producttable`.`pcategory`
FROM `producttable` `pcategories`
WHERE `pCategory` = `pcategory`
AND `ID` <> `pID`
ORDER BY `pName`;
