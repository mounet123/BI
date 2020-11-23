
CREATE DATABASE médiathèque;

CREATE TABLE Disque  
(
	CodeOuv INT NOT NULL,
	Titre VARCHAR(20),
	Style VARCHAR(20),
	Pays VARCHAR(20),
	Annee INT NOT NULL,
	Producteur VARCHAR(20) 


	CONSTRAINT PK_Disque primary key (CodeOuv)
);

select * from Disque ;

