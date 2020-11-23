/*création de la BD Banque*/ 
CREATE DATABASE Banque;

/*création des tables*/ 
CREATE TABLE AGENCE (
Num_Agence INT NOT NULL,
Nom VARCHAR(50),
Ville VARCHAR(50), 
Actif INT NOT NULL

CONSTRAINT PK_AGENCE PRIMARY KEY (Num_Agence)

);

/* insertion des données de la table AGENCE*/
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('1','Agence1','paris',2000); 
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('2','Agence2','Paris- Etoile',2025);
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('3','Paris-Bastille','La Rochelle',4158);
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('4','Agence4','Orsay',4158); 
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('5','Agence5','nancy',2552); 
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('6','Agence6','Orsay',3052); 
INSERT INTO AGENCE (Num_Agence, Nom, Ville, Actif) VALUES ('7','Agence7','Paris- Rambuteau',3052);

SELECT*
FROM AGENCE;









CREATE TABLE CLIENT (
Num_Client INT NOT NULL,
 Nom VARCHAR(50),
Ville VARCHAR(50)

CONSTRAINT PK_CLIENT PRIMARY KEY (Num_Client)
);

/* insertion des données de la table CLIENT*/
INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('1','Céline Grignon','toulouse');
 INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('2','Dupont','paris');
INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('3','Moore Lavoie','paris'); 
INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('4','Claude','grenoble'); 
INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('5','Adélaïde Dupont','dijon');
INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('6','Jacquenett Plouffe','marseille'); 
INSERT INTO CLIENT (Num_Client, Nom, Ville) VALUES ('7','Éléonore Levasseur','le havre');

SELECT*
FROM CLIENT;
 
 



CREATE TABLE COMPTE (
Num_Compte INT NOT NULL, 
Num_Agence INT NOT NULL,
Num_Client INT NOT NULL, 
Solde INT
 
 
CONSTRAINT PK_COMPTE PRIMARY KEY (Num_Compte),
CONSTRAINT FK_AGENCE FOREIGN KEY (Num_Agence) REFERENCES AGENCE(Num_Agence),

CONSTRAINT FK_CLIENT FOREIGN KEY (Num_Client) REFERENCES CLIENT(Num_Client)
 
);

/* insertion des données de la table COMPTE*/
INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (1,2,4,22567); 
INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (2,3,4,5864); 
INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (3,1,5,84565);
INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (4,2,1,6212);
INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (5,3,2,56582); 
  INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (6,4,3,15623);
   INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (7,4,3,3185);
    INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (8,1,2,96221); 
	INSERT INTO COMPTE (Num_Compte,Num_Agence,Num_Client, Solde) VALUES (9,3,2,null);

SELECT*
FROM COMPTE;

CREATE TABLE EMPRUNT (
Num_Emprunt INT NOT NULL, 
Num_Agence INT NOT NULL, 
Num_Client INT NOT NULL, 
Montant INT NOT NULL
CONSTRAINT PK_EMPRUNT PRIMARY KEY (Num_Emprunt),
CONSTRAINT FK_EMPRUNT_AGENCE FOREIGN KEY (Num_Agence) REFERENCES AGENCE(Num_Agence),
CONSTRAINT FK_EMPRUNT_CLIENT FOREIGN KEY (Num_Client) REFERENCES CLIENT(Num_Client)
 
);

