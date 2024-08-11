select * from departments_copy;

create SEQUENCE seq_dep_cpy
    start WITH 280
  INCREMENT BY 10;
  
INSERT INTO departments_copy 
    (department_name,manager_id,location_id)    
VALUES ('Security',200,1700);  

SELECT
    * FROM log_departments_copy;
    
 INSERT INTO departments_copy (department_name, manager_id,location_id)
     VALUES ('Cyber Security', 100, 1700);  
     
  UPDATE departments_copy
SET manager_id = 200
WHERE department_name = 'Cyber Security';
 
DELETE FROM departments_copy
WHERE department_name = 'Cyber Security';   