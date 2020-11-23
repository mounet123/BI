
102/ Tous les employés de département administration classés par ancienneté
select employee_id, first_name, last_name, d.department_name, hire_date
from employees e
join departments d on e.department_id = d.department_id
where lower(department_name) like '%administration'
order by hire_date; 

select (cast ((floor(months_between (end_date, start_date) / 12))as varchar (2)) 
|| ' années ' ||  
cast (floor(months_between (end_date, start_date)) - (floor(months_between (end_date, start_date) / 12) *12) as varchar(2)) 
|| ' mois') as Durée
from job_history;



30/ calculer la valeur de la commission
select last_name, salary, commission_pct,(salary * commission_pct) as Commission
from employees
where commission_pct is not null;

42/ 


64/ Quelle est la commission la plus petite
select commission as commission_min
from  (select employee_id, first_name, last_name,(commission_pct*salary) as commission
from employees
order by commission) 
where rownum = 1;



68/ Quelle est la différence entre le salaire du président et le salaire Administration Vice President
select distinct (select salary from (select distinct salary
                                    from employees E
                                    join jobs J on E.job_id = j.job_id
                                    order by salary DESC)
                 where rownum = 1) 
    -           (select salary from (select distinct salary
                                    from employees E
                                    join jobs J on E.job_id = j.job_id
                                    where lower(j.job_title) <> 'president'
                                   order by salary DESC)
                 where rownum = 1)
    as difference
from employees;
select (cast ((floor(months_between (end_date, start_date) / 12))as varchar (2)) 
|| ' années ' ||  
cast (floor(months_between (end_date, start_date)) - (floor(months_between (end_date, start_date) / 12) *12) as varchar(2)) 
|| ' mois') as Durée
from job_history;




-
79/ Les employés embauchés entre juin 2007 et juin 2008
select employee_id, first_name, last_name, hire_date
from employees
where (extract (month from(hire_date)) between 06 and 12 and extract (year from(hire_date))= 2007)
or (extract (month from(hire_date)) between 01 and 06 and extract (year from(hire_date))= 2008)
order by hire_date;





88/ --Toutes les villes ayant le même nom d'état de province
select distinct city, state_province
from locations
where state_province is not null
order by state_province;





