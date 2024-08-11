declare 
    type t_name is table of VARCHAR2(20);
    names t_name;
BEGIN
    EXECUTE IMMEDIATE 'update employees_copy set salary = salary + 1000 where department_id =30 returning first_name into :a'
   RETURNING BULK COLLECT into names;
    FOR i IN 1..names.count LOOP
          DBMS_OUTPUT.PUT_LINE(names(i));
        END LOOP;
end;