/* insertion des données de la table EMPRUNT*/
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (1,2,5,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (2,2,5,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (3,1,1,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (4,4,2,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (5,4,1,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (6,4,3,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (7,3,4,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (8,7,3,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (9,7,4,85624); 
INSERT INTO EMPRUNT (Num_Emprunt, Num_Agence, Num_Client, Montant) VALUES (10,7,2,85624);

SELECT*
FROM EMPRUNT;












-- Q1 Liste des agences ayant des comptes-clients 
SELECT DISTINCT Nom
FROM AGENCE
INNER JOIN COMPTE ON AGENCE.Num_Agence = COMPTE.Num_Agence
WHERE COMPTE.Num_AGENCE in (
SELECT Num_Agence FROM AGENCE
);

-- Q2 Clients ayant un compte à La Rochelle

SELECT DISTINCT CLIENT.Nom FROM COMPTE
INNER JOIN AGENCE ON AGENCE.Num_Agence = COMPTE.Num_Agence 
INNER JOIN CLIENT ON COMPTE.Num_Client = CLIENT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle';

-- Q3 Clients ayant un compte ou un emprunt à La Rochelle 
(SELECT DISTINCT CLIENT.Nom
FROM COMPTE
INNER JOIN AGENCE ON AGENCE.Num_Agence = COMPTE.Num_Agence 
INNER JOIN CLIENT ON COMPTE.Num_Client = CLIENT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle')
UNION all
(SELECT DISTINCT CLIENT.Nom FROM EMPRUNT
INNER JOIN AGENCE ON AGENCE.Num_Agence = EMPRUNT.Num_Agence 
INNER JOIN CLIENT ON CLIENT.Num_Client = EMPRUNT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle')

-- Q4 Clients ayant un compte et un emprunt à La Rochelle 
(SELECT DISTINCT CLIENT.Nom
FROM COMPTE
INNER JOIN AGENCE ON AGENCE.Num_Agence = COMPTE.Num_Agence 
INNER JOIN CLIENT ON COMPTE.Num_Client = CLIENT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle')
INTERSECT
(SELECT DISTINCT CLIENT.Nom FROM EMPRUNT
INNER JOIN AGENCE ON AGENCE.Num_Agence = EMPRUNT.Num_Agence 
INNER JOIN CLIENT ON CLIENT.Num_Client = EMPRUNT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle');

-- Q5 Clients ayant un compte et pas d’emprunt à La Rochelle 
(SELECT DISTINCT CLIENT.Nom
FROM COMPTE
INNER JOIN AGENCE ON AGENCE.Num_Agence = COMPTE.Num_Agence 
INNER JOIN CLIENT ON COMPTE.Num_Client = CLIENT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle')
EXCEPT
(SELECT DISTINCT CLIENT.Nom 
FROM EMPRUNT
INNER JOIN AGENCE ON AGENCE.Num_Agence = EMPRUNT.Num_Agence 
INNER JOIN CLIENT ON CLIENT.Num_Client = EMPRUNT.Num_Client 
WHERE AGENCE.Ville = 'La Rochelle');

-- Q6 Clients ayant un compte et nom de la ville où ils habitent
SELECT DISTINCT COMPTE.Num_Client, CLIENT.Nom, CLIENT.Ville  
FROM COMPTE
INNER JOIN CLIENT ON CLIENT.Num_Client = COMPTE.Num_Client;

-- Q7 Clients ayant un compte à Paris-Etoile et nom de la ville où ils habitent 
SELECT cl.Nom, cl.Ville
FROM COMPTE co
INNER JOIN CLIENT cl ON cl.Num_Client = co. Num_Client 
INNER JOIN AGENCE ag ON ag.Num_Agence = co.Num_Agence 
WHERE ag.Nom = 'Paris-Etoile';
 
-- Q8 les Clients ayant un compte dans une agence où Claude a un compte
SELECT Nom
FROM CLIENT
WHERE Num_Client in (
					SELECT Num_Client 
					FROM COMPTE
					WHERE Num_Agence in (SELECT Num_Agence 
										FROM CLIENT cl, COMPTE co
										WHERE cl.Num_Client = Co.Num_Client and Nom = 'Claude'));


-- Q9 les Agences ayant un actif moin élevé que toute agence d'Orsay 
SELECT Nom , Actif
FROM AGENCE
WHERE Actif < all (	SELECT Actif	
					FROM AGENCE
					WHERE Ville = 'Orsay');


-- Q10 Clients ayant un compte dans chaque agence d'Orsay 
SELECT DISTINCT cl.Nom ,ag.Ville
FROM CLIENT cl 
JOIN COMPTE co ON co.Num_Client = cl.Num_Client
JOIN AGENCE Ag ON co.Num_Agence = ag.Num_Agence
WHERE ag.Ville = 'Orsay';



-- Q11 les Clients ayant un compte dans au-moins une agence d'Orsay 
SELECT DISTINCT Cl.Nom , 
FROM CLIENT cl, COMPTE co, AGENCE ag 
WHERE cl.Num_Client = co.Num_Client AND co.Num_Agence = Ag.Num_Agence AND Ag.Ville = 'Orsay';


-- Q12 le nom des Emprunteurs de l'agence Paris  classés par ordre alphabétique 

SELECT distinct cl.Nom
FROM CLIENT cl 
JOIN EMPRUNT em ON em.Num_Client=cl.Num_Client
JOIN AGENCE Ag ON em.Num_Agence = ag.Num_Agence
where ag.Ville like'%Paris%'
order by cl.Nom
-- Q14 Solde moyen des comptes-clients des agences dont le solde moyen est > 10 000 
SELECT Nom, AVG(Solde)
FROM COMPTE co
INNER JOIN AGENCE  ag ON Ag.Num_Agence = CO.Num_Agence 
GROUP BY Nom
HAVING AVG(Solde) > 10000;

-- Q15Nombre de clients habitant Paris 
SELECT COUNT(Num_Client)
FROM CLIENT
WHERE Ville = 'Paris';
 
-- Q16Nombre de clients de l'agence “Paris-Bastille” n'ayant pas leur adresse dans la relation CLIENT

SELECT COUNT(Num_Client) 
FROM CLIENT
WHERE Ville = NULL AND Num_Client IN 
(select cl.Num_Client
from CLIENT cl
left join COMPTE co on cl.Num_Client= co.Num_Client
left join AGENCE ag on ag.Num_Agence=co.Num_Agence
WHERE ag.Nom = 'Paris-Bastille')


-- Q17 Diminuer l'emprunt de tous les clients habitant Marseille de 5% 
UPDATE EMPRUNT SET Montant = Montant*0.95
WHERE Num_Client IN (
SELECT Num_Client FROM CLIENT
WHERE Ville = 'Marseille'
);

-- Q18 Fermer les comptes de Dupont 
DELETE FROM COMPTE
WHERE Num_Client in (
		SELECT Num_Client 
		FROM CLIENT
		WHERE Nom = 'Dupont'
					);

-- Q19 Supprimer de la relation AGENCE toutes les agences sans client 
begin try
	begin transaction 
	delete from EMPRUNT 
	where Num_Agence in (
		select ag.Num_Agence FROM AGENCE ag
		WHERE Num_Agence NOT IN (
						SELECT distinct ag.Num_Agence 
						FROM COMPTE co
						INNER JOIN AGENCE ag on co.Num_Agence = ag.Num_Agence  )
					);

	DELETE FROM AGENCE
	WHERE Num_Agence NOT IN (
						SELECT distinct ag.Num_Agence 
						FROM COMPTE co
						INNER JOIN AGENCE ag on co.Num_Agence = ag.Num_Agence  )
					
commit transaction
end try

BEGIN CATCH  
    select ERROR_MESSAGE()
	select ERROR_NUMBER()
	 rollback transaction 
END CATCH  


