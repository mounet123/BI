select co.CommandeId, co.DateCommande,
cl.NomSociete,
e.Nom as nom_employe, e.Prenom as prenom_employe
from Commande as co
join client as cl on co.ClientId = cl.ClientId
join employe as e on  e.EmployeId = co.employeid  
order by e.EmployeId;

select *
from Commande as co1
join commande as co2 on co1.ClientId = co2.ClientId
	and co1.EmployeId <> co2.EmployeId
	where co1.CommandeId > co2.CommandeId;



	select 
	co1.CommandeId as commandeid1 ,
	co2.CommandeId as commandeid2, 
	cl.NomSociete,
	e1.Prenom + ' ' + e1.Nom as nomEmploye1,
	e2.Prenom + ' ' + e2.Nom as nomEmploye2,
	s.NomService as serviceEmploye2

from Commande as co1
join commande as co2 on co1.ClientId = co2.ClientId
	and co1.EmployeId <> co2.EmployeId
join client as cl on co1.ClientId = cl.ClientId
join employe as e1 on  e1.EmployeId = co1.employeid  
join employe as e2 on  e2.EmployeId = co2 .employeid 
	join Service as s on e2.ServiceId=s.ServiceId
	and e2.DivisionId = s.DivisionId
where co1.CommandeId > co2.CommandeId; 



select *
from Client cl
join commande co on cl.clientid =co.clientid
where cl.ClientId in ( 'ottik','paris');

select *
from Client cl
where ClientId ='paris';




select nomsociete,ContactNom
from Client
union all

select nomsociete,ContactNom
from Fournisseur;


---------

select nomsociete,ContactNom
from Client
intersect

select nomsociete,ContactNom
from Fournisseur;


select nomsociete,ContactNom
from Client
except

select nomsociete,ContactNom
from Fournisseur;





