begin 
    for r_emp in (select * from employees) loop
        DBMS_OUTPUT.PUT_LINE(r_emp.first_name|| ' ' ||  r_emp.last_name);
    end loop;
end;    

declare
    v_dynamic_text VARCHAR2(1000);
BEGIN
    v_dynamic_text := q'{
    declare
        v_department_id pls_integer :=30;
    begin 
    for r_emp in (select * from employees where department_id=v_department_id) loop
        DBMS_OUTPUT.PUT_LINE(r_emp.first_name|| ' ' ||  r_emp.last_name);
    end loop;
end;}';
  EXECUTE IMMEDIATE v_dynamic_text;
END;    