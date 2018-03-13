SELECT `producttable`.`pName`, `producttable`.`productType`, `producttable`.`prodCode`, `producttable`.`pID`
FROM`producttable`
WHERE `pID` IN (SELECT `ID`
				FROM `pcategories`
				WHERE `ID` > 4)