create or replace TRIGGER trg_comp_emps
    for insert or UPDATE or DELETE on employees_copy
    compound TRIGGER
     --v_dml_type VARCHAR2(10);
     type t_avg_dept_salaries is table of employees_copy.salary%TYPE index by PLS_INTEGER;
     avg_dept_salaries t_avg_dept_salaries;
  
  before statement is   
     begin
     /*   if inserting then
          v_dml_type := 'insert';
        elsif updating then
          v_dml_type:='updat';
        elsif deleting then
           v_dml_type:='delete';
        end if;
        
     DBMS_OUTPUT.PUT_LINE('Before statement section is exec with the '|| v_dml_type ||' event');         
  */
     for avg_sal in (select avg(salary) salary, nvl(department_id,999) department_id
            from employees_copy group by department_id) loop
       avg_dept_salaries(avg_sal.department_id):= avg_sal.salary;
       end loop;
  end before statement;
      
   after each row is
     v_interval number :=15;
        begin
            if :new.salary >avg_dept_salaries(:new.department_id) + avg_dept_salaries(:new.department_id)* v_interval/100 then
            RAISE_application_error(-20005,' a raise cannot be' ||v_interval || 'percent higher than its dep');
          end if;  
    end after each row;
     
 after statement is
    begin 
        DBMS_OUTPUT.PUT_LINE('all done') ;
    end  after statement;
    
  end;  
 
 
     
     
     