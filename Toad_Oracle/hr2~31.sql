CREATE or REPLACE PACKAGE emp_pkg as
      
      v_salary_increase_rate number := 1000;
      cursor cur_emps is select * from employees;
      PROCEDURE increase_salaries;
      FUNCTION get_avg_sal (p_dep_id int) RETURN NUMBER;
            
      END emp_pkg;
      