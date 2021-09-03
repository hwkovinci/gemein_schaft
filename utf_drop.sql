



ALTER TABLE kreuz_am DISABLE CONSTRAINT pk_kz_am;
ALTER TABLE kreuz_am DISABLE CONSTRAINT fk_am_m;
ALTER TABLE kreuz_am DISABLE CONSTRAINT fk_am_a;

DROP TABLE kreuz_am;
DROP TABLE kreuz_am_schema;

ALTER TABLE kreuz_dm DISABLE CONSTRAINT pk_kz_dm;
ALTER TABLE kreuz_dm DISABLE CONSTRAINT fk_dm_m;
ALTER TABLE kreuz_dm DISABLE CONSTRAINT fk_dm_d;

DROP TABLE kreuz_dm;
DROP TABLE kreuz_dm_schema;

ALTER TABLE kreuz_gm DISABLE CONSTRAINT pk_kz_gm;
ALTER TABLE kreuz_gm DISABLE CONSTRAINT fk_gm_m;
ALTER TABLE kreuz_gm DISABLE CONSTRAINT fk_gm_g;

DROP TABLE kreuz_gm;
DROP TABLE kreuz_gm_schema;

DROP TABLE actor_list;
DROP TABLE director_list;
DROP TABLE genre_list;
DROP TABLE actor_schema;
DROP TABLE director_schema;
DROP TABLE genre_schema;
DROP TABLE title_list;
DROP TABLE title_schema;
exit;


