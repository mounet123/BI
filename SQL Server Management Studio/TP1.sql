








CREATE TABLE Editeur
(
	IdEditeur INT NOT NULL identity,
	Nom VARCHAR (30),
	Telephone VARCHAR(15),
	Pays VARCHAR(30),
	
	CONSTRAINT PK_Editeur primary key (IdEditeur)
);

CREATE TABLE MotCles
(
	IdMot VARCHAR(50) NOT NULL ,
	Mot VARCHAR (50),
	Descriptif VARCHAR(30),
	
	CONSTRAINT PK_MotCles primary key (IdMot)
);
 
 CREATE TABLE Ouvrage
(
	IdOuvrage INT NOT NULL identity ,
	Titre VARCHAR (30),
	IdEditeur INT NOT NULL,
	Annee INT ,
	
	CONSTRAINT PK_Ouvrage primary key (IdOuvrage),
	CONSTRAINT FK_Editeur FOREIGN KEY (IdEditeur) REFERENCES Editeur(IdEditeur)

);


CREATE TABLE Organisme
(
	IdOrganisme INT NOT NULL identity ,
	Nom VARCHAR (50),
	Telphone_Oranisateur VARCHAR(50),
	Pays_Organisateur VARCHAR(50),
	
	CONSTRAINT PK_Organisme primary key (IdOrganisme), -- declarer une clé primaire

);

CREATE TABLE Auteur
(
	IdAuteur INT NOT NULL identity ,
	NomAuteur VARCHAR (50),
	Email VARCHAR(50),
	SiteWeb VARCHAR(50),
	
	CONSTRAINT PK_Auteur primary key (IdAuteur),

);

CREATE TABLE Revue 
(
	IdRevue INT NOT NULL identity ,
	Nom_Revue VARCHAR (50),
	IdEditeur INT NOT NULL ,
	Annee_creation INT,
	
	primary key (IdRevue),
	foreign key (IdEditeur) REFERENCES Editeur(IdEditeur)
	
);




create database bibliothèque ;
 
 CREATE TABLE Article
(
	IdArticle INT NOT NULL,
	IdRevue INT NOT NULL,
	Titre VARCHAR(20),
	PageDebut INT,
	PageFin INT,
	Volume INT,
	Serie VARCHAR(50),
	
	primary key (IdArticle),
	foreign key (IdRevue) REFERENCES Revue(IdRevue)
);

CREATE TABLE Article_Auteur 
(
	IdArticle INT NOT NULL,
	IdAuteur INT NOT NULL ,

foreign key (IdArticle) REFERENCES  Article(IdArticle),
foreign key (IdAuteur) REFERENCES  Auteur(IdAuteur)
);

CREATE TABLE Article_MotCles 
(
	IdArticle INT NOT NULL,
	IdMot VARCHAR(50) NOT NULL,
foreign key (IdArticle) REFERENCES  Article(IdArticle),
foreign key (IdMot) REFERENCES  MotCles(Idmot)

);

CREATE TABLE Auteur_Organisme 
(
	IdAuteur INT NOT NULL,
	IdOrganisme INT NOT NULL,
foreign key (IdOrganisme) REFERENCES  Organisme(IdOrganisme),
foreign key (IdAuteur) REFERENCES  Auteur(IdAuteur)
);


CREATE TABLE Ouvrage_Auteur 
(
	IdAuteur INT NOT NULL,
	IdOuvrage INT NOT NULL,

foreign key (IdOuvrage) REFERENCES  Ouvrage(IdOuvrage),
foreign key (IdAuteur) REFERENCES  Auteur(IdAuteur)
);


-----------------------------------insertion-----------------------------

insert into Auteur(NomAuteur,Email,SiteWeb)
values ('yasmine','yasmine-azouz@gmail.com','journalyasmine.com');

select* 
from Auteur

insert into Auteur(NomAuteur)
values ('mouloud mammeri');

select* 
from Auteur


delete from Auteur
where NomAuteur = 'mouloud mammeri'

select* 
from Editeur


