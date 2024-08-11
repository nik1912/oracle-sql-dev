--select *from emps_high_paid;

--DELETE FROM emps_high_paid;


DECLARE
PROCEDURE insert_high_paid_emp (p_emp employees%rowTYPE) is
emp employees%rowtype;
e_id number;

  FUNCTION get_emp (emp_num employees.employee_id%TYPE) RETURN employees%rowtype  is
     BEGIN
  select * into emp from employees where employee_id=emp_num ;
  RETURN emp;
END;

FUNCTION get_emp (emp_email employees.email%TYPE) RETURN employees%rowtype  is
     BEGIN
  select * into emp from employees where email=emp_email ;
  RETURN emp;
END;

FUNCTION get_emp (f_name employees.first_name%TYPE,l_name VARCHAR2) RETURN employees%rowtype  is
     BEGIN
  select * into emp from employees where first_name=f_name and last_name=l_name;
  RETURN emp;
END;

BEGIN
  emp := get_emp(p_emp.first_name,p_emp.last_name);
  INSERT INTO emps_high_paid VALUES emp;
  END;
  
  BEGIN
    for r_emp in (SELECT * FROM employees) loop
    if r_emp.salary>15000 then 
        insert_high_paid_emp(r_emp);
        end if;
        end loop;
  END;
