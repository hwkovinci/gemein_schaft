DROP TABLE user_list;
DROP TABLE movie_fav;

create table user_list(
user_id NUMBER(4) PRIMARY KEY,
user_name VARCHAR2(10),
user_nick VARCHAR2(10),
user_passwd VARCHAR2(20));

create table movie_fav(
title_id VARCHAR2(20),
user_id NUMBER(4),
CONSTRAINT fk_fav_tit FOREIGN KEY(title_id)
      REFERENCES title_list( title_id )
      ON DELETE CASCADE,
CONSTRAINT fk_tit_fav FOREIGN KEY( user_id )
      REFERENCES user_list( user_id )
      ON DELETE CASCADE);

ALTER TABLE movie_fav ENABLE CONSTRAINT fk_fav_tit;
ALTER TABLE movie_fav ENABLE CONSTRAINT fk_tit_fav;



