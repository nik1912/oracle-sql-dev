create TABLE departments_copy as SELECT * from departments;

CREATE or replace view vw_emp_details as 
    select upper (department_name) dname, min(salary) min_sal,max(salary) max_sal
    from employees_copy join departments_copy
    USING(department_id)
    group by department_name;


UPDATE vw_emp_details set DNAME = 'EXEC DEPT' WHERE
  UPPER(DNAME) = 'EXECUTIVE';
  
  select * from vw_emp_details;

