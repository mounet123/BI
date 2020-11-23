-----------------creation de table --------------

create table Pilote (
NumP int primary key not null,
NomP varchar(30) ,
Adresse varchar(50),
Salaire int );

create table Avion (
NumAv int primary key Not null,
NomAv varchar(30),
capacite int,
localisation varchar(30));

create table vol ( 
NumV int primary key not null,
NumP Int not null,
NumAv int not null,
Dep_T varchar(30),
Arr_T varchar(30),
Dep_H int ,
Arr_H int,
FOREIGN KEY( NumP ) REFERENCES  Pilote (NumP),
foreign key (NumAv) references Avion ( NumAv)
);
-------------------insertion de données dans les table------------------------

insert into avion (numav,nomav,capacite,localisation)
values (14,'boing250',250,'nice')
insert into avion (numav,nomav,capacite,localisation)
values (15,'airbus120',120,'marseille')
insert into avion (numav,nomav,capacite,localisation)
values ( 16, 'missil',50,'toulouse')
insert into avion (numav,nomav,capacite,localisation)
values (17,'A380',380,'paris')
insert into avion (numav,nomav,capacite,localisation)
values ( 18,'rafale',10,'nice')

insert into Pilote(numP,nomp,adresse,salaire)
values (1,'yasmine','lyon',15000)
insert into Pilote(numP,nomp,adresse,salaire)
values(2,'samir','toulouse',17000)
insert into Pilote(numP,nomp,adresse,salaire)
values(3,'meriama','nice',13000)
insert into Pilote(numP,nomp,adresse,salaire)
values(4,'faycel','marseille',20000)
insert into Pilote(numP,nomp,adresse,salaire)
values(5,'idir','paris',18000)
insert into Pilote(numP,nomp,adresse,salaire)
values(6,'nadia','paris',14000) 

insert into vol(numv,nump,numav,dep_t,arr_t,dep_h,arr_h)
values (4,1,15,'nice','toulous',18,19)
insert into vol(numv,nump,numav,dep_t,arr_t,dep_h,arr_h)
values (5,2,14,'lyon','paris',14,15)
insert into vol(numv,nump,numav,dep_t,arr_t,dep_h,arr_h)
values (7,3,17,'paris','marseille',9,11)
insert into vol(numv,nump,numav,dep_t,arr_t,dep_h,arr_h)
values (8,4,18,'lille','nice',10,13)
insert into vol(numv,nump,numav,dep_t,arr_t,dep_h,arr_h)
values (10,5,16,'toulous','marseille',7,8)
insert into vol(numv,nump,numav,dep_t,arr_t,dep_h,arr_h)
values (12,6,17,'nice','paris', 15,17)
----------------capacite d'avion superieur a 200--------------------
select *
from avion 
where capacite >200
-----------------les avion localisé a nice-----------
select *
from avion 
where localisation = 'nice'

-----------------afficher la table pilote---------------
select*
from pilote

-----------------numero de pilotte /heur et lieu de depart de leur vol---------
select pilote.Nump, vol.dep_h, vol.dep_t
from pilote
inner join vol on vol.nump =pilote.NumP
--------------le nom ,salaire et adresse des pilote qui touche plus de 15000----
select nomP,Salaire,Adresse
from pilote
where salaire > 15000 and adresse ='paris'
-----------nom et num d'avion qui ont une capacité moin de 350-----------------------------------------
select NumAv, nomAv
from avion
where localisation ='nice' and capacite < 350 
-------------------les vol de nice a pars apres 14h-----------------
select *
from vol
where dep_t ='nice' and arr_t = 'paris' and dep_h >14 

----------les pilote qui nont pas de vol----------------------------------
select *
from pilote 
inner join vol on vol.nump= pilote.nump
where vol.nump is null
-------------num et ville de depart des piloteID entre 4 et 10 -----------------
select numv, dep_t
from vol
where nump between 4 and 10

------------les pilote et leur vol ---------------------------------------------
select *
from pilote P
inner join vol V on p.nump= v.nump

-----------------------------------------------------------------
