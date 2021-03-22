DROP TABLE IF EXISTS artikl CASCADE;
DROP TABLE IF EXISTS dobavljac CASCADE;
DROP TABLE IF EXISTS porudzbina CASCADE;
DROP TABLE IF EXISTS stavka_porudzbine CASCADE;

DROP SEQUENCE IF EXISTS artikl_seq;
DROP SEQUENCE IF EXISTS dobavljac_seq;
DROP SEQUENCE IF EXISTS stavka_porudzbine_seq;
DROP SEQUENCE IF EXISTS porudzbina_seq;

CREATE TABLE dobavljac(
	id integer not null,
	naziv varchar(50),
	adresa varchar(200),
	kontakt varchar(100)
);

CREATE TABLE artikl(
	id integer not null,
	naziv varchar(50),
	proizvodjac varchar(50)
);

CREATE TABLE porudzbina(
	id integer not null,
	datum date,
	isporuceno date,
	iznos numeric,
	placeno boolean,
	dobavljac integer not null
);

CREATE TABLE stavka_porudzbine(
	id integer not null,
	redni_broj integer not null,
	kolicina numeric,
	jedinica_mere varchar(20),
	cena numeric,
	porudzbina integer not null,
	artikl integer not null
);

ALTER TABLE artikl ADD CONSTRAINT pk_artikl PRIMARY KEY(id);
ALTER TABLE dobavljac ADD CONSTRAINT pk_dobavljac PRIMARY KEY(id);
ALTER TABLE porudzbina ADD CONSTRAINT pk_porudzbina PRIMARY KEY(id);
ALTER TABLE stavka_porudzbine ADD CONSTRAINT pk_stavka_porudzbine PRIMARY KEY(id);

ALTER TABLE porudzbina ADD CONSTRAINT fk_porudzbina_dobavljac FOREIGN KEY(dobavljac) REFERENCES dobavljac(id);
ALTER TABLE stavka_porudzbine ADD CONSTRAINT fk_stavka_porudzbine_porudzbina FOREIGN KEY(porudzbina) REFERENCES porudzbina(id);
ALTER TABLE stavka_porudzbine ADD CONSTRAINT fk_stavka_porudzbine_artikl FOREIGN KEY(artikl) REFERENCES artikl(id);

CREATE INDEX idxpk_dobavljac ON dobavljac(id);
CREATE INDEX idxpk_artikl ON artikl(id);
CREATE INDEX idxpk_porudzbina ON porudzbina(id);
CREATE INDEX idxpk_stavka_porudzbine ON stavka_porudzbine(id);

CREATE INDEX idxfk_porudzbina_dobavljac ON porudzbina(dobavljac);
CREATE INDEX idxfk_stavka_porudzbine_porudzbina ON stavka_porudzbine(porudzbina);
CREATE INDEX idxfk_stavka_porudzbine_artikl ON stavka_porudzbine(artikl);

CREATE SEQUENCE artikl_seq INCREMENT 1;
CREATE SEQUENCE dobavljac_seq INCREMENT 1;
CREATE SEQUENCE porudzbina_seq INCREMENT 1;
CREATE SEQUENCE stavka_porudzbine_seq INCREMENT 1;

