create or REPLACE FUNCTION get_count(table_name in VARCHAR2) return PLS_INTEGER is
  v_count PLS_INTEGER;
    begin
        EXECUTE IMMEDIATE 'select count(*) from ' || table_name into v_count;
        RETURN v_count;
    end;
    
   set SERVEROUTPUT ON;
    
   BEGIN
     DBMS_OUTPUT.PUT_LINE('there are ' ||get_count('employees')|| ' row table');
   END; 
   
   declare
   
   v_table_name VARCHAR2(50);
   
   BEGIN
     for r_table in (select table_name from user_tables) loop
     DBMS_OUTPUT.PUT_LINE('there are ' ||get_count(r_table.table_name)|| ' row in the ' || r_table.table_name || ' table');
    end loop; 
   END; 
   
   create table stock_clerks as select * from employees where job_id = 'ST_CLERK';
   
   select * from stock_clerks;
   
   create or replace function get_avg_sals (p_table in VARCHAR2, p_dep_id in number) 
   return PLS_INTEGER 
    is
   v_average pls_integer;
   
   begin 
    EXECUTE IMMEDIATE 'select avg(salary) from '|| p_table ||  ' where department_id = :2' 
    into v_average USING p_dep_id;
    RETURN v_average;
   end;
   
   select get_avg_sals('stock_clerks','50') from dual;
   
   DROP FUNCTION get_count;
DROP FUNCTION get_avg_sals;
DROP TABLE stock_clerks;
DROP TABLE stock_managers;
   