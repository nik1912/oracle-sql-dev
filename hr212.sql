SELECT employee_id, first_name, last_name, department_id, salary FROM employees a
WHERE EXISTS 
            (SELECT * FROM employees WHERE manager_id = a.employee_id);
            
            
 
SELECT * FROM departments d
WHERE not EXISTS
                 (SELECT * FROM employees e
                  WHERE e.department_id = d.department_id);


SELECT * FROM departments d
WHERE not EXISTS
                 (SELECT * FROM employees e
                  WHERE e.department_id = d.department_id);
