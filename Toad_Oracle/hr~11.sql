DECLARE
  l_string VARCHAR2(4000);
BEGIN
  select LISTAGG(q'[']'123','456'q'['], ', ')
           WITHIN GROUP (ORDER BY 1)
         into (l_string) 
    FROM dual;
    DBMS_OUTPUT.PUT_LINE(l_string)
END;