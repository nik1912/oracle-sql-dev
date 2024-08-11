CREATE TYPE t_days AS OBJECT(
    v_date DATE,
    v_date_number int
);
/
CREATE TYPE t_days_tab IS TABLE OF t_days;

/

CREATE or REPLACE FUNCTION f_get_days(p_start_date date, p_day_number INT) 
               RETURN t_days_tab 
          IS
              v_days t_days_tab := t_days_tab();
          BEGIN
              for i in 1.. p_day_number loop
              v_days.extend;
              v_days(i) := t_days(p_start_date+i,
                                 to_number(to_char(p_start_date+1,'DDD'))                    
                             );
          end loop;
          RETURN v_days
          END ;
      
  ////
  
  
  
CREATE or REPLACE FUNCTION f_get_days_piped(p_start_date date, p_day_number INT) 
               RETURN t_days_tab 
        pipelined  IS
             -- v_days t_days_tab := t_days_tab();
          BEGIN
              for i in 1.. p_day_number loop
            --  v_days.extend;
             -- v_days(i) := 
              pipe row (t_days(p_start_date+i,
                                 to_number(to_char(p_start_date+1,'DDD'))                    
                             ));
          end loop;
          RETURN; --v_days
          END ;
      
      
      
