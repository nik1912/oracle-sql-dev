select * from a_function();

SELECT object_type, object_name, status
  FROM user_objects;
  
  
  SELECT name, type, source_size, parsed_size, code_size
  FROM user_object_size
 WHERE 1=1--code_size > &&1 * 1024
 ORDER BY code_size DESC;
 
 SELECT *
  FROM user_triggers tr
 WHERE when_clause IS NULL AND
       EXISTS (SELECT 'x'
                 FROM user_trigger_cols
                WHERE trigger_owner = USER
                AND trigger_name = tr.trigger_name);
                
                
select * from USER_PLSQL_OBJECT_SETTINGS;