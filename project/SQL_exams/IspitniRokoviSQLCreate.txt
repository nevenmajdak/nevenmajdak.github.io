Alter session set nls_date_language=american;

CREATE TABLE "KATEDRE" (
	"ID_KATEDRE" NUMBER(4,0) NOT NULL UNIQUE,
	"KATEDRE" VARCHAR2(50 BYTE)
	);

CREATE TABLE "PREDMETI" (
	"ID_PREDMET" NUMBER(4,0) NOT NULL UNIQUE,
	"PREDMET" VARCHAR2(60 BYTE),
	"SIFRA" VARCHAR2(50 BYTE),
	"OBV_IZB" VARCHAR2(8 BYTE),
	"ID_KAT" NUMBER(4,0),
	"ID_PROF" NUMBER(4,0),
	"ETSC" NUMBER(2,0),
	"GODINA" NUMBER(2,0)
	);

CREATE TABLE "PRIJAVA" (
	"ID_PRIJAVA" NUMBER(4,0) NOT NULL UNIQUE,
	"JMBAG" VARCHAR2(16 BYTE),
	"ID_PREDMET" NUMBER(4,0),
	"IZLAZAK" NUMBER(2,0),
	"ID_ISPITTERMIN" NUMBER(4,0)
	);

CREATE TABLE "PROFESORI" (
	"ID_PROFESOR" NUMBER(4,0) NOT NULL UNIQUE,
	"TITULA" VARCHAR2(32 BYTE),
	"IME" VARCHAR2(50 BYTE),
	"PREZIME" VARCHAR2(50 BYTE),
	"ID_KAT" NUMBER(4,0)
	);

CREATE TABLE "STUDENTI" (
	"JMBAG" VARCHAR2(16 BYTE) NOT NULL UNIQUE,
	"IME" VARCHAR2(50 BYTE),
	"PREZIME" VARCHAR2(50 BYTE),
	"GODINA" NUMBER(2,0)
	);

CREATE TABLE "TERMINI" (
	"ID_TERMINI" NUMBER(4,0) NOT NULL UNIQUE,
	"ID_PREDMET" NUMBER(4,0),
	"ROK_DATUM" DATE,
	"ROK_VRIJEME" VARCHAR2(20 BYTE),
	"ROK_DVORANA" VARCHAR2(50 BYTE)
	);



insert into KATEDRE values(1, 'DEMOGRAFIJA');
insert into KATEDRE values(2, 'EKONOMSKA TEORIJA');
insert into KATEDRE values(3, 'EKONOMIKA PODUZEĆA');
insert into KATEDRE values(4, 'INFORMATIKA');
insert into KATEDRE values(5, 'FINANCIJE');
insert into KATEDRE values(6, 'MAKROEKONOMIJA I GOSPODARSKI RAZVOJ');
insert into KATEDRE values(7, 'MARKETING');
insert into KATEDRE values(8, 'MATEMATIKA');
insert into KATEDRE values(9, 'MEĐUNARODNA EKONOMIJA');
insert into KATEDRE values(10, 'POSLOVNI STRANI JEZICI');
insert into KATEDRE values(11, 'ORGANIZACIJA I MENADŽMENT');
insert into KATEDRE values(12, 'PRAVO');
insert into KATEDRE values(13, 'RAČUNOVODSTVO');
insert into KATEDRE values(14, 'STATISTIKA');
insert into KATEDRE values(15, 'TRGOVINA');
insert into KATEDRE values(16, 'TURIZAM');
insert into KATEDRE values(17, 'TJELESNA I ZDRAVSTVENA KULTURA');

