select 
	NomSociete,
	pays,
	case Pays
	when  'germany' then 'temp�r�'
	when  'France' then 'temp�r�'
	when  'mexico' then 'chaud'
	when  'canada' then 'frais'
	else 'je ne sais pas '

	end
from Client;

select 
	NomSociete,
	pays,
	case 
	when  pays in ('germany','France','spain' ) then 'temp�r�'
	when  pays in ('mexico') then 'chaud'
	when  pays in ('canada') then 'frais'
	else 'je ne sais pas '

	end
from Client;



select 
	nomsociete,
	pays , 
	Region
from client
order by 
	case pays 
	when 'France' then 1
	else 2
	end,
Pays;