insert into Editeur ( Nom,Telephone,Pays)
values ('meriame','0677551909','france'),
	('nadia','0612155236','espagne'),
	('Dyhia','0766805704','algerie'),
	('lynda','0670131504','france'),
	('samir','0612138004','italie'),
	('samir',NULL,NULL);

select* 
from Editeur
 
 select initcap(Nom)
from Editeur
SELECT idEditeur, initcap(nom) 
FROM Editeur



select nom from Editeur;

select distinct pays 
	from Editeur;


select *
from Article



insert into Article( IdArticle, idRevue,Titre,PageDebut,PageFin,Volume,Serie)
values (1,2,'le monde', 2,6,1,1),
	(2,2,'news locale', 1,1,2,1),
	(3,4,'paparatzi', 4,6,3,2),
	(4,3,'celebrite', 3,10,4,4),
	(5,1,'film', 6,12,3,5),
	(6,1,'sport', 5,18,5,3);


	select * from Revue;

insert into Revue(nom_Revue,idEditeur,Annee_Creation)
 values('le soleil',1,2002),
 ( 'prada',1,2010),
 ( 'people',4,2008),
 ( 'Deep',3,2002),
 ( 'planet',2,2014),
 ( 'planet',4,2011)


 select titre 
 from Article
 order by Titre;

 select* from ouvrage

 insert into ouvrage 
 values ( 'in die digitale bildverare',1 ,1994),( 'data structure and algorithme',2,1983)
 ('tous sur c++',3,1992),('sql facil',2,2006);

 select * 
 from Ouvrage
 where Annee > 1990 ;

 select *
 from Revue



 insert into Revue(Nom_Revue,IdEditeur,Annee_creation)
 values ('Computer Vision, Graphics, and Image Processing',1,1989),
		('Information Processing Letters', 2, 1979),
		('Transactions on Pattern intelligence', 1, 1965),
		('Pattern Recognition', 3, 1965),
		('Photogrammetric Engineering and Remote Sensing', 4, 1988),
		('Transactions on Systems, Man, and Cybernetics', 2, 1962),
		('Proc. of Geovision Applications in Geology', 3, 1984),
		('Physical Review', 2, 1985),
		('Multimedia Tools and Applications', 4, 1984);



	select *
	from Revue
	order by IdRevue
	where Nom_Revue like '%pattern%' ;


	select *
	from Auteur

INSERT INTO auteur
VALUES ('Abmayr W', 'Abmayr@cs.fhm.edu', 'www.informatik.fh/~abmayr/abmayre.htm'),
( 'Aho A', 'aho@cs.columbia.edu',  'www1.cs.columbia.edu/~aho/'),
('Hopcroft J', 'jeh@cs.cornell.edu', 'www.cs.cornell.edu/jeh/'),
( 'Ullman J', 'ullman@cs.stanford.edu', 'infolab.stanford.edu/~ullman/'),
( 'Akl S', 'akl@cs.queensu.ca', 'www.cs.queensu.ca/~akl/'),
( 'Adams R', null, null),
('Bischof L', 'Leanne.Bischof@csiro.au', 'www.cmis.csiro.au/leanne.bischof/ '),
('Toussaint G', 'godfried@cs.mcgill.ca', 'www-cgrl.cs.mcgill.ca/~godfried/'),
('Powley W', 'wendy@cs.queensu.ca', 'www.cs.queensu.ca/home/wendy/'),
('Amadasun M','amadasun@cs.stanford.edu', 'infolab.stanford.edu/~amadasun/'),
('King R','king@cs.stanford.edu', 'infolab.stanford.edu/~king/')



select NomAuteur,SiteWeb
from Auteur
where SiteWeb is not null



select *
from Article