insert into PREDMETI values(1, 'Informatizacija poslovnih procesa', '35377', 'IZB', 4, 1, 6, 5);
insert into PREDMETI values(2, 'Sustav upravljanja poslovnih procesa', '71821', 'OBV', 4, 1, 5, 5);
insert into PREDMETI values(3, 'Upravljanje poslovnim podacima', '62932', 'OBV', 4, 4, 6, 5);
insert into PREDMETI values(4, 'Menadžerske simulacijske igre', '62940', 'IZB', 4, 7, 5, 5);
insert into PREDMETI values(5, 'Otkrivanje znanja u bazama podataka', '58570, 62042,71822', 'IZB', 4, 7, 5, 5);
insert into PREDMETI values(6, 'Revizija informacijskih sustava', '83124, 128702', 'IZB', 4, 9, 5, 5);
insert into PREDMETI values(7, 'Elektroničko poslovanje', '58509/142310', 'OBV', 4, 6, 6, 5);
insert into PREDMETI values(8, 'Informatički menadžment', '58508/142744', 'OBV', 4, 10, 6, 5);
insert into PREDMETI values(9, 'Upravljanje podacima', '58505, 128699', 'OBV', 4, 11, 3, 5);
insert into PREDMETI values(10, 'Metode potpore odlučivanju', '83123, 58507,63139, 128701', 'OBV', 4, 12, 8, 5);
insert into PREDMETI values(11, 'Marketing inovacija ', '62917', 'IZB', 7, 13, 5, 5);
insert into PREDMETI values(12, 'Poslovna sigurnost', '58564', 'IZB', 11, 2, 4, 5);
insert into PREDMETI values(13, 'Zaštita potrošača', '58579', 'IZB', 15, 5, 5, 5);
insert into PREDMETI values(14, 'Statistički modeli odlučivanja', '83295', 'IZB', 14, 3, 5, 5);
insert into PREDMETI values(15, 'Nelinearno programiranje', '62063', 'IZB', 8, 8, 8, 5);
insert into PREDMETI values(16, 'Baze Podataka', '58694', 'IZB', 4, 11, 4, 3);

insert into PROFESORI values(1, 'Prof.dr.sc.', 'Vesna', 'Bosilj Vukšić', 4);
insert into PROFESORI values(2, 'Doc.dr.sc.', 'Marijan', 'Cingula', 11);
insert into PROFESORI values(3, 'Prof.dr.sc.', 'Mirjana ', 'Čižmešija', 14);
insert into PROFESORI values(4, 'Prof.dr.sc.', 'Katarina', 'Ćurko', 4);
insert into PROFESORI values(5, 'Doc.dr.sc.', 'Mario', 'Dunković', 15);
insert into PROFESORI values(6, 'Doc.dr.sc.', 'Božidar', 'Jaković', 4);
insert into PROFESORI values(7, 'Prof.dr.sc.', 'Mirjana ', 'Pejić Bach', 4);
insert into PROFESORI values(8, 'Doc.dr.sc.', 'Krunoslav', 'Puljić', 8);
insert into PROFESORI values(9, 'Prof.dr.sc.', 'Mario', 'Spremić', 4);
insert into PROFESORI values(10, 'Prof.dr.sc.', 'Velimir', 'Srića', 4);
insert into PROFESORI values(11, 'Prof.dr.sc.', 'Mladen', 'Varga', 4);
insert into PROFESORI values(12, 'Doc.dr.sc.', 'Nikola', 'Vlahović', 4);
insert into PROFESORI values(13, 'Doc.dr.sc.', 'Goran', 'Vlašić', 7);

insert into STUDENTI values('0014536982', 'Tin', 'Tinković', 5);
insert into STUDENTI values('0024986566', 'Pero', 'Perić', 5);
insert into STUDENTI values('0032459856', 'Olivija', 'Olić', 5);
insert into STUDENTI values('0043698726', 'Zdravko', 'Zdravić', 5);
insert into STUDENTI values('0052938263', 'Boris', 'Bašić', 5);
insert into STUDENTI values('0053686835', 'Ivana', 'Ivanov', 5);
insert into STUDENTI values('0054466848', 'Silvija', 'Sivić', 5);
insert into STUDENTI values('0075223652', 'Karla', 'Karlović', 5);
insert into STUDENTI values('0076477682', 'Ivo', 'Ivić', 5);
insert into STUDENTI values('0077457673', 'Maja', 'Majić', 5);
insert into STUDENTI values('0078552353', 'Filip', 'Filipec', 5);
insert into STUDENTI values('0079568451', 'Anita', 'Anić', 5);
insert into STUDENTI values('0078288677', 'Marija', 'Dolenec', 3);
insert into STUDENTI values('0063567653', 'Matija', 'Lazo', 4);

