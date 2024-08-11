CREATE TABLE emps_high_paid as SELECT * from employees where 1=2;

select *from emps_high_paid;



DECLARE
  FUNCTION get_emp (emp_num employees.employee_id%TYPE) RETURN employees%rowtype  is
   emp  employees%rowtype; 
   BEGIN
  select * into emp from employees where employee_id=emp_num ;
  RETURN emp;
END;
PROCEDURE insert_high_paid_emp (emp_id employees.employee_id%TYPE) is
emp employees%rowtype;
BEGIN
  emp := get_emp(emp_id);
  INSERT INTO emps_high_paid VALUES emp;
  END;
  
  BEGIN
    for r_emp in (SELECT * FROM employees) loop
    if r_emp.salary>15000 then 
        insert_high_paid_emp(r_emp.employee_id);
        end if;
        end loop;
  END;
