TRUNCATE TABLE employees_copy;
insert into employees_copy select * from employees;

 select * from employees_copy where salary<5000;
 
  select * from employees_copy;
 
 EXEC emp_pkg.increase_low_salaries;