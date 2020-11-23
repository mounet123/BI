create Table Film 
(
	Idfilm int  not null identity ,
	IDrealisateur int not null,
	Titre varchar(50),
	genre varchar(10),
	annee int
) ;

insert into Film (IDrealisateur ,Titre, genre, annee)
values 
	   
	   (13,'crush','drame',1996),
	   (15,'faux-semblants','epouvante',1988),
	   (14,'pulp fiction','policier',1994),
	   (13,'breaking the wave','drame',1996),
	   (13,'dogville','drame',2002),
	   (12,'alamo','western',1960),
	   (18,'dangeresement vôtre','espionnage',1985),
	   (19,'chasseur blanc,coeur noir','drame',1989),
	   (21,'american beaty','drame',1999),
	   (21,'american beaty','drame',1999)
	   
	   
	select * from film
order by idfilm;   


delete from film
where Idfilm = 9 ;




UPDATE  film
SET annee = 1996
where idfilm = 1 ;


select * from film where genre ='drame' or genre= 'policier' ;


delete from film
where annee < 1995 ;


drop table Film;

source script.sql



create Table personne 
(
	IdPersonne int  not null identity ,
	nom varchar(50),
	perenom varchar(10),
) ;
drop table personne

insert into personne (nom,perenom)
values
( 'Kidman', 'Nicole'),
('Bettany', 'Paul'),
( 'Watson', 'Emily'),
('Skarsgard', 'Stellan'),
('Travolta', 'John'),
('L. Jackson', 'Samuel'),
('Willis', 'Bruce'),
('Irons', 'Jeremy'),
('Spader', 'James'),
('Hunter', 'Holly'),
('Arquette', 'Rosanna'),
('Wayne', 'John'),
('Von Trier', 'Lars'),
('Tarantino', 'Quentin'),
('Cronenberg', 'David'),
('Mazursky', 'Paul'),
('Jones', 'Grace'),
('Glen', 'John'),
('Eastwood', 'Clint'),
('Spacey', 'Kevin'),
('Mendes', 'Sam'),
('Jolie', 'Angelina');

select * from personne ;
