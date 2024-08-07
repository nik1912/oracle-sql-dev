DECLARE
  c VARCHAR2(32);
  v_todate date := SYSDATE;
  v_tomorrow v_todate%TYPE;
  v_basic_percent NUMBER :=45;
  v_pf_percent NUMBER :=12;
  fname VARCHAR2(15);
  emp_sal NUMBER(10)
  
BEGIN
  c := 'Hello world';
  v_tomorrow := v_todate + 1;
  
  SELECT first_name, salary 
INTO v_fname, v_emp_sal FROM employees 
WHERE employee_id=110;

   
  DBMS_OUTPUT.put_line('вот вам - '||c);
  DBMS_OUTPUT.PUT_LINE('today is :' || v_todate);
  DBMS_OUTPUT.PUT_LINE('tomorrow is :'|| v_tomorrow);
 
END;