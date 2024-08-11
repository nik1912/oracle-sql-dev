CREATE OR REPLACE FUNCTION CONCAT_WS (p_Separator CHAR, P_String TString) RETURN VARCHAR2
AS
rv VARCHAR2 (32767) := ' ';
BEGIN
FOR n in 1..p_String.count
LOOP
IF n = p_String.last THEN
rv := rv || p_string(n);
ELSE
rv := rv || p_string(n) ||p_Separator;
END IF;
END LOOP;
RETURN rv;
END;