INSERT INTO article (IdArticle,IdRevue,Titre,PageDebut,PageFin,Volume,Serie)
VALUES (7,4, 'graphs random', 121, 129, 64, 2), 
	( 8,3, 'refinements', 1481, 1491, 39, 8), 
	( 9,5, 'Seeded region', 641, 647, 16, 6),
	( 10,1, 'Radial decom', 325, 332, 55, 5),
	(11,6, 'convex algo', 219, 222, 7, 5),
	(16,21, 'A Middleware', 17, 19, 10, 2),
	(17,22, 'Low-level segm', 216, 218, 21, 1),
	(18,23,'Mental workload ', 20,40,1,1)

	select 
	count(idrevue)
	from revue



	select Titre , ( PageFin -PageDebut) as nombre_page
	from Article 

	
	select *
	from Revue
	select *
	from Editeur



INSERT INTO article_auteur(IdArticle,IdAuteur)
 VALUES(10, 9),
(7, 6),
(8, 1),
(6, 6),
(17, 14),
(17, 8),
(18, 7),
(16, 11),
(4, 10),
(5, 12),
(11, 5),
(3, 13),
(4, 9),
(1,7);

-- selectionner l identifiant de l article ecrit par 'Adams'
 ----------------------------------------------------------------------------
 select IdArticle
	from Article_Auteur
	where IdAuteur in  (select IdAuteur
	from Auteur
	where NomAuteur like '%ADams%' );
-----------------------------------------------------------------------------
SELECT IdArticle
FROM Article_Auteur aa
INNER JOIN (select IdAuteur
	from Auteur
	where NomAuteur like '%ADams%' ) a ON a.IdAuteur = aa.IdAuteur

 


 select Article.Titre ,Revue.Nom_Revue
 from Article
 join Revue  on Article.IdRevue=Revue.IdRevue
 

 


 INSERT INTO ouvrage_auteur VALUES (5,2),(9,3),(1,2),(4,4)

 select NomAuteur
from auteur
left join Ouvrage_Auteur on auteur.IdAuteur=Ouvrage_Auteur.IdAuteur
where IdOuvrage is null;


select NomAuteur from Auteur
where IdAuteur in(
select IdAuteur from Auteur
 except
 select IdAuteur from Ouvrage_Auteur);

 
INSERT INTO motcles VALUES (1, 'pattern recognition', null),
(2, 'segmentation', null),
(3, 'graph theory', null),
(4, 'image processing', null),
(5, 'hull', null),
(6, 'broadband Networks', null);

select *
from Article

INSERT INTO article_motcles VALUES (2, 1),
(17, 2),
(4, 4),
(17, 4),
(9, 5),
(10, 6),
(18, 3),
(8, 1),
(3, 2),
(5, 3),
(1, 4),
(11, 1),
(7, 4);

select * from Editeur 
select * from Article


select *
from Article
join  Revue on Article.IdRevue=Revue.IdRevue
where Nom_Revue ='deep'



INSERT INTO editeur VALUES ('Teubner', '611 7878-285','Germany'),
('Addison-Wesley', '415 402-2500', 'United States'),
( 'elsevier', '20 7611 4500', 'United Kingdom'),
( 'asprs', '01 8038 6860','United Kingdom'),
( 'ieee-smc', '202 371-0101','United States')

--------extract (year from la date systeme)

