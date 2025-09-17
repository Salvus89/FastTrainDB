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

