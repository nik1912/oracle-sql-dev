DECLARE
  fname VARCHAR2(15);
  emp_sal NUMBER(10);
  
BEGIN
   
  SELECT first_name, salary 
INTO fname, emp_sal FROM employees 
WHERE employee_id=110;

   
  DBMS_OUTPUT.put_line('Hello '||fname);
 
 
END;