select Nom
from Editeur
join Ouvrage on Editeur.IdEditeur=Ouvrage.IdEditeur
--where year( select getdate 
where year () from getdate

/*
select *
from Article
join  Revue on Article.IdRevue=Revue.IdRevue
where Article.IdRevue is not null     */


SELECT DISTINCT E.nom
FROM Editeur E,Revue R, Ouvrage O
WHERE E.idEditeur = R.idEditeur AND E.idEditeur = O.idEditeur;



--------------15--------------------- selectionner les nom d articles et le nom de la revue publier dans la plus ancienne revus
  

select R.IdRevue as IDrevue  ,
min(R.annee_creation) as annee 
from revue  R
group by (r.IdRevue)
  


------------------Q15---------------------
SELECT TOP 1 A.titre, R.Nom_Revue, R.Annee_creation
FROM ARTICLE A, REVUE R
WHERE A.idRevue = R.idRevue
ORDER BY Annee_creation ASC;

------------------------------Q16-------------------------------
SELECT DISTINCT A1.nomAuteur,A2.nomAuteur
FROM AUTEUR A1, AUTEUR A2, ARTICLE_AUTEUR AA, ARTICLE AR
WHERE A1.idAuteur = AA.idAuteur AND AA.idArticle = AR.idArticle
AND A1.idAuteur > A2.idAuteur
GROUP BY A1.nomAuteur,A2.nomAuteur
HAVING COUNT(AR.idArticle) = 2 


-------------------------------------------------------
SELECT distinct ARTICLE_AUTEUR1.idAuteur,ARTICLE_AUTEUR2.idAuteur,ARTICLE_AUTEUR1.idArticle 
                          FROM ARTICLE_AUTEUR as ARTICLE_AUTEUR1
                          join ARTICLE_AUTEUR as ARTICLE_AUTEUR2
						  on ARTICLE_AUTEUR1.idauteur<>ARTICLE_AUTEUR2.idauteur 
						  and ARTICLE_AUTEUR1.idarticle=ARTICLE_AUTEUR2.idarticle
						  where ARTICLE_AUTEUR1.idauteur<ARTICLE_AUTEUR2.idauteur
						 ;
---------------------------------Q17----------------------------

select NomAuteur , count(ouvrage.idouvrage) nombre_ouvrage 
from Ouvrage ,Auteur
group by (auteur.NomAuteur)

---------------------------------Q18-----------------------------m

select a.NomAuteur ,COUNT(o.IdOrganisme) nombre_organisme
from Auteur A ,Organisme O
join Auteur_Organisme OA on OA.IdOrganisme=o.IdOrganisme
group by (a.NomAuteur)

------------------------18---------------g
SELECT A.idAuteur, A.nomAuteur, COUNT(AO.idOrganisme) NbreOrganisme	
FROM AUTEUR A, AUTEUR_ORGANISME AO
WHERE A.idAuteur = AO.idAuteur
GROUP BY A.idAuteur, A.nomAuteur;
--------------------18--------------------f
SELECT AUTEUR_ORGANISME.idAuteur,COUNT(DISTINCT idOrganisme),nomAuteur
FROM AUTEUR_ORGANISME
JOIN AUTEUR ON AUTEUR.idAuteur=AUTEUR_ORGANISME.idAuteur
GROUP BY AUTEUR_ORGANISME.idAuteur,nomAuteur
ORDER BY AUTEUR_ORGANISME.idAuteur

----------------------------------20------------------------


	SELECT DAY (GETDATE()) Jour, MONTH (GETDATE()) Mois, YEAR (GETDATE()) Année;
----------------------------------21--------------------------

select titre from Article
union
select Titre from Ouvrage

------------------22--------------------------------------
select coalesce(r.nom_revue, 'pas de revue') Nom_Revue , r.IdEditeur , e.Nom  
from Revue R
right join Editeur E on r.IdEditeur=e.IdEditeur

---------------23--------------------------------------
select distinct au.NomAuteur,aa.IdArticle,oa.IdOuvrage
from Auteur Au 
join Article_Auteur AA on au.IdAuteur=AA.IdAuteur 
join Ouvrage_Auteur OA on OA.IdAuteur=Au.IdAuteur

-----------------24--------------------------------------

select R1.Nom_Revue, R2.Nom_Revue
from Revue R1
join Revue R2 on R1.IdRevue<>R2.IdRevue 
where R1.IdEditeur =R2.IdEditeur and R2.Annee_creation=R1.Annee_creation

--------------25-----------------------------------------------
insert into revue
values( 'l''infrmatique facile',8,1996)

select *
from Revue
where Annee_creation  > any (select r.Annee_creation
                             from Revue R
                             join Editeur E on E.IdEditeur=r.IdEditeur
                             where e.Nom = 'Addison-Wesley')

--------------------26---------------------------------------------
select *
from Revue
where Annee_creation  > all (select r.Annee_creation
                             from Revue R
                             join Editeur E on E.IdEditeur=r.IdEditeur
                             where e.Nom = 'Addison-Wesley')

------------------27-------------------------------------------------


select IdArticle,( select NomAuteur from Auteur )
from Article
group by 




