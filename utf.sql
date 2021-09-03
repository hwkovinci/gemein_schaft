DROP TABLE title_schema;
DROP TABLE actor_list;
DROP TABLE director_list;
DROP TABLE genre_list;
DROP TABLE title_list;
DROP TABLE actor_schema;
DROP TABLE director_schema;
DROP TABLE genre_schema;
DROP TABLE kreuz_am;
DROP TABLE kreuz_am_schema;
DROP TABLE kreuz_dm;
DROP TABLE kreuz_dm_schema;
DROP TABLE kreuz_gm;
DROP TABLE kreuz_gm_schema;


CREATE TABLE title_schema(
title_id VARCHAR2(20),
title_name VARCHAR2(100),
title_rating FLOAT(4),
title_year NUMBER(4),
title_released DATE,
title_runtime VARCHAR2(10),
title_plot VARCHAR2(300),
title_country VARCHAR2(30),
title_poster VARCHAR2(250))
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET UTF8
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(title_id,
title_name,
title_rating,
title_year,
title_released DATE(15) "DD-MON-YYYY",
title_runtime,
title_plot,
title_country,
title_poster)
)
LOCATION(VER_TRIEB: 'insert_title.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE title_list(
    title_id          VARCHAR2(20) PRIMARY KEY  NOT NULL,
    title_name        VARCHAR2(100)    NOT NULL,
    title_rating      FLOAT(4)      NOT NULL,  
    title_year        NUMBER(4)     NOT NULL,
    title_released    DATE          NOT NULL,
    title_runtime     VARCHAR2(10)  NOT NULL,
    title_plot        VARCHAR2(300) NOT NULL,
    title_country     VARCHAR2(30)  NOT NULL,
    title_poster      VARCHAR2(250) NOT NULL);

INSERT /*+ append */ INTO title_list
(title_id, title_name, title_rating,
title_year,
title_released,
title_runtime,
title_plot,
title_country,
title_poster)
SELECT title_id,
title_name,
title_rating,
title_year,
title_released,
title_runtime,
title_plot,
title_country,
title_poster
FROM title_schema 
GROUP BY title_id, title_name, title_rating,
title_year,
title_released,
title_runtime,
title_plot,
title_country,
title_poster;



CREATE TABLE actor_schema(
actor_id NUMBER,
actor_name VARCHAR2(40))
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET UTF8
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(actor_id  , 
actor_name)  
)
LOCATION(VER_TRIEB: 'list_actor.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE actor_list(
    actor_id             NUMBER  PRIMARY KEY       NOT NULL,
    actor_name         VARCHAR2(40)    NOT NULL);

INSERT /*+ append */ INTO actor_list
(actor_id,actor_name)
SELECT actor_id,
actor_name
FROM actor_schema GROUP BY actor_id, actor_name;



CREATE TABLE director_schema(
director_id NUMBER,
director_name VARCHAR2(40)) 
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET UTF8
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(director_id  ,
director_name)
)
LOCATION(VER_TRIEB: 'list_director.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE director_list(
    director_id             NUMBER  PRIMARY KEY      NOT NULL,
    director_name         VARCHAR2(40)    NOT NULL);

INSERT /*+ append */ INTO director_list
(director_id,director_name)
SELECT director_id,
director_name
FROM director_schema GROUP BY director_id, director_name;


CREATE TABLE genre_schema(
genre_id NUMBER,
genre_name VARCHAR2(40)) 
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(genre_id  ,
genre_name)
)
LOCATION(VER_TRIEB: 'list_genre.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE genre_list(
    genre_id             NUMBER   PRIMARY KEY       NOT NULL,
    genre_name         VARCHAR2(40)    NOT NULL);

INSERT /*+ append */ INTO genre_list
(genre_id,genre_name)
SELECT genre_id,
genre_name
FROM genre_schema GROUP BY genre_id, genre_name;




CREATE TABLE kreuz_am_schema(
title_id VARCHAR2(20),
actor_id NUMBER)
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(title_id  ,
actor_id)
)
LOCATION(VER_TRIEB: 'insert_actor.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE kreuz_am(
    title_id         VARCHAR2(20)    NOT NULL,
    actor_id         NUMBER    NOT NULL);
--CONSTRAINT pk_kz_am 
--      PRIMARY KEY (title_id, actor_id ),
--    CONSTRAINT fk_am_m 
--      FOREIGN KEY (title_id)
--      REFERENCES title_list(title_id ) 
--      ON DELETE CASCADE,
--    CONSTRAINT fk_am_a 
--      FOREIGN KEY (actor_id )
--      REFERENCES actor_list(actor_id ) 
--      ON DELETE CASCADE);
--ALTER TABLE kreuz_am ENABLE CONSTRAINT pk_kz_am;
--ALTER TABLE kreuz_am ENABLE CONSTRAINT fk_am_m;
--ALTER TABLE kreuz_am ENABLE CONSTRAINT fk_am_a;

INSERT /*+ append */ INTO kreuz_am
(title_id, actor_id)
SELECT title_id,
actor_id
FROM kreuz_am_schema GROUP BY title_id, actor_id;

CREATE TABLE kreuz_dm_schema(
title_id VARCHAR2(20),
director_id NUMBER)
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(title_id  ,
director_id)
)
LOCATION(VER_TRIEB: 'insert_director.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE kreuz_dm(
    title_id          VARCHAR2(20)    NOT NULL,
    director_id         NUMBER    NOT NULL);
