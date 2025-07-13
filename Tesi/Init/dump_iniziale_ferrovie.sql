
-- Creazione delle tabelle
CREATE TABLE Utente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    email VARCHAR(100),
    data_nascita DATE
);

CREATE TABLE Treno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codice VARCHAR(10),
    tipo VARCHAR(20),
    capienza INT
);

CREATE TABLE Stazione (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    citta VARCHAR(100)
);

CREATE TABLE Tratta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stazione_partenza_id INT,
    stazione_arrivo_id INT,
    FOREIGN KEY (stazione_partenza_id) REFERENCES Stazione(id),
    FOREIGN KEY (stazione_arrivo_id) REFERENCES Stazione(id)
);

CREATE TABLE Fermata (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tratta_id INT,
    stazione_id INT,
    ordine INT,
    FOREIGN KEY (tratta_id) REFERENCES Tratta(id),
    FOREIGN KEY (stazione_id) REFERENCES Stazione(id)
);

CREATE TABLE Viaggio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tratta_id INT,
    treno_id INT,
    data_partenza DATETIME,
    FOREIGN KEY (tratta_id) REFERENCES Tratta(id),
    FOREIGN KEY (treno_id) REFERENCES Treno(id)
);

CREATE TABLE Biglietto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_id INT,
    viaggio_id INT,
    data_emissione DATE,
    prezzo DECIMAL(6,2),
    stato VARCHAR(20),
    FOREIGN KEY (utente_id) REFERENCES Utente(id),
    FOREIGN KEY (viaggio_id) REFERENCES Viaggio(id)
);

CREATE TABLE Prenotazione (
    id INT AUTO_INCREMENT PRIMARY KEY,
    biglietto_id INT,
    numero_posto INT,
    FOREIGN KEY (biglietto_id) REFERENCES Biglietto(id)
);

CREATE TABLE Pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    biglietto_id INT,
    metodo VARCHAR(50),
    stato_pagamento VARCHAR(20),
    data_pagamento DATE,
    FOREIGN KEY (biglietto_id) REFERENCES Biglietto(id)
);

-- Inserimento stazioni (capoluoghi di provincia)
INSERT INTO Stazione (id, nome, citta) VALUES (1, 'Stazione Torino', 'Torino');
INSERT INTO Stazione (id, nome, citta) VALUES (2, 'Stazione Milano', 'Milano');
INSERT INTO Stazione (id, nome, citta) VALUES (3, 'Stazione Venezia', 'Venezia');
INSERT INTO Stazione (id, nome, citta) VALUES (4, 'Stazione Genova', 'Genova');
INSERT INTO Stazione (id, nome, citta) VALUES (5, 'Stazione Bologna', 'Bologna');
INSERT INTO Stazione (id, nome, citta) VALUES (6, 'Stazione Firenze', 'Firenze');
INSERT INTO Stazione (id, nome, citta) VALUES (7, 'Stazione Ancona', 'Ancona');
INSERT INTO Stazione (id, nome, citta) VALUES (8, 'Stazione Perugia', 'Perugia');
INSERT INTO Stazione (id, nome, citta) VALUES (9, 'Stazione Roma', 'Roma');
INSERT INTO Stazione (id, nome, citta) VALUES (10, 'Stazione L'Aquila', 'L'Aquila');
INSERT INTO Stazione (id, nome, citta) VALUES (11, 'Stazione Campobasso', 'Campobasso');
INSERT INTO Stazione (id, nome, citta) VALUES (12, 'Stazione Napoli', 'Napoli');
INSERT INTO Stazione (id, nome, citta) VALUES (13, 'Stazione Bari', 'Bari');
INSERT INTO Stazione (id, nome, citta) VALUES (14, 'Stazione Potenza', 'Potenza');
INSERT INTO Stazione (id, nome, citta) VALUES (15, 'Stazione Catanzaro', 'Catanzaro');
INSERT INTO Stazione (id, nome, citta) VALUES (16, 'Stazione Palermo', 'Palermo');
INSERT INTO Stazione (id, nome, citta) VALUES (17, 'Stazione Cagliari', 'Cagliari');
INSERT INTO Stazione (id, nome, citta) VALUES (18, 'Stazione Trieste', 'Trieste');
INSERT INTO Stazione (id, nome, citta) VALUES (19, 'Stazione Aosta', 'Aosta');
INSERT INTO Stazione (id, nome, citta) VALUES (20, 'Stazione Trento', 'Trento');
