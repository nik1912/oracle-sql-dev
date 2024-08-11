REM Раздел A
SQL> CREATE TYPE first_names_t IS VARRAY (2) OF VARCHAR2 (100);
  2  /
Type created.
SQL> CREATE TYPE child_names_t IS VARRAY (1) OF VARCHAR2 (100);
  2  /
Type created.
REM Раздел B
SQL> CREATE TABLE family (
  2     surname VARCHAR2(1000)
  3   , parent_names first_names_t
  4   , children_names child_names_t
  5   );
Table created.
REM Раздел C
SQL>


Знакомство с коллекциями 301

  1  DECLARE
  2     parents    first_names_t := first_names_t ();
  3     children   child_names_t := child_names_t ();
  4  BEGIN
  5     parents.EXTEND (2);
  6     parents (1) := 'Samuel';
  7     parents (2) := 'Charina';
  8     --
  9     children.EXTEND;
 10     children (1) := 'Feather';
 11
 12     --
 13     INSERT INTO family
 14                 ( surname, parent_names, children_names )
 15          VALUES ( 'Assurty', parents, children );
 16  END;
SQL> /