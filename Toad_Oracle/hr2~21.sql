DECLARE
  v_emp employees%ROWTYPE;
BEGIN
  v_emp := get_emp(10);
  DBMS_OUTPUT.put_line('infa of the emploees : ');
  DBMS_OUTPUT.put_line('the name is : ' || v_emp.first_name); 
  DBMS_OUTPUT.put_line('the email is : ' || v_emp.email);
   DBMS_OUTPUT.put_line('the salary is : ' || v_emp.salary);
  
END;