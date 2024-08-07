CREATE PROCEDURE prc_create_table_dynamic (p_table_name in VARCHAR2,p_col_specs in VARCHAR2) 
      IS
      BEGIN
          EXECUTE IMMEDIATE 'create table ' ||p_table_name||' ('||p_col_specs||') ';
      END ;
      
 exec prc_create_table_dynamic('dynamic_temp_table','id number, name varchar2(100)');     
 
 select   
     * from dynamic_temp_table;
     
     
     
CREATE TABLE names (id NUMBER PRIMARY KEY, name VARCHAR2(100));

CREATE or replace FUNCTION insert_vaiues (id in VARCHAR2,name VARCHAR2) RETURN PLS_INTEGER
          IS
         BEGIN
            EXECUTE IMMEDIATE 'insert into names values(:a, :b)' USING id,name;
            RETURN SQL%ROWCOUNT;
          END ;
      
 DECLARE
   v_affected_rows PLS_INTEGER;
   v_first_name VARCHAR2(100);
 BEGIN
   v_affected_rows := update_names(2,'king',v_first_name);
   DBMS_OUTPUT.put_line(v_affected_rows || 'row update');
   DBMS_OUTPUT.put_line(v_first_name);
 END;  
 
 select * from names;
 
 alter table names add (last_name VARCHAR2(100));
 
 create or replace function update_names (id in VARCHAR2,last_name in VARCHAR2, first_name  out VARCHAR2 )
     return PLS_INTEGER is
     
     v_dynamic_sql VARCHAR2(200);
     
     begin
     v_dynamic_sql := 'update names set last_name = :1 where id :=2 returning name into :=3';
     EXECUTE IMMEDIATE v_dynamic_sql using in last_name, id returning into first_name;
     RETURN SQL%ROWCOUNT;     
     end;
 
   
      DROP TABLE names;
DROP FUNCTION insert_values;
DROP FUNCTION update_names;
      
 




      