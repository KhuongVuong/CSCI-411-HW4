---CS411246---
----------------------------------------------
--Create Veterinarians table--
CREATE TABLE Veterinarians (
    vid int,
    vName char(20),
    PRIMARY KEY(vid)
);
-----------------------------------------
INSERT INTO Veterinarians(vid, vName)
VALUES(1001, 'John');
INSERT INTO Veterinarians(vid, vName)
VALUES(1002, 'David');
INSERT INTO Veterinarians(vid, vName)
VALUES(1003, 'Shara');
INSERT INTO Veterinarians(vid, vName)
VALUES(1004, 'Victor');
INSERT INTO Veterinarians(vid, vName)
VALUES(1005, 'Lora');
-----------------------------------------
--Grant permission to cs411233--
--1.Grant SELECT on Veterinarians table--
GRANT SELECT ON Veterinarians TO cs411233;
--2.Grant REFERENCES on Veterinarians table--
GRANT REFERENCES(vid) ON Veterinarians TO cs411233;
--3.Grant INSERT on Veterinarians table--
GRANT INSERT ON Veterinarians TO cs411233;
----------------------------------------------
--Testing--
--1.Find the person who between 40 and 50 by join Veterinarians with AGE table from cs411246--
SELECT vName, vAge
FROM Veterinarians, cs411233.AGE
WHERE vAge BETWEEN 40 AND 50; 
--2.Insert new values to AGE table in cs411233--
INSERT INTO cs411233.AGE(vid, vAge) VALUES (1006, 52);
--3.Update new values to AGE table in cs411233--
UPDATE cs411233.AGE SET vAge = '59' WHERE vid = 1006;

----------------------------------------------
---CS411233---
----------------------------------------------
--Create AGE table that references to Veterinarians table from cs411246--
CREATE TABLE Age(
    vid int,
    vAge int,
    PRIMARY KEY(vid),
    FOREIGN KEY(vid) REFERENCES cs411246.Veterinarians
);
-------------------------------------------
INSERT INTO AGE(vid, vAge) VALUES(1001, 40);
INSERT INTO AGE(vid, vAge) VALUES(1002, 45);
INSERT INTO AGE(vid, vAge) VALUES(1003, 39);
INSERT INTO AGE(vid, vAge) VALUES(1004, 60);
INSERT INTO AGE(vid, vAge) VALUES(1005, 51);
----------------------------------------------
--Create View from table Veterinarians in cs411246---
CREATE OR REPLACE VIEW Vet_View
AS SELECT vid, vName
FROM cs411246.Veterinarians;
----------------------------------------------
---Grant permission to cs411247---
--1.Grant permission to insert and update VIEW(Vet_View)--
GRANT SELECT, INSERT, UPDATE ON Vet_Vew TO cs411247;
--1.Grant all permission on table AGE--
GRANT ALL ON AGE TO cs411247 WITH GRANT OPTION;
----------------------------------------------
--Testing--
--1.Find the person name Lora and age by join AGE table with Veterinarians table from cs411246--
SELECT vName, vAge
FROM cs411246.Veterinarians, AGE
WHERE Verterinarians.vid = AGE.vid
AND vName = 'Lora';
--2.Insert new values into Veterinarians table in cs411246--
INSERT INTO cs411246.Veterinarians(vid, vName) VALUES (1007, 'Catherin');

----------------------------------------------
---CS411247---
----------------------------------------------
--Grant permission to cs411246--
GRANT SELECT, INSERT, UPDATE ON AGE.cs411233 TO cs411246;
----------------------------------------------
--Testing--
--1.Insert new values into VIEW (Vet_View table) from cs411233--
INSERT INTO cs411233.Vet_View(vid, vName) VALUES (1006, 'Terisa');
--2.Update a name from VIEW (Vet_View table) in cs411233--
UPDATE cs411233.Vet_View SET vName = 'David.J' WHERE vid = 1001;

--Display result (1 and 2)--
SELECT *
FROM cs411233.Vet_View;
