------les departement de tous les employées----------                 
  select coalesce(d.department_name,'inconnu'),e.first_name,e.last_name
  from departments d
  right join employees e on e.department_id=d.department_id;
 ----------le nombre d'experiance de chaque departement ------- 
  
  select d.department_name , count(*)
  from job_history jh
  join departments d on d.department_id=jh.department_id
  group by d.department_name;
------------------------------------------------
select count(*)
from employees

/*le nombre d'employées par departement */

select d.department_name, count(*) nb
from employees e
join departments d on d.department_id=e.department_id
group by  d.department_name

/*la moyenne des employées par departement*/

select avg(nb)
from(select d.department_name, count(*) nb
from employees e
join departments d on d.department_id=e.department_id
group by  d.department_name)

/*quels sont les departement qui ont un nombre d'employées inferieur a la moyenne 
de nombre d'employées de tous les departement */

select d.department_name, count(*) nb
from employees e
join departments d on d.department_id=e.department_id
group by  d.department_name
having count(*)  < 
(select avg(nb)
from(select d.department_name, count(*) nb
from employees e
join departments d on d.department_id=e.department_id
group by  d.department_name) emd)

/*les manager qui vient de france ou UK*/
select distinct e1.employee_id,e1.last_name
from employees E1
join employees E2 on e1.employee_id=e2.manager_id
join departments d on d.department_id=e1.department_id
join locations l on d.location_id = l.location_id
join countries cou on cou.country_id= l.country_id
where cou.country_name = 'France' or cou.country_name = 'United Kingdom'