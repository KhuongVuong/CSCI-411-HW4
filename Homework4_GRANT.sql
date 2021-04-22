---CS411246---
----------------------------------------------
--Grant permission to cs411233--
GRANT SELECT ON Veterinarians TO cs411233;
GRANT REFERENCES(vid) ON Veterinarians TO cs411233;
----------------------------------------------
--Testing--
--1.Find the person who between 40 and 50--
SELECT vName, vAge
FROM Veterinarians, AGE.cs411233
WHERE vAge BETWEEN 40 AND 50; 
----------------------------------------------
---CS411233---
----------------------------------------------
--Create AGE table that references to Veterinarians table--
CREATE TABLE AGE(
    vid int,
    vAge int,
    PRIMARY KEY(vid),
    FOREIGN KEY(vid) REFERENCES Veterinarians.cs411246
);
-------------------------------------------
INSERT INTO AGE(vid, vAge) VALUES(1001, 40);
INSERT INTO AGE(vid, vAge) VALUES(1002, 45);
INSERT INTO AGE(vid, vAge) VALUES(1003, 39);
INSERT INTO AGE(vid, vAge) VALUES(1004, 60);
INSERT INTO AGE(vid, vAge) VALUES(1005, 51);
----------------------------------------------
--Create View from table cs411246---
CREATE OR REPLACE VIEW Vet_View
AS SELECT vid, vName
FROM Veterinarians.cs411246;
----------------------------------------------
---Grant permission to cs411247---
GRANT ALL ON AGE TO cs411247 WITH GRANT OPTION;
----------------------------------------------
--Testing--
--1.Find the person name Lora--
SELECT vName, vAge
FROM Veterinarians.cs411246, AGE
WHERE Verterinarians.vid = AGE.vid
AND vName = 'Lora';
----------------------------------------------
---CS411247---
----------------------------------------------
--Grant permission to cs411246--
GRANT SELECT, INSERT, UPDATE ON AGE.cs411233 TO cs411246;
----------------------------------------------
--Testing--
--1.Insert new values into VIEW (Vet_View table) from cs411233--
INSERT INTO Vet_View.cs411233 VALUES (1006, 'Terisa');
--2.Update a name from VIEW (Vet_View table) in cs411233--
UPDATE Vet_View.cs411233 SET vName = 'David.J' WHERE vid = 1001;

--Display result (1 and 2)--
SELECT *
FROM Vet_View.cs411233;
