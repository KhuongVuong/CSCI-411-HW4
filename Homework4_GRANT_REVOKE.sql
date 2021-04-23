---GRANT PART---
---CS411233---
--Grant permission to cs411233--
--1.Grant Select and Insert--
GRANT SELECT, INSERT, DELETE ON Veterinarians TO cs411247;
--2.Grant References(vid)--
GRANT REFERENCES(vid) ON Veterinarians TO cs411247;
----------------------------------------------
--Testing--
--1.Insert into VIEW(View_Age) new values--
INSERT INTO cs411247.View_Age(vid, vName) VALUES(1006, 41);
INSERT INTO cs411247.View_Age(vid, vName) VALUES(1007, 49);
--2.Update VIEW(View_Age) with new values--
UPDATE cs411247.View_Age SET vAge = 51 WHERE vid = 1006;
UPDATE cs411247.View_Age SET vAge = 47 WHERE vid = 1001;
--3.Find person name of the person from vid = 1003--
SELECT vid, vName
FROM Veterinarians, cs411247.View_Age
WHERE Veterinarians.vid = cs411247.View_Age.vid
AND vid = 1003;
----------------------------------------------
---CS411247---
----------------------------------------------
--Create AGE table that references to Veterinarians table--
CREATE TABLE AGE(
    vid int,
    vAge int,
    PRIMARY KEY(vid),
    FOREIGN KEY(vid) REFERENCES cs411233.Veterinarians
);
-------------------------------------------
INSERT INTO AGE(vid, vAge) VALUES(1001, 40);
INSERT INTO AGE(vid, vAge) VALUES(1002, 45);
INSERT INTO AGE(vid, vAge) VALUES(1003, 39);
INSERT INTO AGE(vid, vAge) VALUES(1004, 60);
INSERT INTO AGE(vid, vAge) VALUES(1005, 51);
----------------------------------------------
--Create View from table cs411246---
CREATE OR REPLACE VIEW Age_View
AS SELECT vid, vAge
FROM Age;
----------------------------------------------
--Grant permission to cs411233--
--1.Grant Select, Insert, Update--
GRANT SELECT, INSERT, UPDATE ON Age_View TO cs411233;
----------------------------------------------
--Testing--
--1.Insert into Veterinarians new values--
INSERT INTO cs411233.Veterinarians(vid, vName) VALUES(1006, 'Lora');
INSERT INTO cs411233.Veterinarians(vid, vName) VALUES(1007, 'Terisa');
--2.Delete values from Veterinarians--
DELETE FROM cs411233.Veterinarians WHERE vid = '1001';
DELETE FROM cs411233.Veterinarians WHERE vid = '1006';
--3.Find person that between 40 and 50 by join Age talbe in cs411247 with Veterinarians table in cs411233--
SELECT vName, vAge
FROM cs411233.Veterinarians, Age
WHERE cs411233.veterinarians.vid = Age.vid
AND Age BETWEEN 40 AND 50;
----------------------------------------------
---REVOKE PART---
--CS411233--
--Revoke permission from cs411247--
REVOKE INSERT, DELETE ON Veterinarians FROM cs411247;
--Testing--
--1.Insert into Veterinarians new values--
INSERT INTO cs411233.Veterinarians(vid, vName) VALUES(1008, 'Lora.J');
INSERT INTO cs411233.Veterinarians(vid, vName) VALUES(1009, 'Terisa.V');
--2.Delete values from Veterinarians--
DELETE FROM cs411233.Veterinarians WHERE vid = '1003';
DELETE FROM cs411233.Veterinarians WHERE vid = '1002';
----------------------------------------------
--CS411247--
--Revoke permission from cs4112333
REVOKE UPDATE ON View_Age FROM cs411233;
--Testing--
--1.Update VIEW(View_Age) with new values--
UPDATE cs411247.View_Age SET vAge = 55 WHERE vid = 1003;
UPDATE cs411247.View_Age SET vAge = 40 WHERE vid = 1005;