--CONSTRAINT pk_kz_dm
--      PRIMARY KEY (title_id, director_id ),
--    CONSTRAINT fk_dm_m
--      FOREIGN KEY (title_id )
--      REFERENCES title_list(title_id )
--      ON DELETE CASCADE,
--    CONSTRAINT fk_dm_d
--      FOREIGN KEY (director_id )
--      REFERENCES actor_list( director_id )
--      ON DELETE CASCADE);
--ALTER TABLE kreuz_dm ENABLE CONSTRAINT fk_dm_m;
--ALTER TABLE kreuz_dm ENABLE CONSTRAINT fk_dm_d;

INSERT /*+ append */ INTO kreuz_dm
(title_id, director_id)
SELECT title_id,
director_id
FROM kreuz_dm_schema GROUP BY title_id, director_id;



CREATE TABLE kreuz_gm_schema(
title_id VARCHAR2(20),
genre_id NUMBER)
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER DEFAULT DIRECTORY VER_TRIEB
ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
TERRITORY AMERICA
disable_directory_link_check
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM
(title_id  ,
genre_id)
)
LOCATION(VER_TRIEB: 'insert_genre.dat' )
)
PARALLEL
REJECT LIMIT UNLIMITED;

CREATE TABLE kreuz_gm(
    title_id         VARCHAR2(20)    NOT NULL,
    genre_id         NUMBER    NOT NULL);
--CONSTRAINT pk_kz_gm
--      PRIMARY KEY (title_id, genre_id ),
--    CONSTRAINT fk_gm_m
--      FOREIGN KEY (title_id )
--      REFERENCES title_list(title_id )
--      ON DELETE CASCADE,
--    CONSTRAINT fk_gm_g
--      FOREIGN KEY (genre_id )
--      REFERENCES genre_list(genre_id )
--      ON DELETE CASCADE);
--ALTER TABLE kreuz_gm ENABLE CONSTRAINT fk_gm_m;
--ALTER TABLE kreuz_gm ENABLE CONSTRAINT fk_gm_g;

INSERT /*+ append */ INTO kreuz_gm
(title_id, genre_id)
SELECT title_id,
genre_id
FROM kreuz_gm_schema GROUP BY title_id, genre_id;

commit;

select * from title_list
order by title_id DESC;
--FETCH FIRST 300 ROWS ONLY;
select * from director_list
order by director_id DESC
FETCH FIRST 300 ROWS ONLY;
select * from actor_list
order by actor_id DESC
FETCH FIRST 300 ROWS ONLY;
select * from genre_list
order by genre_id DESC;

select * from kreuz_am
order by actor_id DESC
FETCH FIRST 300 ROWS ONLY;
select * from kreuz_dm
order by director_id DESC
FETCH FIRST 300 ROWS ONLY;
select * from kreuz_gm
order by genre_id DESC
FETCH FIRST 300 ROWS ONLY;

--------------------------------------------------validate missing parent
select title_id from kreuz_am 
where 
title_id not in (select title_id from title_list);
--------------------------------------------------no rows selected if there's no orphan
ALTER TABLE kreuz_am
  ADD CONSTRAINT pk_kz_am
  PRIMARY KEY (title_id, actor_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_am
  ADD CONSTRAINT fk_am_m
  FOREIGN KEY (title_id) REFERENCES title_list(title_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_am
  ADD CONSTRAINT fk_am_a
  FOREIGN KEY (actor_id) REFERENCES actor_list(actor_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_am ENABLE CONSTRAINT pk_kz_am;
ALTER TABLE kreuz_am ENABLE CONSTRAINT fk_am_m;
ALTER TABLE kreuz_am ENABLE CONSTRAINT fk_am_a;
------------------------------------------------------
--------------------------------------------------validate missing parent
select title_id from kreuz_dm
where
title_id not in (select title_id from title_list);
--------------------------------------------------no rows selected if there's no orphan

ALTER TABLE kreuz_dm
  ADD CONSTRAINT pk_kz_dm
  PRIMARY KEY (title_id, director_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_dm
  ADD CONSTRAINT fk_dm_m
  FOREIGN KEY (title_id) REFERENCES title_list(title_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_dm
  ADD CONSTRAINT fk_dm_d
  FOREIGN KEY (director_id) REFERENCES director_list(director_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_dm ENABLE CONSTRAINT pk_kz_dm;
ALTER TABLE kreuz_dm ENABLE CONSTRAINT fk_dm_m;
ALTER TABLE kreuz_dm ENABLE CONSTRAINT fk_dm_d;
--------------------------------------------------------
--------------------------------------------------validate missing parent
select title_id from kreuz_gm
where
title_id not in (select title_id from title_list);
--------------------------------------------------no rows selected if there's no orphan
ALTER TABLE kreuz_gm
  ADD CONSTRAINT pk_kz_gm
  PRIMARY KEY (title_id, genre_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_gm
  ADD CONSTRAINT fk_gm_m
  FOREIGN KEY (title_id) REFERENCES title_list(title_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_gm
  ADD CONSTRAINT fk_gm_g
  FOREIGN KEY (genre_id) REFERENCES genre_list(genre_id)
  DISABLE NOVALIDATE;

ALTER TABLE kreuz_gm ENABLE CONSTRAINT pk_kz_gm;
ALTER TABLE kreuz_gm ENABLE CONSTRAINT fk_gm_m;
ALTER TABLE kreuz_gm ENABLE CONSTRAINT fk_gm_g;








