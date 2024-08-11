CREATE or REPLACE PROCEDURE INCREASE_SALARIES (v_salary_increase in NUMBER, v_dep_id pls_integer) AS
     CURSOR c_emps is select * from employees_copy where department_id = v_dep_id for UPDATE;
   /*  v_salary_increase PLS_INTEGER := 1.10;*/
     v_old_salary NUMBER;
      BEGIN
          for r_emp in c_emps loop
          v_old_salary := r_emp.salary;
          r_emp.salary := r_emp.salary*v_salary_increase+r_emp.salary*nvl(r_emp.commission_pct,0);
          UPDATE employees_copy set row = r_emp where current of c_emps;
          DBMS_OUTPUT.PUT_LINE('the salary of: '|| r_emp.employee_id|| ' is increased from  '|| v_old_salary|| ' to '|| r_emp.salary );
         
          end loop;
          
          DBMS_OUTPUT.PUT_LINE('procedure finished!');
      END;
      