SELECT e.employee_id ,e.job_id,e.first_name, e.last_name, e.salary,
   FIRST_VALUE(e.first_name||' '||e.last_name) over (PARTITION BY job_id ORDER BY salary ) as fir,
   last_VALUE(e.first_name||' '||e.last_name) over (PARTITION BY job_id ORDER BY salary 
   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as las ,
   NTH_VALUE(e.first_name||' '||e.last_name,2) over (PARTITION BY job_id ORDER BY salary
   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED  FOLLOWING ) as nth,
   LAG(salary, 1, 1) OVER (PARTITION BY e.job_id ORDER BY e.salary) as la,
   lead(salary, 1, 1) OVER (PARTITION BY e.job_id ORDER BY e.salary) as lea

   FROM employees e
   
   
   where 1=1 -- now--445
   and e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK');
