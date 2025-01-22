drop database if exists pit_projekat_drugi;
create database if not exists pit_projekat_drugi;

use pit_projekat_drugi;

drop table if exists kucni_red_skole;
create table if not exists kucni_red_skole (
id int unsigned not null auto_increment,
opis varchar(1000),
primary key(id)
);

insert into kucni_red_skole values
(1, "Ученици долазе редовно и на време на час"),
(2, "За време одржавања наставе ученици, као и остала лица затечена у згради, сем помоћног особља, се не задржавају у ходницима и не ремете наставу виком, галамом и сл."),
(3, "Након завршетка наставе ученици остављају учионице у реду и пристојно се понашају напуштајући зграду"),
(4, "Уколико предметни наставник 10 минута од почетка часа не дође на час, дежурни ученик о томе обавештава дежурног наставника, педагога, секретара школе, или директора"),
(5, "Ученици воде рачуна о целокупној имовини школе и брину за одржавање чистоће учионица, кабинета и осталих просторија"),
(6, "Ученик води рачуна о свом пристојном изгледу и личној уредности и са поштовањем се односи према наставницима, радницима школе и свим лицима са којима долази у контакт"),
(7, "Ученици и наставници мобилне телефоне , МП3 плејере и сличне уређаје искључују и не користе за време часа"),
(8, "При оцењивању ученици показују стварно знање, без коришћења разних облика преписивања"),
(9, "Ученицима је забрањено пушење, употреба алкохола, наркотичких средстава или психоактивних супстанци у згради школе и испред зграде");

CREATE TABLE users (
id INT AUTO_INCREMENT,
firstName VARCHAR(50),
lastName VARCHAR(50),
email VARCHAR(100),
age INT,
PRIMARY KEY (id)
);

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `age`) VALUES
(1, 'Miloš', 'Janković', 'milos.jankovic@example.com', 30),
(2, 'Jelena', 'Nikolić', 'jelena.nikolic@example.com', 10),
(3, 'Marko', 'Popović', 'marko.popovic@example.com', 18),
(4, 'Sanja', 'Milošević', 'sanja.milosevic@example.com', 15),
(5, 'Nikola', 'Stojanović', 'nikola.stojanovic@example.com', 12),
(6, 'Sara', 'Jović', 'sara.jovic@example.com', 40),
(7, 'Milena', 'Petrović', 'milena.petrovic@example.com', 16),
(8, 'Stefan', 'Ilić', 'stefan.ilic@example.com', 20),
(9, 'Jasmina', 'Đorđević', 'jasmina.djordjevic@example.com', 44),
(10, 'Ivan', 'Vuković', 'ivan.vukovic@example.com', 42),
(11, 'Ana', 'Kovačević', 'ana.kovacevic@example.com', 37),
(12, 'Dušan', 'Marković', 'dusan.markovic@example.com', 12),
(13, 'Maja', 'Janković', 'maja.jankovic@example.com', 44),
(14, 'Nemanja', 'Nikolić', 'nemanja.nikolic@example.com', 36),
(15, 'Ivana', 'Popović', 'ivana.popovic@example.com', 39),
(16, 'Aleksandar', 'Milošević', 'aleksandar.milosevic@example.com', 42),
(17, 'Jovana', 'Stojanović', 'jovana.stojanovic@example.com', 12),
(18, 'Nikolina', 'Jović', 'nikolina.jovic@example.com', 32),
(19, 'Bojan', 'Petrović', 'bojan.petrovic@example.com', 43),
(20, 'Marija', 'Ilić', 'marija.ilic@example.com', 42);

CREATE TABLE profesori_pit (
id INT AUTO_INCREMENT,
firstName VARCHAR(50),
lastName VARCHAR(50),
email VARCHAR(100),
PRIMARY KEY (id)
);
INSERT INTO `profesori_pit` (`id`, `firstName`, `lastName`, `email`) VALUES
(1, 'Miloš', 'Radonjić', 'milos.radonjic@example.com'),
(2, 'Jelena', 'Radović', 'jelena.radovic@example.com'),
(3, 'Jelena', 'Miljić', 'jelena.milic@example.com');

CREATE TABLE Hrana (
id INT AUTO_INCREMENT,
naziv VARCHAR(255),
opis VARCHAR(255),
tip VARCHAR(255),
PRIMARY KEY (id)
);

INSERT INTO Hrana (naziv, opis, tip)
VALUES
('Čokolada', 'Slatka poslastica', 'Slatko'),
('Ljuta paprika', 'Oštra paprika', 'Ljuto'),
('Limun', 'Kisela citrusna voćka', 'Kiselo'),
('Kafa', 'Gorka napitak', 'Gorko'),
('Med', 'Slatki prirodni zaslađivač', 'Slatko'),
('Maslinovo ulje', 'Ulje dobijeno od maslina', 'Gorko'),
('Grejpfrut', 'Kiselo voće sa gorčinom', 'Kiselo'),
('Cimet', 'Aromatični začin', 'Gorko'),
('Jagoda', 'Slatko crveno voće', 'Slatko'),
('Tabasco sos', 'Vrlo ljut sos', 'Ljuto');