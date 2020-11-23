select 
(select NomSociete from Client where ClientId = 'paris')
 from client;
 


 select c2.*
 from client c1
 join client c2 on c1.Ville = c2.Ville
 where c1.ClientId = 'paris';


 select *
 from client
 where ClientId in (select ClientId from Commande);