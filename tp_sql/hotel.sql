 CREATE TABLE chambre  (
	 Num_Chambre 	INT PRIMARY KEY NOT NULL,
      prix int,
      Nbr_Lit int ,
      Nbr_Pers int,
      confort	VARCHAR(30),
      equ  varchar(30)
   );
   select * from chambre;
   
   
   create table client1 (
   id_Client int primary key not null ,
   nom varchar(30),
   prenom varchar(30),
   adresse varchar(50));
   
   select * from client1;
   
 CREATE TABLE  Reservation  (
	 id_Client 	INT NOT NULL,
	 Num_Chambre 	INT NOT NULL,
   Date_ARV date,
   Date_DEP date,
   
	FOREIGN KEY( id_Client ) REFERENCES  Client1 (id_Client),
	FOREIGN KEY( Num_chambre ) REFERENCES  Chambre (Num_chambre)
);
select * from reservation;

insert into chambre (num_chambre,prix,nbr_lit,nbr_pers,confort,equ)
values (10,80,01,02,'wc','non');

insert into chambre (num_chambre,prix,nbr_lit,nbr_pers,confort,equ)
values (20,100,02,02,'douche','non');

insert into chambre (num_chambre,prix,nbr_lit,nbr_pers,confort,equ)
values (25,180,03,03,'bain','TV');
-------------------------------------------------------------------
select *
from client1
-------------------------------------------------------------------
insert into client1 ( id_client,nom,prenom,adresse)
values (1000,'yasmine','azouz','marseille');

insert into client1 ( id_client,nom,prenom,adresse)
values(1001,'lyes','founas','paris');

insert into client1 ( id_client,nom,prenom,adresse)
values(1002,'asma','berkani','lyon');
--------------------------------------------------------------------
select * from chambre;
select * from reservation
--------------------------------------------------------------------
insert into Reservation(id_client,num_chambre,date_arv,date_dep)
values ( 1000,20,TO_DATE('20140912','yyyymmdd'), TO_DATE('20140921','yyyymmdd'))

insert into Reservation(id_client,num_chambre,date_arv,date_dep)
values ( 1001,10,TO_DATE('20150630','yyyymmdd'), null)

--------------------------------------------------------------------
SELECT *
from chambre
where equ = 'TV'

-----------------------------------------

select num_chambre ,nbr_pers,nbr_lit
from chambre

--------------------------------------------------------------
select sum(nbr_lit),sum(nbr_pers),count(num_chambre)
from chambre
-------------------------------------------------------------
select nom,prenom,prix
from chambre Ch
inner join reservation R on ch.num_chambre= r.num_chambre
inner join client1 Cl on cl.id_client=r.id_client

---------------------------------------------
select nom,prenom,prix
from chambre Ch
inner join reservation R on ch.num_chambre= r.num_chambre
inner join client1 Cl on cl.id_client=r.id_client
where ch.equ ='TV'
----------------------------------------------------

select Ch.num_chambre, cl.id_client
from chambre Ch
inner join reservation R on ch.num_chambre= r.num_chambre
inner join client1 Cl on cl.id_client=r.id_client
where date_arv = '12/09/2014'

--------------------------------------------------------
select *--num_chambre
from chambre 
where prix <= 80

--------------------------------------------------------
select nom,prenom,adresse
from client1
where nom like 'y%'

----------------------------------------------------------
select count(num_chambre)
from chambre 
where prix between 85 and 200

----------------------------------------------------------









