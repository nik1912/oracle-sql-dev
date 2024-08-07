create or REPLACE PROCEDURE add_job (job_id VARCHAR2, job_title VARCHAR2,
      min_salary NUMBER DEFAULT 1000, max_salary NUMBER DEFAULT null)  is
 
 BEGIN
   insert INTO jobs VALUES (job_id, job_title, min_salary , max_salary );
   DBMS_OUTPUT.put_line('the job :' ||job_title || ' is inserted! ' );
 END;     