
drop table Pagamento;
drop table Prenotazione;
drop table Biglietto;
drop table Viaggio;
drop table Tratta;
drop table Utente;
drop table Treno;
drop table Stazione;



-- Creazione delle tabelle
CREATE TABLE Utente (
    id_utente INT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    email VARCHAR(100),
    data_nascita datetime,
    cellulare VARCHAR(50) NULL,
    via VARCHAR(100) NULL,
    citta VARCHAR(50) NULL
);

CREATE TABLE Treno (
    id_treno INT PRIMARY KEY,
    codice VARCHAR(10),
    tipo VARCHAR(30),
    capienza INT
);

CREATE TABLE Stazione (
    id_stazione INT PRIMARY KEY,
    codice VARCHAR(20),
    nome VARCHAR(100),
    citta VARCHAR(50)
);

CREATE TABLE Tratta (
    id_tratta INT PRIMARY KEY,
    nome_tratta VARCHAR(50),
    minuti_tratta DECIMAL(6,2) null,
    id_stazione_partenza INT,
    id_stazione_arrivo INT,
    FOREIGN KEY (id_stazione_partenza) REFERENCES Stazione(id_stazione),
    FOREIGN KEY (id_stazione_arrivo) REFERENCES Stazione(id_stazione)
);

CREATE TABLE Viaggio (
    id_viaggio INT PRIMARY KEY,
    id_tratta INT,
    id_treno INT,
    data_partenza DATETIME,
    ora_partenza DATETIME null,
    FOREIGN KEY (id_tratta) REFERENCES Tratta(id_tratta),
    FOREIGN KEY (id_treno) REFERENCES Treno(id_treno)
);

CREATE TABLE Biglietto (
    id_biglietto INT PRIMARY KEY,
    id_utente INT,
    data_emissione DATE,
    ora_emissione DATETIME
    FOREIGN KEY (id_utente) REFERENCES Utente(id_utente)
);

CREATE TABLE Prenotazione (
    id_prenotazione INT PRIMARY KEY,
    id_biglietto INT,
    id_viaggio INT, 
    numero_posto INT,
    classe VARCHAR(10) null,
    costo DECIMAL(6,2) ,
    stato_prenotazione VARCHAR(10),
    FOREIGN KEY (id_biglietto) REFERENCES Biglietto(id_biglietto),
    FOREIGN KEY (id_viaggio) REFERENCES Viaggio(id_viaggio)
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    id_biglietto INT,
    importo DECIMAL(6,2),
    metodo VARCHAR(50),
    stato_pagamento VARCHAR(20),
    data_pagamento DATE,
    FOREIGN KEY (id_biglietto) REFERENCES Biglietto(id_biglietto)
);

-- Inserimento stazioni (capoluoghi di provincia)
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (1, 'TO', 'Stazione Torino', 'Torino');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (2, 'MI', 'Stazione Milano', 'Milano');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (3, 'VE', 'Stazione Venezia', 'Venezia');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (4, 'GE', 'Stazione Genova', 'Genova');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (5, 'BO', 'Stazione Bologna', 'Bologna');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (6, 'FI', 'Stazione Firenze', 'Firenze');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (7, 'AN', 'Stazione Ancona', 'Ancona');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (8, 'PG','Stazione Perugia', 'Perugia');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (9, 'RM', 'Stazione Roma', 'Roma');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (10, 'AQ', 'Stazione Aquila', 'Aquila');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (11, 'CB', 'Stazione Campobasso', 'Campobasso');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (12, 'NA', 'Stazione Napoli', 'Napoli');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (13, 'BA', 'Stazione Bari', 'Bari');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (14, 'PT', 'Stazione Potenza', 'Potenza');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (15, 'CZ', 'Stazione Catanzaro', 'Catanzaro');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (16, 'PA', 'Stazione Palermo', 'Palermo');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (17, 'CA', 'Stazione Cagliari', 'Cagliari');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (18, 'TS', 'Stazione Trieste', 'Trieste');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (19, 'AO', 'Stazione Aosta', 'Aosta');
INSERT INTO Stazione (id_stazione, codice, nome, citta) VALUES (20, 'TR', 'Stazione Trento', 'Trento');


-- Inserimento treni
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (1, 'TRN001', 'Regionale', 113);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (2, 'TRN002', 'Intercity', 267);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (3, 'TRN003', 'Intercity', 276);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (4, 'TRN004', 'Frecciarossa', 308);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (5, 'TRN005', 'Regionale', 399);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (6, 'TRN006', 'Intercity', 141);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (7, 'TRN007', 'Intercity', 162);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (8, 'TRN008', 'Intercity', 165);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (9, 'TRN009', 'Frecciarossa', 184);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (10, 'TRN010', 'Frecciarossa', 210);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (11, 'TRN011', 'Intercity', 147);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (12, 'TRN012', 'Frecciarossa', 265);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (13, 'TRN013', 'Regionale', 316);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (14, 'TRN014', 'Regionale', 299);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (15, 'TRN015', 'Frecciarossa', 184);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (16, 'TRN016', 'Intercity', 288);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (17, 'TRN017', 'Intercity', 267);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (18, 'TRN018', 'Frecciarossa', 299);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (19, 'TRN019', 'Intercity', 307);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (20, 'TRN020', 'Regionale', 109);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (21, 'TRN021', 'Frecciarossa', 398);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (22, 'TRN022', 'Intercity', 324);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (23, 'TRN023', 'Frecciarossa', 353);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (24, 'TRN024', 'Intercity', 246);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (25, 'TRN025', 'Frecciarossa', 278);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (26, 'TRN026', 'Intercity', 186);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (27, 'TRN027', 'Regionale', 195);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (28, 'TRN028', 'Frecciarossa', 391);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (29, 'TRN029', 'Intercity', 290);
INSERT INTO Treno (id_treno, codice, tipo, capienza) VALUES (30, 'TRN030', 'Intercity', 164);

