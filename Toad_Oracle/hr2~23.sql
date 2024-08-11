UPDATE employees_copy SET salary=salary+100
    where department_id=30;

alter table employees_copy DISABLE all triggers;


delete from employees_copy;

update employees_copy set salary = 40000
where employee_id=198;

select * from employees_copy where employee_id=198;


