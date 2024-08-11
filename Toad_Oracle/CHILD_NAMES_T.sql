CREATE TYPE first_names_t IS VARRAY (2) OF VARCHAR2 (100);

CREATE TYPE child_names_t IS VARRAY (1) OF VARCHAR2 (100);

CREATE TABLE family (
      surname VARCHAR2(1000)
     , parent_names first_names_t
     , children_names child_names_t
     );
     
     
 select S.ROWID,S.* from family S;    