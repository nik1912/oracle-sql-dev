DECLARE
    type emp_cur_type is REF CURSOR;
    emp_cursor              emp_cur_type;
    emp_record              employees%rowtype;
    v_table_name           VARCHAR2(20);
    
begin
    v_table_name := 'employees';
        open emp_cursor for 'select * from ' ||v_table_name || ' where job_id = :job' USING 'IT_PROG';
            loop 
                FETCH emp_cursor INTO emp_record;
                EXIT WHEN emp_cursor%notfound;
                DBMS_OUTPUT.PUT_LINE(emp_record.first_name ||' '|| emp_record.last_name ||' is dep: ' ||emp_record.department_id);
             end loop;
           CLOSE  emp_cursor;
end;