-- Inserimento utenti
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (1, 'Nome1', 'Cognome1', 'user1@esempio.com', '2014-11-06');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (2, 'Nome2', 'Cognome2', 'user2@esempio.com', '2002-03-21');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (3, 'Nome3', 'Cognome3', 'user3@esempio.com', '1995-08-31');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (4, 'Nome4', 'Cognome4', 'user4@esempio.com', '2001-06-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (5, 'Nome5', 'Cognome5', 'user5@esempio.com', '2013-10-30');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (6, 'Nome6', 'Cognome6', 'user6@esempio.com', '2003-12-11');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (7, 'Nome7', 'Cognome7', 'user7@esempio.com', '2001-09-20');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (8, 'Nome8', 'Cognome8', 'user8@esempio.com', '2008-08-16');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (9, 'Nome9', 'Cognome9', 'user9@esempio.com', '2006-08-30');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (10, 'Nome10', 'Cognome10', 'user10@esempio.com', '2003-01-20');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (11, 'Nome11', 'Cognome11', 'user11@esempio.com', '2014-01-13');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (12, 'Nome12', 'Cognome12', 'user12@esempio.com', '1990-08-16');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (13, 'Nome13', 'Cognome13', 'user13@esempio.com', '2014-02-06');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (14, 'Nome14', 'Cognome14', 'user14@esempio.com', '2002-07-24');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (15, 'Nome15', 'Cognome15', 'user15@esempio.com', '2007-12-22');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (16, 'Nome16', 'Cognome16', 'user16@esempio.com', '2018-03-13');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (17, 'Nome17', 'Cognome17', 'user17@esempio.com', '1989-04-24');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (18, 'Nome18', 'Cognome18', 'user18@esempio.com', '1992-06-21');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (19, 'Nome19', 'Cognome19', 'user19@esempio.com', '2004-02-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (20, 'Nome20', 'Cognome20', 'user20@esempio.com', '1997-11-27');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (21, 'Nome21', 'Cognome21', 'user21@esempio.com', '1990-05-03');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (22, 'Nome22', 'Cognome22', 'user22@esempio.com', '2014-06-09');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (23, 'Nome23', 'Cognome23', 'user23@esempio.com', '2006-01-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (24, 'Nome24', 'Cognome24', 'user24@esempio.com', '1998-01-24');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (25, 'Nome25', 'Cognome25', 'user25@esempio.com', '2007-08-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (26, 'Nome26', 'Cognome26', 'user26@esempio.com', '2010-07-12');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (27, 'Nome27', 'Cognome27', 'user27@esempio.com', '2018-11-13');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (28, 'Nome28', 'Cognome28', 'user28@esempio.com', '1990-02-19');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (29, 'Nome29', 'Cognome29', 'user29@esempio.com', '2012-05-14');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (30, 'Nome30', 'Cognome30', 'user30@esempio.com', '1992-11-05');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (31, 'Nome31', 'Cognome31', 'user31@esempio.com', '2014-12-03');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (32, 'Nome32', 'Cognome32', 'user32@esempio.com', '2009-09-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (33, 'Nome33', 'Cognome33', 'user33@esempio.com', '1991-03-25');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (34, 'Nome34', 'Cognome34', 'user34@esempio.com', '1989-09-12');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (35, 'Nome35', 'Cognome35', 'user35@esempio.com', '2004-08-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (36, 'Nome36', 'Cognome36', 'user36@esempio.com', '1997-02-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (37, 'Nome37', 'Cognome37', 'user37@esempio.com', '2013-06-15');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (38, 'Nome38', 'Cognome38', 'user38@esempio.com', '1994-07-28');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (39, 'Nome39', 'Cognome39', 'user39@esempio.com', '2017-05-30');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (40, 'Nome40', 'Cognome40', 'user40@esempio.com', '2013-06-24');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (41, 'Nome41', 'Cognome41', 'user41@esempio.com', '2003-01-09');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (42, 'Nome42', 'Cognome42', 'user42@esempio.com', '2004-06-24');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (43, 'Nome43', 'Cognome43', 'user43@esempio.com', '2014-09-04');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (44, 'Nome44', 'Cognome44', 'user44@esempio.com', '2009-07-17');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (45, 'Nome45', 'Cognome45', 'user45@esempio.com', '2012-01-20');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (46, 'Nome46', 'Cognome46', 'user46@esempio.com', '2004-10-28');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (47, 'Nome47', 'Cognome47', 'user47@esempio.com', '1993-01-18');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (48, 'Nome48', 'Cognome48', 'user48@esempio.com', '2019-01-03');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (49, 'Nome49', 'Cognome49', 'user49@esempio.com', '1998-01-10');
INSERT INTO Utente (id_utente, nome, cognome, email, data_nascita) VALUES (50, 'Nome50', 'Cognome50', 'user50@esempio.com', '2003-03-10');

-- Inserimento tratte e fermate
INSERT INTO Tratta (id_tratta, nome_tratta, id_stazione_partenza, id_stazione_arrivo) VALUES (1, 'Tratta1',1, 19);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (2,'Tratta2', 7, 8);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (3,'Tratta3', 12, 10);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (4, 'Tratta4',19, 4);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (5,'Tratta5', 4, 17);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (6, 'Tratta6',11, 18);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (7, 'Tratta7',11, 1);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (8,'Tratta8', 4, 16);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (9, 'Tratta9', 20, 9);
INSERT INTO Tratta (id_tratta, nome_tratta,id_stazione_partenza, id_stazione_arrivo) VALUES (10,'Tratta10',  11, 8);
-- Inserimento viaggi
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (1, 1, 29, '2024-06-29 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (2, 1, 29, '2024-06-06 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (3, 2, 30, '2024-07-06 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (4, 2, 10, '2024-07-20 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (5, 3, 8, '2024-06-07 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (6, 3, 27, '2024-06-19 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (7, 4, 15, '2024-06-26 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (8, 4, 18, '2024-07-02 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (9, 5, 18, '2024-07-12 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (10, 5, 26, '2024-07-27 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (11, 6, 8, '2024-06-08 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (12, 6, 18, '2024-06-08 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (13, 7, 6, '2024-06-03 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (14, 7, 1, '2024-06-27 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (15, 8, 18, '2024-07-02 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (16, 8, 6, '2024-06-17 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (17, 9, 29, '2024-07-19 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (18, 9, 4, '2024-07-10 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (19, 10, 13, '2024-06-26 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (20, 10, 5, '2024-06-05 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (21, 6, 7, '2024-06-08 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (22, 6, 11, '2024-06-08 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (23, 7, 9, '2024-06-03 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (24, 7, 3, '2024-06-27 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (25, 8, 5, '2024-07-02 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (26, 8, 2, '2024-06-17 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (27, 1, 28, '2024-07-19 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (28, 9, 4, '2024-07-10 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (29, 8, 13, '2024-06-26 00:00:00');
INSERT INTO Viaggio (id_viaggio, id_tratta, id_treno, data_partenza) VALUES (30, 9, 5, '2024-06-05 00:00:00');

-- Inserimento biglietti, prenotazioni e pagamenti
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (1, 45, '2020-07-21', '2020-07-21 23:33:25');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (2, 8, '2020-11-26', '2020-11-26 10:59:52');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (3, 45, '2020-11-14', '2020-11-14 04:53:50');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (4, 45, '2020-06-28', '2020-06-28 13:05:22');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (5, 31, '2020-07-11', '2020-07-11 22:43:25');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (6, 26, '2020-09-14', '2020-09-14 10:47:44');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (7, 9, '2020-09-26', '2020-09-26 03:45:30');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (8, 18, '2020-12-17', '2020-12-17 18:10:41');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (9, 4, '2020-08-10', '2020-08-10 09:18:14');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (10, 42, '2020-07-29', '2020-07-29 17:41:56');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (11, 31, '2020-07-12', '2020-07-12 10:45:55');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (12, 19, '2020-10-17', '2020-10-17 01:36:05');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (13, 18, '2020-06-06', '2020-06-06 19:36:34');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (14, 1, '2020-09-13', '2020-09-13 12:22:53');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (15, 49, '2020-11-08', '2020-11-08 15:32:59');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (16, 31, '2020-06-24', '2020-06-24 01:21:20');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (17, 44, '2020-12-25', '2020-12-25 15:52:39');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (18, 38, '2020-11-12', '2020-11-12 00:14:39');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (19, 12, '2020-06-05', '2020-06-05 04:05:12');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (20, 16, '2020-08-05', '2020-08-05 11:54:16');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (21, 16, '2020-10-02', '2020-10-02 18:05:09');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (22, 21, '2020-11-24', '2020-11-24 01:15:36');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (23, 48, '2020-08-24', '2020-08-24 16:58:02');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (24, 34, '2020-08-18', '2020-08-18 18:06:55');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (25, 3, '2020-12-06', '2020-12-06 01:34:00');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (26, 19, '2020-10-09', '2020-10-09 07:31:32');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (27, 15, '2020-09-15', '2020-09-15 14:31:35');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (28, 13, '2020-12-15', '2020-12-15 22:04:05');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (29, 37, '2020-12-07', '2020-12-07 08:29:45');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (30, 44, '2020-06-11', '2020-06-11 07:45:45');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (31, 11, '2020-10-28', '2020-10-28 07:32:43');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (32, 37, '2020-10-21', '2020-10-21 16:52:31');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (33, 2, '2020-10-03', '2020-10-03 04:49:47');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (34, 8, '2020-07-19', '2020-07-19 01:19:00');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (35, 20, '2020-09-15', '2020-09-15 07:09:51');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (36, 30, '2020-11-18', '2020-11-18 22:07:28');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (37, 16, '2020-10-02', '2020-10-02 21:31:23');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (38, 13, '2020-10-10', '2020-10-10 17:59:30');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (39, 34, '2020-11-18', '2020-11-18 06:19:02');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (40, 7, '2020-11-06', '2020-11-06 17:26:17');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (41, 14, '2020-11-29', '2020-11-29 17:56:26');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (42, 1, '2020-11-18', '2020-11-18 20:38:39');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (43, 4, '2020-09-09', '2020-09-09 22:50:48');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (44, 37, '2020-10-29', '2020-10-29 11:45:45');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (45, 11, '2020-06-07', '2020-06-07 15:57:54');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (46, 4, '2020-11-02', '2020-11-02 14:30:05');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (47, 37, '2020-09-19', '2020-09-19 18:54:53');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (48, 41, '2020-12-31', '2020-12-31 23:27:55');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (49, 18, '2020-11-12', '2020-11-12 23:18:09');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (50, 24, '2020-11-16', '2020-11-16 09:40:26');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (51, 9, '2020-06-12', '2020-06-12 23:04:41');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (52, 2, '2020-07-23', '2020-07-23 05:20:27');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (53, 30, '2020-10-30', '2020-10-30 22:46:59');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (54, 35, '2020-10-22', '2020-10-22 04:37:58');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (55, 43, '2020-12-26', '2020-12-26 21:32:53');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (56, 6, '2020-08-15', '2020-08-15 03:50:54');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (57, 38, '2020-12-22', '2020-12-22 14:09:46');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (58, 32, '2020-07-22', '2020-07-22 07:52:12');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (59, 19, '2020-12-29', '2020-12-29 20:03:48');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (60, 50, '2020-06-07', '2020-06-07 11:19:25');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (61, 45, '2020-09-11', '2020-09-11 00:02:39');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (62, 47, '2020-12-23', '2020-12-23 12:43:11');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (63, 28, '2020-06-01', '2020-06-01 23:56:03');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (64, 33, '2020-06-18', '2020-06-18 17:48:20');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (65, 15, '2020-12-06', '2020-12-06 08:44:42');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (66, 43, '2020-08-02', '2020-08-02 23:00:45');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (67, 1, '2020-09-14', '2020-09-14 15:06:28');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (68, 19, '2020-11-07', '2020-11-07 17:12:19');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (69, 48, '2020-06-12', '2020-06-12 16:45:55');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (70, 43, '2020-08-21', '2020-08-21 00:49:56');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (71, 5, '2020-06-09', '2020-06-09 17:38:36');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (72, 6, '2020-09-22', '2020-09-22 16:45:33');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (73, 13, '2020-11-07', '2020-11-07 16:12:49');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (74, 42, '2020-10-20', '2020-10-20 18:33:55');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (75, 42, '2020-08-24', '2020-08-24 15:46:46');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (76, 7, '2020-09-28', '2020-09-28 08:07:25');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (77, 26, '2020-07-25', '2020-07-25 05:44:38');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (78, 7, '2020-08-24', '2020-08-24 12:02:34');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (79, 4, '2020-11-15', '2020-11-15 23:27:38');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (80, 5, '2020-09-03', '2020-09-03 13:19:34');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (81, 23, '2020-09-07', '2020-09-07 02:15:49');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (82, 37, '2020-12-14', '2020-12-14 07:22:48');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (83, 37, '2020-09-10', '2020-09-10 15:18:07');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (84, 46, '2020-11-19', '2020-11-19 17:28:38');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (85, 40, '2020-10-08', '2020-10-08 03:30:10');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (86, 8, '2020-08-29', '2020-08-29 22:08:47');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (87, 6, '2020-12-28', '2020-12-28 13:02:12');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (88, 44, '2020-09-27', '2020-09-27 08:57:29');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (89, 49, '2020-08-24', '2020-08-24 06:43:36');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (90, 50, '2020-09-24', '2020-09-24 11:40:50');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (91, 48, '2020-12-03', '2020-12-03 19:09:46');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (92, 42, '2020-12-11', '2020-12-11 06:11:51');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (93, 2, '2020-11-18', '2020-11-18 14:50:16');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (94, 21, '2020-06-25', '2020-06-25 20:30:06');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (95, 15, '2020-12-10', '2020-12-10 19:52:33');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (96, 31, '2020-11-25', '2020-11-25 06:12:36');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (97, 2, '2020-07-23', '2020-07-23 10:20:37');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (98, 4, '2020-06-10', '2020-06-10 11:30:18');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (99, 1, '2020-08-01', '2020-08-01 15:10:05');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (100, 16, '2020-10-29', '2020-10-29 08:47:32');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (101, 14, '2020-09-17', '2020-09-17 19:38:00');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (102, 25, '2020-09-21', '2020-09-21 09:54:01');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (103, 24, '2020-11-05', '2020-11-05 03:46:43');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (104, 35, '2020-11-30', '2020-11-30 01:17:48');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (105, 3, '2020-10-30', '2020-10-30 13:10:22');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (106, 5, '2020-07-01', '2020-07-01 07:30:32');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (107, 41, '2020-09-22', '2020-09-22 12:15:48');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (108, 2, '2020-10-28', '2020-10-28 20:10:28');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (109, 16, '2020-12-22', '2020-12-22 17:46:34');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (110, 13, '2020-09-19', '2020-09-19 04:52:31');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (111, 45, '2020-10-11', '2020-10-11 04:13:20');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (112, 43, '2020-08-13', '2020-08-13 15:33:00');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (113, 15, '2020-07-16', '2020-07-16 08:45:51');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (114, 9, '2020-10-02', '2020-10-02 01:15:00');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (115, 19, '2020-08-13', '2020-08-13 10:06:13');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (116, 27, '2020-07-16', '2020-07-16 22:33:14');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (117, 36, '2020-07-24', '2020-07-24 08:55:52');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (118, 17, '2020-08-31', '2020-08-31 01:19:30');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (119, 49, '2020-08-25', '2020-08-25 04:38:55');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (120, 4, '2020-09-18', '2020-09-18 11:26:22');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (121, 13, '2020-09-19', '2020-09-19 23:39:38');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (122, 48, '2020-10-28', '2020-10-28 05:12:51');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (123, 5, '2020-08-24', '2020-08-24 06:28:33');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (124, 38, '2020-12-27', '2020-12-27 23:42:53');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (125, 21, '2020-07-03', '2020-07-03 09:22:11');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (126, 34, '2020-10-02', '2020-10-02 08:58:23');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (127, 36, '2020-10-14', '2020-10-14 01:53:06');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (128, 48, '2020-11-18', '2020-11-18 17:20:06');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (129, 18, '2020-11-19', '2020-11-19 00:15:47');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (130, 7, '2020-06-07', '2020-06-07 09:42:01');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (131, 21, '2020-08-18', '2020-08-18 09:13:37');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (132, 13, '2020-11-02', '2020-11-02 04:16:20');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (133, 42, '2020-12-29', '2020-12-29 10:39:58');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (134, 45, '2020-09-30', '2020-09-30 04:36:46');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (135, 28, '2020-12-04', '2020-12-04 03:46:49');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (136, 15, '2020-09-21', '2020-09-21 22:03:12');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (137, 20, '2020-10-04', '2020-10-04 17:52:21');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (138, 48, '2020-09-04', '2020-09-04 05:55:52');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (139, 23, '2020-12-31', '2020-12-31 16:59:32');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (140, 45, '2020-08-29', '2020-08-29 00:33:02');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (141, 24, '2020-11-18', '2020-11-18 12:54:46');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (142, 2, '2020-09-02', '2020-09-02 17:02:39');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (143, 8, '2020-06-09', '2020-06-09 13:29:40');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (144, 3, '2020-06-09', '2020-06-09 02:30:56');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (145, 44, '2020-11-25', '2020-11-25 20:13:15');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (146, 21, '2020-12-27', '2020-12-27 19:06:44');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (147, 48, '2020-09-25', '2020-09-25 02:33:08');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (148, 10, '2020-11-09', '2020-11-09 17:21:42');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (149, 16, '2020-08-01', '2020-08-01 01:38:51');
INSERT INTO Biglietto (id_biglietto, id_utente, data_emissione, ora_emissione) VALUES (150, 46, '2020-12-14', '2020-12-14 12:03:03');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (1, 1, 7, 18, 'Business', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (2, 2, 14, 174, 'Prima', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (3, 3, 16, 120, 'Prima', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (4, 4, 11, 19, 'Economy', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (5, 5, 19, 21, 'Economy', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (6, 6, 13, 63, 'Economy', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (7, 7, 11, 178, 'Business', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (8, 8, 9, 190, 'Economy', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (9, 9, 24, 14, 'Business', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (10, 10, 18, 31, 'Prima', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (11, 11, 20, 58, 'Prima', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (12, 12, 23, 98, 'Prima', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (13, 13, 5, 83, 'Prima', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (14, 14, 26, 83, 'Prima', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (15, 15, 18, 71, 'Prima', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (16, 16, 16, 195, 'Business', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (17, 17, 12, 142, 'Prima', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (18, 18, 25, 145, 'Economy', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (19, 19, 13, 30, 'Economy', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (20, 20, 5, 31, 'Economy', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (21, 21, 25, 161, 'Business', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (22, 22, 2, 195, 'Economy', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (23, 23, 9, 118, 'Prima', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (24, 24, 4, 41, 'Economy', 'In Attesa', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (25, 25, 24, 97, 'Economy', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (26, 26, 4, 195, 'Business', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (27, 27, 13, 48, 'Business', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (28, 28, 11, 70, 'Economy', 'Annullato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (29, 29, 17, 152, 'Prima', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (30, 30, 8, 139, 'Economy', 'Confermato', '10.50');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (31, 31, 15, 61, 'Prima', 'Confermato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (32, 32, 26, 63, 'Prima', 'Confermato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (33, 33, 19, 27, 'Business', 'Confermato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (34, 34, 4, 155, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (35, 35, 19, 53, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (36, 36, 26, 53, 'Business', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (37, 37, 10, 80, 'Prima', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (38, 38, 24, 184, 'Economy', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (39, 39, 29, 61, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (40, 40, 24, 188, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (41, 41, 26, 167, 'Business', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (42, 42, 19, 143, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (43, 43, 6, 32, 'Prima', 'Confermato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (44, 44, 10, 200, 'Business', 'Confermato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (45, 45, 9, 2, 'Prima', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (46, 46, 11, 161, 'Prima', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (47, 47, 20, 145, 'Business', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (48, 48, 2, 92, 'Business', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (49, 49, 10, 181, 'Business', 'Annullato', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (50, 50, 15, 89, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (51, 51, 30, 159, 'Business', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (52, 52, 10, 29, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (53, 53, 30, 91, 'Prima', 'In Attesa', '21.30');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (54, 54, 21, 7, 'Economy', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (55, 55, 21, 14, 'Prima', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (56, 56, 19, 9, 'Business', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (57, 57, 2, 189, 'Prima', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (58, 58, 28, 67, 'Business', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (59, 59, 24, 105, 'Prima', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (60, 60, 29, 140, 'Economy', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (61, 61, 21, 13, 'Economy', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (62, 62, 3, 152, 'Prima', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (63, 63, 8, 169, 'Economy', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (64, 64, 7, 154, 'Prima', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (65, 65, 22, 177, 'Business', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (66, 66, 16, 190, 'Prima', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (67, 67, 28, 54, 'Economy', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (68, 68, 10, 128, 'Economy', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (69, 69, 6, 8, 'Business', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (70, 70, 17, 75, 'Prima', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (71, 71, 6, 70, 'Economy', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (72, 72, 16, 135, 'Business', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (73, 73, 7, 90, 'Economy', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (74, 74, 27, 91, 'Business', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (75, 75, 22, 67, 'Economy', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (76, 76, 17, 40, 'Prima', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (77, 77, 27, 38, 'Prima', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (78, 78, 29, 190, 'Economy', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (79, 79, 1, 22, 'Economy', 'In Attesa', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (80, 80, 27, 178, 'Business', 'Annullato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (81, 81, 3, 1, 'Prima', 'Confermato', '17.15');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (82, 82, 23, 182, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (83, 83, 5, 141, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (84, 84, 13, 189, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (85, 85, 28, 77, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (86, 86, 2, 40, 'Prima', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (87, 87, 20, 140, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (88, 88, 20, 136, 'Prima', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (89, 89, 30, 44, 'Prima', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (90, 90, 10, 7, 'Economy', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (91, 91, 3, 114, 'Economy', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (92, 92, 16, 131, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (93, 93, 8, 71, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (94, 94, 6, 125, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (95, 95, 4, 114, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (96, 96, 19, 152, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (97, 97, 29, 173, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (98, 98, 11, 75, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (99, 99, 10, 185, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (100, 100, 3, 137, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (101, 101, 13, 13, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (102, 102, 4, 131, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (103, 103, 21, 135, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (104, 104, 16, 37, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (105, 105, 9, 186, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (106, 106, 21, 8, 'Economy', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (107, 107, 25, 154, 'Prima', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (108, 108, 22, 35, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (109, 109, 5, 135, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (110, 110, 15, 112, 'Economy', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (111, 111, 15, 100, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (112, 112, 1, 95, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (113, 113, 3, 73, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (114, 114, 20, 2, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (115, 115, 13, 191, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (116, 116, 18, 154, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (117, 117, 20, 157, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (118, 118, 11, 26, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (119, 119, 12, 91, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (120, 120, 3, 160, 'Prima', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (121, 121, 8, 108, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (122, 122, 4, 70, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (123, 123, 20, 184, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (124, 124, 12, 185, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (125, 125, 16, 125, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (126, 126, 2, 187, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (127, 127, 6, 191, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (128, 128, 3, 115, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (129, 129, 1, 8, 'Prima', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (130, 130, 24, 15, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (131, 131, 11, 57, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (132, 132, 15, 100, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (133, 133, 2, 10, 'Prima', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (134, 134, 18, 162, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (135, 135, 25, 159, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (136, 136, 3, 10, 'Prima', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (137, 137, 23, 128, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (138, 138, 5, 30, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (139, 139, 20, 70, 'Prima', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (140, 140, 6, 20, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (141, 141, 27, 194, 'Prima', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (142, 142, 20, 30, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (143, 143, 24, 15, 'Economy', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (144, 144, 27, 12, 'Business', 'In Attesa', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (145, 145, 18, 87, 'Business', 'Confermato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (146, 146, 5, 99, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (147, 147, 7, 103, 'Business', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (148, 148, 15, 40, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (149, 149, 5, 111, 'Economy', 'Annullato', '11.00');
INSERT INTO Prenotazione (id_prenotazione, id_biglietto, id_viaggio, numero_posto, classe, stato_prenotazione,costo ) VALUES (150, 150, 21, 86, 'Economy', 'Confermato', '11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (1, 1, 'Contanti', 'In Attesa', '2020-07-21','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (2, 2, 'PayPal', 'Completato', '2020-11-26','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (3, 3, 'Contanti', 'In Attesa', '2020-11-14','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (4, 4, 'Bonifico', 'Completato', '2020-06-28','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (5, 5, 'Carta', 'In Attesa', '2020-07-11','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (6, 6, 'Carta', 'Completato', '2020-09-14','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (7, 7, 'Contanti', 'In Attesa', '2020-09-26','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (8, 8, 'Contanti', 'Rifiutato', '2020-12-17','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (9, 9, 'PayPal', 'In Attesa', '2020-08-10','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (10, 10, 'Carta', 'Completato', '2020-07-29','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (11, 11, 'Contanti', 'Rifiutato', '2020-07-12','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (12, 12, 'Bonifico', 'In Attesa', '2020-10-17','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (13, 13, 'Contanti', 'Completato', '2020-06-06','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (14, 14, 'PayPal', 'In Attesa', '2020-09-13','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (15, 15, 'PayPal', 'Rifiutato', '2020-11-08','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (16, 16, 'PayPal', 'In Attesa', '2020-06-24','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (17, 17, 'Contanti', 'In Attesa', '2020-12-25','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (18, 18, 'Carta', 'In Attesa', '2020-11-12','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (19, 19, 'PayPal', 'Completato', '2020-06-05','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (20, 20, 'PayPal', 'Completato', '2020-08-05','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (21, 21, 'Bonifico', 'Rifiutato', '2020-10-02','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (22, 22, 'Carta', 'Rifiutato', '2020-11-24','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (23, 23, 'PayPal', 'Completato', '2020-08-24','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (24, 24, 'Carta', 'In Attesa', '2020-08-18','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (25, 25, 'Carta', 'In Attesa', '2020-12-06','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (26, 26, 'Contanti', 'In Attesa', '2020-10-09','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (27, 27, 'Contanti', 'In Attesa', '2020-09-15','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (28, 28, 'PayPal', 'Completato', '2020-12-15','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (29, 29, 'Bonifico', 'Rifiutato', '2020-12-07','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (30, 30, 'Bonifico', 'Rifiutato', '2020-06-11','10.50');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (31, 31, 'Carta', 'Rifiutato', '2020-10-28','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (32, 32, 'Bonifico', 'Completato', '2020-10-21','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (33, 33, 'PayPal', 'Rifiutato', '2020-10-03','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (34, 34, 'PayPal', 'Completato', '2020-07-19','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (35, 35, 'Contanti', 'Completato', '2020-09-15','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (36, 36, 'Bonifico', 'In Attesa', '2020-11-18','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (37, 37, 'Bonifico', 'Rifiutato', '2020-10-02','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (38, 38, 'Bonifico', 'Completato', '2020-10-10','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (39, 39, 'PayPal', 'In Attesa', '2020-11-18','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (40, 40, 'PayPal', 'Completato', '2020-11-06','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (41, 41, 'Contanti', 'Completato', '2020-11-29','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (42, 42, 'Carta', 'Completato', '2020-11-18','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (43, 43, 'Bonifico', 'Completato', '2020-09-09','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (44, 44, 'Bonifico', 'In Attesa', '2020-10-29','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (45, 45, 'PayPal', 'In Attesa', '2020-06-07','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (46, 46, 'Bonifico', 'In Attesa', '2020-11-02','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (47, 47, 'Carta', 'In Attesa', '2020-09-19','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (48, 48, 'Carta', 'In Attesa', '2020-12-31','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (49, 49, 'Contanti', 'Rifiutato', '2020-11-12','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (50, 50, 'Carta', 'In Attesa', '2020-11-16','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (51, 51, 'Bonifico', 'Rifiutato', '2020-06-12','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (52, 52, 'Carta', 'In Attesa', '2020-07-23','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (53, 53, 'Carta', 'Completato', '2020-10-30','21.30');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (54, 54, 'PayPal', 'Completato', '2020-10-22','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (55, 55, 'Contanti', 'Rifiutato', '2020-12-26','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (56, 56, 'Carta', 'Rifiutato', '2020-08-15','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (57, 57, 'Bonifico', 'Rifiutato', '2020-12-22','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (58, 58, 'Carta', 'In Attesa', '2020-07-22','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (59, 59, 'Bonifico', 'Rifiutato', '2020-12-29','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (60, 60, 'Contanti', 'Rifiutato', '2020-06-07','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (61, 61, 'PayPal', 'Completato', '2020-09-11','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (62, 62, 'PayPal', 'In Attesa', '2020-12-23','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (63, 63, 'Carta', 'In Attesa', '2020-06-01','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (64, 64, 'Bonifico', 'In Attesa', '2020-06-18','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (65, 65, 'Bonifico', 'Completato', '2020-12-06','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (66, 66, 'Carta', 'Rifiutato', '2020-08-02','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (67, 67, 'Carta', 'Completato', '2020-09-14','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (68, 68, 'Contanti', 'In Attesa', '2020-11-07','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (69, 69, 'Contanti', 'In Attesa', '2020-06-12','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (70, 70, 'Carta', 'Completato', '2020-08-21','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (71, 71, 'Carta', 'Completato', '2020-06-09','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (72, 72, 'PayPal', 'Completato', '2020-09-22','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (73, 73, 'Bonifico', 'Rifiutato', '2020-11-07','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (74, 74, 'Contanti', 'Completato', '2020-10-20','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (75, 75, 'Carta', 'Rifiutato', '2020-08-24','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (76, 76, 'PayPal', 'In Attesa', '2020-09-28','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (77, 77, 'Bonifico', 'Rifiutato', '2020-07-25','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (78, 78, 'PayPal', 'Rifiutato', '2020-08-24','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (79, 79, 'Carta', 'Completato', '2020-11-15','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (80, 80, 'Contanti', 'In Attesa', '2020-09-03','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (81, 81, 'Bonifico', 'In Attesa', '2020-09-07','17.15');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (82, 82, 'PayPal', 'Rifiutato', '2020-12-14','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (83, 83, 'Bonifico', 'In Attesa', '2020-09-10','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (84, 84, 'Carta', 'In Attesa', '2020-11-19','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (85, 85, 'Contanti', 'Completato', '2020-10-08','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (86, 86, 'PayPal', 'In Attesa', '2020-08-29','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (87, 87, 'PayPal', 'In Attesa', '2020-12-28','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (88, 88, 'Bonifico', 'Completato', '2020-09-27','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (89, 89, 'Carta', 'Rifiutato', '2020-08-24','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (90, 90, 'PayPal', 'Rifiutato', '2020-09-24','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (91, 91, 'PayPal', 'In Attesa', '2020-12-03','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (92, 92, 'Carta', 'In Attesa', '2020-12-11','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (93, 93, 'PayPal', 'Rifiutato', '2020-11-18','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (94, 94, 'Contanti', 'Rifiutato', '2020-06-25','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (95, 95, 'Carta', 'Rifiutato', '2020-12-10','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (96, 96, 'Contanti', 'Rifiutato', '2020-11-25','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (97, 97, 'Bonifico', 'Completato', '2020-07-23','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (98, 98, 'PayPal', 'Completato', '2020-06-10','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (99, 99, 'Contanti', 'Completato', '2020-08-01','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (100, 100, 'Carta', 'In Attesa', '2020-10-29','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (101, 101, 'Bonifico', 'Completato', '2020-09-17','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (102, 102, 'PayPal', 'In Attesa', '2020-09-21','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (103, 103, 'Carta', 'Completato', '2020-11-05','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (104, 104, 'Bonifico', 'Completato', '2020-11-30','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (105, 105, 'PayPal', 'Rifiutato', '2020-10-30','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (106, 106, 'Carta', 'In Attesa', '2020-07-01','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (107, 107, 'Bonifico', 'In Attesa', '2020-09-22','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (108, 108, 'Bonifico', 'In Attesa', '2020-10-28','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (109, 109, 'Contanti', 'Completato', '2020-12-22','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (110, 110, 'Carta', 'In Attesa', '2020-09-19','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (111, 111, 'Carta', 'In Attesa', '2020-10-11','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (112, 112, 'PayPal', 'Completato', '2020-08-13','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (113, 113, 'Carta', 'In Attesa', '2020-07-16','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (114, 114, 'PayPal', 'In Attesa', '2020-10-02','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (115, 115, 'Bonifico', 'Completato', '2020-08-13','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (116, 116, 'Bonifico', 'In Attesa', '2020-07-16','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (117, 117, 'Bonifico', 'Completato', '2020-07-24','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (118, 118, 'Bonifico', 'Rifiutato', '2020-08-31','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (119, 119, 'PayPal', 'Completato', '2020-08-25','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (120, 120, 'PayPal', 'In Attesa', '2020-09-18','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (121, 121, 'Carta', 'Rifiutato', '2020-09-19','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (122, 122, 'Carta', 'Rifiutato', '2020-10-28','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (123, 123, 'Carta', 'In Attesa', '2020-08-24','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (124, 124, 'Contanti', 'In Attesa', '2020-12-27','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (125, 125, 'Carta', 'Completato', '2020-07-03','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (126, 126, 'Contanti', 'Completato', '2020-10-02','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (127, 127, 'Contanti', 'In Attesa', '2020-10-14','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (128, 128, 'Bonifico', 'Completato', '2020-11-18','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (129, 129, 'PayPal', 'Completato', '2020-11-19','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (130, 130, 'PayPal', 'Completato', '2020-06-07','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (131, 131, 'Carta', 'Rifiutato', '2020-08-18','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (132, 132, 'Bonifico', 'In Attesa', '2020-11-02','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (133, 133, 'Bonifico', 'Completato', '2020-12-29','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (134, 134, 'Bonifico', 'Completato', '2020-09-30','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (135, 135, 'Carta', 'Rifiutato', '2020-12-04','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (136, 136, 'PayPal', 'Completato', '2020-09-21','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (137, 137, 'Contanti', 'Rifiutato', '2020-10-04','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (138, 138, 'Contanti', 'In Attesa', '2020-09-04','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (139, 139, 'PayPal', 'Rifiutato', '2020-12-31','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (140, 140, 'Contanti', 'In Attesa', '2020-08-29','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (141, 141, 'Carta', 'Completato', '2020-11-18','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (142, 142, 'Contanti', 'Completato', '2020-09-02','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (143, 143, 'Carta', 'Completato', '2020-06-09','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (144, 144, 'Carta', 'In Attesa', '2020-06-09','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (145, 145, 'Carta', 'In Attesa', '2020-11-25','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (146, 146, 'Bonifico', 'Completato', '2020-12-27','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (147, 147, 'PayPal', 'Completato', '2020-09-25','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (148, 148, 'Bonifico', 'In Attesa', '2020-11-09','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (149, 149, 'Bonifico', 'Rifiutato', '2020-08-01','11.00');
INSERT INTO Pagamento (id_pagamento, id_biglietto, metodo, stato_pagamento, data_pagamento, importo) VALUES (150, 150, 'Contanti', 'In Attesa', '2020-12-14','11.00');
