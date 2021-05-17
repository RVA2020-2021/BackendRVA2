-- ARTIKL PODACI

INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Moja Kravica sveze mleko, 1L', 'AD Imlek');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Moja Kravica svezi sir, 1kg', 'AD Imlek');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Jogurt, 1l', 'AD Imlek');

INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Persil Regular prasak, 2kg', 'Henkel Srbija');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Persil Duo Caps pak', 'Henkel Srbija');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Persil Regular gel, 1l', 'Henkel Srbija');

INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Jagoda', 'Fruit DOO');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Jabuka', 'Fruit DOO');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Breskva', 'Fruit DOO');

INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Slag pena', 'CENTROPROIZVOD');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Puding jagoda', 'CENTROPROIZVOD');
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (nextval('artikl_seq'), 'Puding vanila', 'CENTROPROIZVOD');

-- DOBAVLJAC PODACI

INSERT INTO "dobavljac"("id", "naziv", "adresa", "kontakt")
VALUES (nextval('dobavljac_seq'), 'AD Imlek', 'Industrijska zona BB, Beograd', '+3812133344');
INSERT INTO "dobavljac"("id", "naziv", "adresa", "kontakt")
VALUES (nextval('dobavljac_seq'), 'Henkel Srbija', 'Industrijska zona 55, Novi Sad', '+38121777111');
INSERT INTO "dobavljac"("id", "naziv", "adresa", "kontakt")
VALUES (nextval('dobavljac_seq'), 'Fruit DOO', 'Bulevar Oslobodjenja 33, Beograd', '+38121999222');
INSERT INTO "dobavljac"("id", "naziv", "adresa", "kontakt")
VALUES (nextval('dobavljac_seq'), 'CENTROPROIZVOD', 'Dobanovacki put, Surcin', '+38121222111');

-- PORUDZBINA PODACI

INSERT INTO "porudzbina"("id", "datum", "isporuceno", "dobavljac", "iznos", "placeno")
VALUES (nextval('porudzbina_seq'), to_date('01.03.2020.', 'dd.mm.yyyy.'), to_date('05.03.2020.', 'dd.mm.yyyy.'), 1, 0, TRUE);
INSERT INTO "porudzbina"("id", "datum", "isporuceno", "dobavljac", "iznos", "placeno")
VALUES (nextval('porudzbina_seq'), to_date('10.03.2020.', 'dd.mm.yyyy.'), to_date('15.03.2020.', 'dd.mm.yyyy.'), 2, 1000, FALSE);
INSERT INTO "porudzbina"("id", "datum", "isporuceno", "dobavljac", "iznos", "placeno")
VALUES (nextval('porudzbina_seq'), to_date('01.01.2020.', 'dd.mm.yyyy.'), to_date('01.01.2021.', 'dd.mm.yyyy.'), 3, 0, FALSE);
INSERT INTO "porudzbina"("id", "datum", "isporuceno", "dobavljac", "iznos", "placeno")
VALUES (nextval('porudzbina_seq'), to_date('01.05.2020.', 'dd.mm.yyyy.'), to_date('05.05.2020.', 'dd.mm.yyyy.'), 4, 0, TRUE);
INSERT INTO "porudzbina"("id", "datum", "isporuceno", "dobavljac", "iznos", "placeno")
VALUES (nextval('porudzbina_seq'), to_date('01.03.2020.', 'dd.mm.yyyy.'), to_date('05.03.2020.', 'dd.mm.yyyy.'), 4, 0, FALSE);

-- STAVKA PORUDZBINE PODACI

INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 1, 1, 1, 20, 'komad', 100);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 1, 2, 2, 10, 'komad', 300);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 1, 3, 3, 15, 'komad', 120);

INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 2, 1, 4, 100, 'komad', 400);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 2, 2, 5, 60, 'komad', 350);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 2, 3, 6, 30, 'komad', 300);

INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 3, 1, 7, 50, 'kg', 80);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 3, 2, 8, 30, 'kg', 120);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 3, 3, 9, 100, 'kg', 150);

INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 4, 1, 10, 30, 'komad', 30);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 4, 2, 11, 50, 'komad', 40);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 4, 3, 12, 40, 'komad', 35);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 5, 1, 10, 60, 'komad', 30);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (nextval('stavka_porudzbine_seq'), 5, 2, 11, 130, 'komad', 40);

--Test podaci - OBAVEZNO!
INSERT INTO "artikl"("id", "naziv", "proizvodjac")
VALUES (-100, 'TestNaziv', 'TestProizv');
INSERT INTO "dobavljac"("id", "naziv", "adresa", "kontakt")
VALUES (-100, 'TestNaziv', 'TestAdr', '+38121111111');
INSERT INTO "porudzbina"("id", "datum", "isporuceno", "dobavljac", "iznos", "placeno")
VALUES (-100, to_date('01.01.2020.', 'dd.mm.yyyy.'), to_date('01.01.2021.', 'dd.mm.yyyy.'), 1, 0, TRUE);
INSERT INTO "stavka_porudzbine"("id", "porudzbina", "redni_broj", "artikl", "kolicina", "jedinica_mere", "cena")
VALUES (-100, 1, 1, 1, 1, 'komad', 100);