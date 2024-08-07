CREATE or REPLACE FUNCTION get_emp(emp_num employees.employee_id%TYPE) 
   RETURN employees%rowtype  IS
   
   emp employees%rowtype;
   
BEGIN 
    SELECT
        * into emp FROM employees where employee_id=emp_num;
  RETURN emp;
  
  EXCEPTION WHEN no_data_found then 
    DBMS_OUTPUT.PUT_LINE(' there is emp_id: ' || emp_num);
      RETURN null;  
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(' какая-то фигня');
      RETURN null;
    
END;