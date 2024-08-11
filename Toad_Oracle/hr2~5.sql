CREATE or REPLACE PACKAGE constants_pkg is
    
    v_salary_increase number := 0.04;
    cursor cur_emps is select * from employees;
    t_emps_type employees%rowtype;
    v_company_name varchar2(20) := 'Oracle';
end;