insert into TERMINI values(1, 1, '1-FEB-2017', '17-18', 'DV 1');
insert into TERMINI values(2, 2, '1-FEB-2017', '15-16', 'DV 1');
insert into TERMINI values(3, 3, '2-FEB-2017', '17-18', 'DV 4');
insert into TERMINI values(4, 4, '1-FEB-2017', '14-15', 'DV 12');
insert into TERMINI values(5, 5, '1-FEB-2017', '16-18', 'DV 12');
insert into TERMINI values(6, 6, '2-FEB-2017', '14-16', 'DV 2');
insert into TERMINI values(7, 7, '2-FEB-2017', '14-15', 'DV 2');
insert into TERMINI values(8, 8, '2-FEB-2017', '8-14', 'DV 2');
insert into TERMINI values(9, 9, '1-FEB-2017', '8-14', 'DV 3');
insert into TERMINI values(10, 10, '3-FEB-2017', '16-17', 'DV 5');
insert into TERMINI values(11, 11, '8-FEB-2017', '14-15', 'DV 25');
insert into TERMINI values(12, 12, '7-FEB-2017', '13-14', 'DV 20');
insert into TERMINI values(13, 13, '6-FEB-2017', '13-14', 'DV 25');
insert into TERMINI values(14, 14, '3-FEB-2017', '14-15', 'DV 1,3,9,10,11');
insert into TERMINI values(15, 15, '8-FEB-2017', '15-16', 'DV 1,3,9,10,11');
insert into TERMINI values(16, 1, '14-FEB-2017', '17-18', 'DV 1');
insert into TERMINI values(17, 2, '14-FEB-2017', '13-14', 'DV 1');
insert into TERMINI values(18, 3, '15-FEB-2017', '11-12', 'DV 4 ');
insert into TERMINI values(19, 4, '14-FEB-2017', '9-10', 'DV 9');
insert into TERMINI values(20, 5, '14-FEB-2017', '10-12', 'DV 9');
insert into TERMINI values(21, 6, '15-FEB-2017', '10-11', 'DV 2');
insert into TERMINI values(22, 7, '15-FEB-2017', '8-9', 'DV 2');
insert into TERMINI values(23, 8, '15-FEB-2017', '14-20', 'DV 2');
insert into TERMINI values(24, 9, '14-FEB-2017', '14-20', 'DV 3');
insert into TERMINI values(25, 10, '16-FEB-2017', '16-17', 'DV 5');
insert into TERMINI values(26, 11, '24-FEB-2017', '16-17', 'Dv 25');
insert into TERMINI values(27, 12, '20-FEB-2017', '10-11', 'DV 20');
insert into TERMINI values(28, 13, '17-FEB-2017', '10-11', 'DV 25');
insert into TERMINI values(29, 14, '16-FEB-2017', '12-13', 'DV 1,3,9,10,11');
insert into TERMINI values(30, 15, '21-FEB-2017', '13-14', 'DV 1,3,9,10,11');
insert into TERMINI values(31, 16, '1-FEB-2017', '17-18', 'DV 3');
insert into TERMINI values(32, 16, '14-FEB-2017', '11-12', 'DV 3');

insert into PRIJAVA values(1, '0076477682', 1, 2, 1);
insert into PRIJAVA values(2, '0076477682', 2, 1, 2);
insert into PRIJAVA values(3, '0077457673', 3, 1, 18);
insert into PRIJAVA values(4, '0024986566', 4, 1, 19);
insert into PRIJAVA values(5, '0054466848', 5, 1, 5);
insert into PRIJAVA values(6, '0079568451', 6, 1, 6);
insert into PRIJAVA values(7, '0079568451', 7, 2, 7);
insert into PRIJAVA values(8, '0053686835', 8, 3, 8);
insert into PRIJAVA values(9, '0052938263', 9, 1, 9);
insert into PRIJAVA values(10, '0078552353', 10, 1, 10);
insert into PRIJAVA values(11, '0075223652', 11, 1, 26);
insert into PRIJAVA values(12, '0075223652', 12, 1, 27);
insert into PRIJAVA values(13, '0032459856', 13, 1, 28);
insert into PRIJAVA values(14, '0014536982', 14, 1, 14);
insert into PRIJAVA values(15, '0043698726', 15, 2, 15);

