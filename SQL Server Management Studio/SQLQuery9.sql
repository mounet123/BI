
CREATE DATABASE Gavasoft;

CREATE TABLE Dept
(
	NumD INT NOT NULL,
	NomD VARCHAR(10),
	Lieu VARCHAR(10),

	CONSTRAINT PK_Dept primary key (NumD)
);
select * from Dept 


INSERT INTO Dept (NumD, NomD, Lieu) 
VALUES (1,'Droit','Créteil'), (2,'Commerce','Boston');

CREATE TABLE Emp
(
	NumE INT NOT NULL,
	NomE VARCHAR(20),
	Fonction VARCHAR(20),
	NumS INT,
	Embauche DATE,
	Salaire INT NOT NULL,
	Comm INT,
	NumD INT,

	CONSTRAINT PK_Emp primary key (NumE),
	--CONSTRAINT FK_Dept FOREIGN KEY (NumD) REFERENCES Dept(NumD)
);
select * from Emp

INSERT INTO Emp 
VALUES
	(1, 'Grava', 'Président', NULL, '10-10-1979', 10000, NULL, NULL),
	(2, 'Guimezanes', 'Doyen', 1, '01-10-2006', 5000, NULL, 1),
	(3, 'Toto', 'Stagiare', 1, '01-10-2006', 0, NULL, 1),
	(4, 'Al-Capone', 'Commercial', 2, '01-10-2006', 5000, 100, 2),
	(5, 'Patrick', 'Commercial', 3, '03-11-2006', 6000, 200, 1);
SELECT* FROM Emp;


SELECT NomE, Comm  
FROM Emp 
WHERE Comm IS NOT NULL 
ORDER BY Comm
DESC;  -- inverser l'ordre du tri

SELECT NomE, Embauche
FROM Emp 
WHERE Embauche > '01-09-2006';

SELECT NomE, Lieu
FROM Emp, Dept
WHERE Emp.NumD = Dept.NumD AND Lieu = 'Créteil';

SELECT NomE, Lieu
FROM Emp
INNER JOIN Dept ON Emp.NumD = Dept.NumD
WHERE Lieu = 'Créteil';

SELECT NomE, Salaire 
FROM Emp
WHERE Salaire > 5000;


SELECT AVG(Salaire) 
FROM Emp;

SELECT COUNT(Comm)
FROM Emp 
WHERE Comm IS NOT NULL;

SELECT *
FROM Emp WHERE Salaire > (SELECT AVG(Salaire) 
FROM Emp);

select* --ContactNom , NomSociete
from Client
 order by  ContactNom DESC, NomSociete ASC
 



ALTER TABLE client 



EXEC sp_rename 'client.issmi', 'ContactNom', 'COLUMN';  