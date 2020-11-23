select *
from employees
where employee_id in (
select * from departments
where department_name = 'Administration')


select * from locations;
select * from employees

where manager_id = 102
where job_id ='IT_PROG';
select * from jobs
select * from job_history
order by start_date
select * from regions




----les employees qui sont manager------------------
select distinct e1.employee_id,e1.last_name
from employees E1
join employees E2 on e1.employee_id=e2.manager_id
order by e1.employee_id

--------les employees qui ont pas de manager-----------
select *
from employees
where manager_id is null
-----les employees et leur contrat---------------
select *
from employees E
join job_history JH on jh.employee_id= e.employee_id
-----le nombre d'employe par departement----------
select d.department_name ,  count (e.employee_id)
from employees e
join departments D on e.department_id=d.department_id
group by d.department_name
-------les employees les mieux payer dans chaque departement-------
select max( e.salary),d.department_name,e.first_name
from employees e
join departments d on e.department_id =d.department_id
group by d.department_name,e.first_name
order by d.department_name


------les 5 employé les plus enciens-------
select * 
from(
select e.last_name, jh.start_date
from employees e
join job_history jh on jh.employee_id=e.employee_id
order by jh.start_date )
where rownum <= 5

------le nom et prenom de manager de chaque departement ---

select e.LAST_NAME , e.FIRST_NAME, coalesce(d.DEPARTMENT_NAME,'inconnu') nom_departement
from employees e
join departments d on d.manager_id=e.employee_id
order by nom_departement

-----nom prenom de chaque manager et leur salaire --------
select distinct e1.employee_id,e1.last_name, e1.salary
from employees E1
join employees E2 on e1.employee_id=e2.manager_id
order by e1.employee_id

----les departement qui sont a 'washington'----------------
select d.department_name, l.state_province
from departments d
join locations l on l.location_id= d.location_id
where l.state_province = 'Washington'

--- les cité et code postal de chaque location  ou la cité contient 'South'

select postal_code,city
from locations 
where city like '%South%'

---les location en italie---
select *
from locations l
join countries co on l.country_id= co.country_id
where co.country_name = 'Italy'

---les numero de tel de employer qui ont dans leur nom taylor ou grant-----
select e.last_name,e.first_name ,e.phone_number
from employees e
where e.last_name like '%Taylor%' or e.last_name like '%Grant%'
order by e.last_name

---les employer embauché en mai 2003--
select distinct * --e.last_name,e.first_name
from employees e
where extract( year from e.hire_date) = 2003 and extract (month from e.hire_date) = 05

---les programmer manger par Alexander Hunold--------------------
select e1.first_name,e1.last_name,j.job_title,e2.last_name,e2.first_name
from employees e1 
join employees e2 on e1.manager_id= e2.employee_id
join jobs j on j.job_id =e1.job_id
where j.job_title = 'Programmer' and e2.first_name = 'Alexander'

---le min et max des slaire des sales manager--------------

select * from jobs
where job_title= 'Sales Manager'
--------tous les employees d'europe qui gagne plus de 4500e--------
select e.first_name,e.last_name,e.salary, co.country_name,r.region_name
from employees e
join departments d on d.department_id=e.department_id
join locations l on d.location_id=l.location_id
join countries co on l.country_id=co.country_id
join regions r on r.region_id=co.region_id
where r.region_name= 'Europe' and e.salary > 4500
----------------------------------------------------------------------
select e.first_name,e.last_name,e.salary, co.country_name,r.region_name
from employees e
join departments d on d.department_id=e.department_id
join locations l on d.location_id=l.location_id
join countries co on l.country_id=co.country_id
join regions r on r.region_id=co.region_id
where r.region_name = 'Middle East and Africa'
 ----------------------------------------------------------------------
 select *
 from countries co
 join regions r on co.region_id= r.region_id
 where r.region_name = 'Middle East and Africa'
 
 ----le nombre d'employees en 'UK'------------------------

----
-----------moyenne d'employees par continent-----------------
select r.region_name, avg(e.employee_id)
from employees e
join departments d on d.department_id=e.department_id
join locations l on d.location_id=l.location_id
join countries co on l.country_id=co.country_id
join regions r on r.region_id=co.region_id
group by r.region_name

/* le pourcentage des employees UK par raport au employées de l'europe*/


n 
select reu.region_id,(reu.nbUK /reu.nbeurope)*100 
            from (select cou.region_id region_id, count(*) nbUK , Europe.nbeurope nbeurope
                  from employees e
                  join departments d on d.department_id=e.department_id
                  join locations l on d.location_id=l.location_id
                  join countries cou on l.country_id=cou.country_id
                          join (select r.region_id region_id , count (*) nbeurope
                          from employees e
                          join departments d on d.department_id=e.department_id
                          join locations l on d.location_id=l.location_id
                          join countries co on l.country_id=co.country_id
                          join regions r on r.region_id=co.region_id
                          where r.region_name = 'Europe'
                          group by r.region_id ) Europe  on Europe.region_id = cou.region_id
                  where cou.country_name = 'United Kingdom' 
                  group by cou.region_id,  Europe.nbeurope) reu