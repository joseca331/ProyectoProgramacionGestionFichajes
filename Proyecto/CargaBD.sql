DROP DATABASE IF EXISTS gestion_fichajes;
CREATE DATABASE gestion_fichajes CHARACTER SET UTF8MB4;
USE gestion_fichajes;


CREATE TABLE Representante (
    id_representante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE Jugador (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50),
    posicion VARCHAR(50),
    id_representante INT,
    FOREIGN KEY (id_representante) REFERENCES Representante(id_representante)
);


CREATE TABLE Equipo (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    fundacion YEAR,
    estadio VARCHAR(100)
);


CREATE TABLE Contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_equipo INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    salario DECIMAL(10,2),
    clausula_rescision DECIMAL(10,2),
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo)
);


CREATE TABLE Fichaje (
    id_fichaje INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_equipo_origen INT,
    id_equipo_destino INT NOT NULL,
    fecha_fichaje DATE NOT NULL,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    FOREIGN KEY (id_equipo_origen) REFERENCES Equipo(id_equipo),
    FOREIGN KEY (id_equipo_destino) REFERENCES Equipo(id_equipo)
);


CREATE TABLE Temporada (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    año_inicio YEAR NOT NULL,
    año_fin YEAR NOT NULL
);


CREATE TABLE EstadisticaJugador (
    id_estadistica INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_temporada INT NOT NULL,
    goles INT DEFAULT 0,
    asistencias INT DEFAULT 0,
    partidos_jugados INT DEFAULT 0,
    tarjetas_amarillas INT DEFAULT 0,
    tarjetas_rojas INT DEFAULT 0,
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    FOREIGN KEY (id_temporada) REFERENCES Temporada(id_temporada)
);



-- Real Madrid
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Thibaut', 'Courtois', '1992-05-11', 'Bélgica', 'Portero', 1),
('Dani', 'Carvajal', '1992-01-11', 'España', 'Defensa', 2),
('Éder', 'Militão', '1998-01-18', 'Brasil', 'Defensa', 3),
('David', 'Alaba', '1992-06-24', 'Austria', 'Defensa', 4),
('Antonio', 'Rüdiger', '1993-03-03', 'Alemania', 'Defensa', 5),
('Aurélien', 'Tchouaméni', '2000-01-27', 'Francia', 'Centrocampista', 6),
('Federico', 'Valverde', '1998-07-22', 'Uruguay', 'Centrocampista', 7),
('Jude', 'Bellingham', '2003-06-29', 'Inglaterra', 'Centrocampista', 1),
('Vinícius', 'Júnior', '2000-07-12', 'Brasil', 'Delantero', 2),
('Rodrygo', 'Goes', '2001-01-09', 'Brasil', 'Delantero', 3),
('Joselu', 'Mato', '1990-03-27', 'España', 'Delantero', 4);

-- FC Barcelona
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Marc-André', 'ter Stegen', '1992-04-30', 'Alemania', 'Portero', 5),
('Ronald', 'Araújo', '1999-03-07', 'Uruguay', 'Defensa', 6),
('Jules', 'Koundé', '1998-11-12', 'Francia', 'Defensa', 7),
('Alejandro', 'Balde', '2003-10-18', 'España', 'Defensa', 1),
('Andreas', 'Christensen', '1996-04-10', 'Dinamarca', 'Defensa', 2),
('Frenkie', 'de Jong', '1997-05-12', 'Países Bajos', 'Centrocampista', 3),
('Pedri', 'González', '2002-11-25', 'España', 'Centrocampista', 4),
('Gavi', 'Paéz', '2004-08-05', 'España', 'Centrocampista', 5),
('İlkay', 'Gündoğan', '1990-10-24', 'Alemania', 'Centrocampista', 6),
('Robert', 'Lewandowski', '1988-08-21', 'Polonia', 'Delantero', 7),
('Raphinha', 'Belloli', '1996-12-14', 'Brasil', 'Delantero', 1);

-- Atlético de Madrid
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Jan', 'Oblak', '1993-01-07', 'Eslovenia', 'Portero', 2),
('José María', 'Giménez', '1995-01-20', 'Uruguay', 'Defensa', 3),
('Stefan', 'Savić', '1991-01-08', 'Montenegro', 'Defensa', 4),
('Mario', 'Hermoso', '1995-06-18', 'España', 'Defensa', 5),
('Nahuel', 'Molina', '1998-04-06', 'Argentina', 'Defensa', 6),
('Rodrigo', 'De Paul', '1994-05-24', 'Argentina', 'Centrocampista', 7),
('Koke', 'Resurrección', '1992-01-08', 'España', 'Centrocampista', 1),
('Marcos', 'Llorente', '1995-01-30', 'España', 'Centrocampista', 2),
('Antoine', 'Griezmann', '1991-03-21', 'Francia', 'Delantero', 3),
('Álvaro', 'Morata', '1992-10-23', 'España', 'Delantero', 4),
('Memphis', 'Depay', '1994-02-13', 'Países Bajos', 'Delantero', 5);

-- Sevilla FC
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Marko', 'Dmitrović', '1992-01-24', 'Serbia', 'Portero', 6),
('Jesús', 'Navas', '1985-11-21', 'España', 'Defensa', 7),
('Sergio', 'Ramos', '1986-03-30', 'España', 'Defensa', 1),
('Loïc', 'Badé', '2000-04-11', 'Francia', 'Defensa', 2),
('Marcos', 'Acuña', '1991-10-28', 'Argentina', 'Defensa', 3),
('Ivan', 'Rakitić', '1988-03-10', 'Croacia', 'Centrocampista', 4),
('Joan', 'Jordán', '1994-07-06', 'España', 'Centrocampista', 5),
('Óliver', 'Torres', '1994-11-10', 'España', 'Centrocampista', 6),
('Youssef', 'En-Nesyri', '1997-06-01', 'Marruecos', 'Delantero', 7),
('Rafa', 'Mir', '1997-06-18', 'España', 'Delantero', 1),
('Lucas', 'Ocampos', '1994-07-11', 'Argentina', 'Delantero', 2);

-- Real Sociedad
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Álex', 'Remiro', '1995-03-24', 'España', 'Portero', 3),
('Andoni', 'Gorosabel', '1996-08-04', 'España', 'Defensa', 4),
('Robin', 'Le Normand', '1996-11-11', 'España', 'Defensa', 5),
('Igor', 'Zubeldia', '1997-03-30', 'España', 'Defensa', 6),
('Aihen', 'Muñoz', '1997-08-16', 'España', 'Defensa', 7),
('Mikel', 'Merino', '1996-06-22', 'España', 'Centrocampista', 1),
('Brais', 'Méndez', '1997-01-07', 'España', 'Centrocampista', 2),
('Martín', 'Zubimendi', '1999-02-02', 'España', 'Centrocampista', 3),
('Takefusa', 'Kubo', '2001-06-04', 'Japón', 'Delantero', 4),
('Mikel', 'Oyarzabal', '1997-04-21', 'España', 'Delantero', 5),
('André', 'Silva', '1995-11-06', 'Portugal', 'Delantero', 6);

-- Athletic Club
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Unai', 'Simón', '1997-06-11', 'España', 'Portero', 7),
('Óscar', 'De Marcos', '1989-04-14', 'España', 'Defensa', 1),
('Yeray', 'Álvarez', '1995-01-24', 'España', 'Defensa', 2),
('Íñigo', 'Lekue', '1993-05-04', 'España', 'Defensa', 3),
('Dani', 'Vivian', '1999-01-05', 'España', 'Defensa', 4),
('Iker', 'Muniain', '1992-12-19', 'España', 'Centrocampista', 5),
('Oihan', 'Sancet', '2000-04-25', 'España', 'Centrocampista', 6),
('Mikel', 'Vesga', '1993-04-08', 'España', 'Centrocampista', 7),
('Iñaki', 'Williams', '1994-06-15', 'Ghana', 'Delantero', 1),
('Nico', 'Williams', '2002-07-12', 'España', 'Delantero', 2),
('Gorka', 'Guruzeta', '1996-09-12', 'España', 'Delantero', 3);

-- Valencia CF
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Giorgi', 'Mamaradashvili', '2000-09-29', 'Georgia', 'Portero', 4),
('José Luis', 'Gayà', '1995-05-25', 'España', 'Defensa', 5),
('Gabriel', 'Paulista', '1990-11-26', 'Brasil', 'Defensa', 6),
('Thierry', 'Correia', '1999-03-09', 'Portugal', 'Defensa', 7),
('Cenk', 'Özkacar', '2000-10-06', 'Turquía', 'Defensa', 1),
('Hugo', 'Guillamón', '2000-01-31', 'España', 'Centrocampista', 2),
('Javi', 'Guerra', '2003-05-13', 'España', 'Centrocampista', 3),
('Pepelu', 'González', '1998-08-11', 'España', 'Centrocampista', 4),
('Diego', 'López', '2002-05-13', 'España', 'Delantero', 5),
('Hugo', 'Duro', '1999-11-10', 'España', 'Delantero', 6),
('Roman', 'Yaremchuk', '1995-11-27', 'Ucrania', 'Delantero', 7);

-- Villarreal CF
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Pepe', 'Reina', '1982-08-31', 'España', 'Portero', 1),
('Juan', 'Foyth', '1998-01-12', 'Argentina', 'Defensa', 2),
('Raúl', 'Albiol', '1985-09-04', 'España', 'Defensa', 3),
('Alberto', 'Moreno', '1992-10-05', 'España', 'Defensa', 4),
('Aïssa', 'Mandi', '1991-10-22', 'Argelia', 'Defensa', 5),
('Etienne', 'Capoue', '1988-07-11', 'Francia', 'Centrocampista', 6),
('Ramón', 'Terrats', '2000-10-18', 'España', 'Centrocampista', 7),
('Álex', 'Baena', '2001-07-20', 'España', 'Centrocampista', 1),
('Gerard', 'Moreno', '1992-04-07', 'España', 'Delantero', 2),
('José', 'Luis Morales', '1987-07-23', 'España', 'Delantero', 3),
('Alexander', 'Sørloth', '1995-12-05', 'Noruega', 'Delantero', 4);


-- Real Betis
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Claudio', 'Bravo', '1983-04-13', 'Chile', 'Portero', 5),
('Germán', 'Pezzella', '1991-06-27', 'Argentina', 'Defensa', 6),
('Luiz', 'Felipe', '1997-03-22', 'Italia', 'Defensa', 7),
('Abner', 'Vinícius', '2000-05-27', 'Brasil', 'Defensa', 1),
('Youssouf', 'Sabaly', '1993-03-05', 'Senegal', 'Defensa', 2),
('Guido', 'Rodríguez', '1994-04-12', 'Argentina', 'Centrocampista', 3),
('William', 'Carvalho', '1992-04-07', 'Portugal', 'Centrocampista', 4),
('Isco', 'Alarcón', '1992-04-21', 'España', 'Centrocampista', 5),
('Ayoze', 'Pérez', '1993-07-29', 'España', 'Delantero', 6),
('Borja', 'Iglesias', '1993-01-17', 'España', 'Delantero', 7),
('Willian', 'José', '1991-11-23', 'Brasil', 'Delantero', 1);

-- Getafe CF
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('David', 'Soria', '1993-04-04', 'España', 'Portero', 2),
('Djené', 'Dakoman', '1991-12-31', 'Togo', 'Defensa', 3),
('Gastón', 'Álvarez', '2000-03-24', 'Uruguay', 'Defensa', 4),
('Omar', 'Alderete', '1997-12-26', 'Paraguay', 'Defensa', 5),
('Stefan', 'Mitrović', '1990-05-22', 'Serbia', 'Defensa', 6),
('Nemanja', 'Maksimović', '1995-01-26', 'Serbia', 'Centrocampista', 7),
('Luis', 'Milla', '1994-10-07', 'España', 'Centrocampista', 1),
('Mauro', 'Arambarri', '1995-09-30', 'Uruguay', 'Centrocampista', 2),
('Mason', 'Greenwood', '2001-10-01', 'Inglaterra', 'Delantero', 3),
('Borja', 'Mayoral', '1997-04-05', 'España', 'Delantero', 4),
('Jaime', 'Mata', '1988-10-24', 'España', 'Delantero', 5);

-- RC Celta de Vigo
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Iván', 'Villar', '1997-07-09', 'España', 'Portero', 6),
('Óscar', 'Mingueza', '1999-05-13', 'España', 'Defensa', 7),
('Unai', 'Núñez', '1997-01-30', 'España', 'Defensa', 1),
('Carl Starfelt', 'Starfelt', '1995-06-01', 'Suecia', 'Defensa', 2),
('Javi', 'Galán', '1994-11-22', 'España', 'Defensa', 3),
('Renato', 'Tapia', '1995-07-28', 'Perú', 'Centrocampista', 4),
('Fran', 'Beltrán', '1999-02-03', 'España', 'Centrocampista', 5),
('Gabri', 'Veiga', '2002-05-27', 'España', 'Centrocampista', 6),
('Iago', 'Aspas', '1987-08-01', 'España', 'Delantero', 7),
('Lars', 'Mandel', '1996-02-05', 'Noruega', 'Delantero', 1),
('Jonathan', 'Bamba', '1996-03-26', 'Francia', 'Delantero', 2);

-- CA Osasuna
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Sergio', 'Herrera', '1993-06-05', 'España', 'Portero', 3),
('David', 'García', '1994-02-14', 'España', 'Defensa', 4),
('Aridane', 'Hernández', '1989-03-23', 'España', 'Defensa', 5),
('Juan', 'Cruz', '1992-07-01', 'España', 'Defensa', 6),
('Rubén', 'Peña', '1991-07-18', 'España', 'Defensa', 7),
('Lucas', 'Torró', '1994-07-19', 'España', 'Centrocampista', 1),
('Moi', 'Gómez', '1994-06-23', 'España', 'Centrocampista', 2),
('Jon', 'Moncayola', '1998-05-13', 'España', 'Centrocampista', 3),
('Chimy', 'Ávila', '1994-02-06', 'Argentina', 'Delantero', 4),
('Ante', 'Budimir', '1991-07-22', 'Croacia', 'Delantero', 5),
('Kike', 'García', '1989-11-25', 'España', 'Delantero', 6);


-- RCD Mallorca
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Predrag', 'Rajković', '1995-10-31', 'Serbia', 'Portero', 1),
('Giovanni', 'González', '1994-09-20', 'Uruguay', 'Defensa', 2),
('Martin', 'Valjent', '1995-12-11', 'Eslovaquia', 'Defensa', 3),
('Matija', 'Nastasić', '1993-03-28', 'Serbia', 'Defensa', 4),
('Jaume', 'Costa', '1988-03-18', 'España', 'Defensa', 5),
('Antonio', 'Sánchez', '1997-04-22', 'España', 'Centrocampista', 6),
('Manu', 'Morlanes', '1999-01-12', 'España', 'Centrocampista', 7),
('Sergi', 'Darder', '1993-12-22', 'España', 'Centrocampista', 1),
('Vedat', 'Muriqi', '1994-04-24', 'Kosovo', 'Delantero', 2),
('Abdón', 'Prats', '1992-12-07', 'España', 'Delantero', 3),
('Cyle', 'Larin', '1995-04-17', 'Canadá', 'Delantero', 4);

-- UD Las Palmas
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Álvaro', 'Valles', '1997-07-25', 'España', 'Portero', 5),
('Sergi', 'Cardona', '1999-07-08', 'España', 'Defensa', 6),
('Mika', 'Mármol', '2001-07-01', 'España', 'Defensa', 7),
('Saúl', 'Coco', '1999-02-09', 'Guinea Ecuatorial', 'Defensa', 1),
('Eric', 'Curbelo', '1994-01-14', 'España', 'Defensa', 2),
('Kirian', 'Rodríguez', '1996-03-05', 'España', 'Centrocampista', 3),
('Enzo', 'Loiodice', '2000-11-27', 'Francia', 'Centrocampista', 4),
('Máximo', 'Perrone', '2003-01-07', 'Argentina', 'Centrocampista', 5),
('Sandro', 'Ramírez', '1995-07-09', 'España', 'Delantero', 6),
('Marc', 'Cardona', '1995-07-08', 'España', 'Delantero', 7),
('Munir', 'El Haddadi', '1995-09-01', 'Marruecos', 'Delantero', 1);

-- Deportivo Alavés
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Antonio', 'Sivera', '1996-08-11', 'España', 'Portero', 2),
('Rubén', 'Duarte', '1995-10-18', 'España', 'Defensa', 3),
('Abdelkabir', 'Abqar', '1999-03-13', 'Marruecos', 'Defensa', 4),
('Aleksandar', 'Sedlar', '1991-12-13', 'Serbia', 'Defensa', 5),
('Javi', 'López', '2002-03-25', 'España', 'Defensa', 6),
('Jon', 'Guridi', '1995-02-28', 'España', 'Centrocampista', 7),
('Carlos', 'Benavídez', '1998-03-30', 'Uruguay', 'Centrocampista', 1),
('Antonio', 'Blanco', '2000-07-23', 'España', 'Centrocampista', 2),
('Samu', 'Omorodion', '2004-05-10', 'España', 'Delantero', 3),
('Kike', 'García', '1989-11-25', 'España', 'Delantero', 4),
('Luis', 'Riojano', '1994-10-16', 'España', 'Delantero', 5);

-- Girona FC
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Paulo', 'Gazzaniga', '1992-01-02', 'Argentina', 'Portero', 6),
('Arnau', 'Martínez', '2003-04-25', 'España', 'Defensa', 7),
('David', 'López', '1989-10-09', 'España', 'Defensa', 1),
('Eric', 'García', '2001-01-09', 'España', 'Defensa', 2),
('Daley', 'Blind', '1990-03-09', 'Países Bajos', 'Defensa', 3),
('Yangel', 'Herrera', '1998-01-07', 'Venezuela', 'Centrocampista', 4),
('Iván', 'Martín', '1999-02-06', 'España', 'Centrocampista', 5),
('Sávio', 'Moreira', '2004-04-10', 'Brasil', 'Centrocampista', 6),
('Viktor', 'Tsygankov', '1997-11-15', 'Ucrania', 'Delantero', 7),
('Artem', 'Dovbyk', '1997-06-21', 'Ucrania', 'Delantero', 1),
('Cristhian', 'Stuani', '1986-10-12', 'Uruguay', 'Delantero', 2);


-- Rayo Vallecano
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Stole', 'Dimitrievski', '1993-12-25', 'Macedonia', 'Portero', 3),
('Iván', 'Balliu', '1992-01-01', 'Albania', 'Defensa', 4),
('Abdul', 'Mumin', '1998-06-06', 'Ghana', 'Defensa', 5),
('Florian', 'Lejeune', '1991-05-20', 'Francia', 'Defensa', 6),
('Pep', 'Chavarría', '1998-04-10', 'España', 'Defensa', 7),
('Óscar', 'Valentín', '1994-08-20', 'España', 'Centrocampista', 1),
('Unai', 'López', '1995-10-30', 'España', 'Centrocampista', 2),
('Isi', 'Palazón', '1994-12-27', 'España', 'Centrocampista', 3),
('Álvaro', 'García', '1992-10-27', 'España', 'Delantero', 4),
('Raúl', 'De Tomás', '1994-10-17', 'España', 'Delantero', 5),
('Sergio', 'Camello', '2001-02-10', 'España', 'Delantero', 6);

-- Real Valladolid
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Jordi', 'Masip', '1989-01-03', 'España', 'Portero', 7),
('Luis', 'Pérez', '1995-02-04', 'España', 'Defensa', 1),
('Javi', 'Sánchez', '1997-03-14', 'España', 'Defensa', 2),
('Jawad', 'El Yamiq', '1992-02-29', 'Marruecos', 'Defensa', 3),
('Lucas', 'Olaza', '1994-07-21', 'Uruguay', 'Defensa', 4),
('Kike', 'Pérez', '1997-02-14', 'España', 'Centrocampista', 5),
('Monchu', 'Rodríguez', '1999-09-13', 'España', 'Centrocampista', 6),
('Roque', 'Mesa', '1989-06-07', 'España', 'Centrocampista', 7),
('Sergio', 'León', '1989-01-06', 'España', 'Delantero', 1),
('Shon', 'Weissman', '1996-02-14', 'Israel', 'Delantero', 2),
('Óscar', 'Plano', '1991-02-11', 'España', 'Delantero', 3);

-- RCD Espanyol
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Fernando', 'Pacheco', '1992-05-18', 'España', 'Portero', 4),
('Brian', 'Oliván', '1994-04-01', 'España', 'Defensa', 5),
('Leandro', 'Cabrera', '1991-06-17', 'Uruguay', 'Defensa', 6),
('Óscar', 'Gil', '1998-04-26', 'España', 'Defensa', 7),
('Sergi', 'Gómez', '1992-03-28', 'España', 'Defensa', 1),
('Keidi', 'Bare', '1997-08-28', 'Albania', 'Centrocampista', 2),
('Edu', 'Expósito', '1996-08-01', 'España', 'Centrocampista', 3),
('Nico', 'Melamed', '2001-04-11', 'España', 'Centrocampista', 4),
('Martin', 'Braithwaite', '1991-06-05', 'Dinamarca', 'Delantero', 5),
('Javi', 'Puado', '1998-05-25', 'España', 'Delantero', 6),
('Pere', 'Milla', '1992-09-23', 'España', 'Delantero', 7);

-- CD Leganés
INSERT INTO Jugador (nombre, apellidos, fecha_nacimiento, nacionalidad, posicion, id_representante) VALUES
('Dani', 'Jiménez', '1990-03-05', 'España', 'Portero', 1),
('Sergio', 'González', '1997-05-25', 'España', 'Defensa', 2),
('Allan', 'Nyom', '1988-05-10', 'Camerún', 'Defensa', 3),
('Jorge', 'Miramón', '1989-06-02', 'España', 'Defensa', 4),
('Luis', 'Pereira', '1997-10-14', 'España', 'Defensa', 5),
('Rubén', 'Pardo', '1992-10-22', 'España', 'Centrocampista', 6),
('Óscar', 'Ureña', '2003-05-31', 'España', 'Centrocampista', 7),
('Juanjo', 'Narváez', '1995-02-12', 'Colombia', 'Centrocampista', 1),
('Miguel', 'De la Fuente', '1999-09-03', 'España', 'Delantero', 2),
('Diego', 'García', '2000-03-22', 'España', 'Delantero', 3),
('Dani', 'Raba', '1995-10-29', 'España', 'Delantero', 4);

--   Representantes
INSERT INTO Representante (nombre, telefono, email) VALUES
('Jorge Mendes', '600123001', 'jmendes@gestifute.com'),
('Mino Raiola Agency', '600123002', 'info@raiolaagency.com'),
('Pini Zahavi', '600123003', 'pzahavi@agency.com'),
('Jonathan Barnett', '600123004', 'jbarnett@stellarfootball.com'),
('Giuliano Bertolucci', '600123005', 'gbertolucci@agency.com'),
('Manuel García Quilón', '600123006', 'mgarciaquilon@agency.com'),
('Juanma López', '600123007', 'jlopez@agenciadeportiva.com');


-- Contratos variados con fechas realistas

INSERT INTO Contrato (id_jugador, id_equipo, fecha_inicio, fecha_fin, salario, clausula_rescision) VALUES
(1, 1, '2020-07-01', '2024-06-30', 9000000, 150000000),
(2, 1, '2021-07-01', '2025-06-30', 4500000, 80000000),
(3, 1, '2022-07-01', '2025-06-30', 7000000, 120000000),
(4, 1, '2023-07-01', '2026-06-30', 6000000, 100000000),
(5, 1, '2020-07-01', '2025-06-30', 5500000, 90000000),
(6, 1, '2021-07-01', '2024-06-30', 5000000, 85000000),
(7, 1, '2022-07-01', '2026-06-30', 4800000, 82000000),
(8, 1, '2023-07-01', '2026-06-30', 9500000, 160000000),
(9, 1, '2020-07-01', '2025-06-30', 9700000, 180000000),
(10, 1, '2021-07-01', '2025-06-30', 6000000, 100000000),
(11, 1, '2022-07-01', '2025-06-30', 3000000, 50000000),
(12, 2, '2020-07-01', '2025-06-30', 7000000, 120000000),
(13, 2, '2021-07-01', '2024-06-30', 6800000, 110000000),
(14, 2, '2022-07-01', '2026-06-30', 6500000, 100000000),
(15, 2, '2023-07-01', '2026-06-30', 6000000, 90000000),
(16, 2, '2020-07-01', '2024-06-30', 5700000, 85000000),
(17, 2, '2021-07-01', '2025-06-30', 6200000, 95000000),
(18, 2, '2022-07-01', '2026-06-30', 7800000, 120000000),
(19, 2, '2023-07-01', '2026-06-30', 8000000, 130000000),
(20, 2, '2020-07-01', '2024-06-30', 7300000, 115000000),
(21, 2, '2021-07-01', '2025-06-30', 7500000, 120000000),
(22, 2, '2022-07-01', '2025-06-30', 5000000, 80000000),
(23, 3, '2020-07-01', '2024-06-30', 6800000, 110000000),
(24, 3, '2021-07-01', '2025-06-30', 6200000, 90000000),
(25, 3, '2022-07-01', '2025-06-30', 6000000, 85000000),
(26, 3, '2023-07-01', '2026-06-30', 5900000, 80000000),
(27, 3, '2020-07-01', '2025-06-30', 5800000, 75000000),
(28, 3, '2021-07-01', '2024-06-30', 6300000, 92000000),
(29, 3, '2022-07-01', '2026-06-30', 6400000, 95000000),
(30, 3, '2023-07-01', '2026-06-30', 7000000, 110000000),
(31, 3, '2020-07-01', '2025-06-30', 6700000, 105000000),
(32, 3, '2021-07-01', '2024-06-30', 6900000, 107000000),
(33, 3, '2022-07-01', '2026-06-30', 5100000, 85000000),
(34, 4, '2020-07-01', '2024-06-30', 9200000, 180000000),
(35, 4, '2021-07-01', '2025-06-30', 5800000, 80000000),
(36, 4, '2022-07-01', '2025-06-30', 6200000, 95000000),
(37, 4, '2023-07-01', '2026-06-30', 7500000, 110000000),
(38, 4, '2020-07-01', '2025-06-30', 6000000, 90000000),
(39, 4, '2021-07-01', '2024-06-30', 6300000, 95000000),
(40, 4, '2022-07-01', '2026-06-30', 7000000, 120000000),
(41, 4, '2023-07-01', '2026-06-30', 5400000, 80000000),
(42, 4, '2020-07-01', '2025-06-30', 6700000, 105000000),
(43, 5, '2021-07-01', '2025-06-30', 6900000, 107000000),
(44, 5, '2022-07-01', '2026-06-30', 5100000, 85000000),
(45, 5, '2023-07-01', '2026-06-30', 9200000, 180000000),
(46, 5, '2020-07-01', '2025-06-30', 5800000, 80000000),
(47, 5, '2021-07-01', '2025-06-30', 6200000, 95000000),
(48, 5, '2022-07-01', '2026-06-30', 7500000, 110000000),
(49, 5, '2023-07-01', '2026-06-30', 6000000, 90000000),
(50, 5, '2020-07-01', '2025-06-30', 6300000, 95000000),
(51, 5, '2021-07-01', '2025-06-30', 7000000, 120000000),
(52, 5, '2022-07-01', '2026-06-30', 5400000, 80000000),
(53, 6, '2020-07-01', '2025-06-30', 6700000, 105000000),
(54, 6, '2021-07-01', '2024-06-30', 6900000, 107000000),
(55, 6, '2022-07-01', '2025-06-30', 5100000, 85000000),
(56, 6, '2023-07-01', '2026-06-30', 9200000, 180000000),
(57, 6, '2020-07-01', '2025-06-30', 5800000, 80000000),
(58, 6, '2021-07-01', '2025-06-30', 6200000, 95000000),
(59, 6, '2022-07-01', '2026-06-30', 7500000, 110000000),
(60, 6, '2023-07-01', '2026-06-30', 6000000, 90000000),
(61, 6, '2020-07-01', '2025-06-30', 6300000, 95000000),
(62, 6, '2021-07-01', '2025-06-30', 7000000, 120000000),
(63, 6, '2022-07-01', '2026-06-30', 5400000, 80000000),
(64, 7, '2020-07-01', '2025-06-30', 6700000, 105000000),
(65, 7, '2021-07-01', '2024-06-30', 6900000, 107000000),
(66, 7, '2022-07-01', '2025-06-30', 5100000, 85000000),
(67, 7, '2023-07-01', '2026-06-30', 9200000, 180000000),
(68, 7, '2020-07-01', '2025-06-30', 5800000, 80000000),
(69, 7, '2021-07-01', '2025-06-30', 6200000, 95000000),
(70, 7, '2022-07-01', '2026-06-30', 7500000, 110000000),
(71, 7, '2023-07-01', '2026-06-30', 6000000, 90000000),
(72, 7, '2020-07-01', '2025-06-30', 6300000, 95000000),
(73, 7, '2021-07-01', '2025-06-30', 7000000, 120000000),
(74, 7, '2022-07-01', '2026-06-30', 5400000, 80000000),
(75, 8, '2020-07-01', '2025-06-30', 6700000, 105000000),
(76, 8, '2021-07-01', '2024-06-30', 6900000, 107000000),
(77, 8, '2022-07-01', '2025-06-30', 5100000, 85000000),
(78, 8, '2023-07-01', '2026-06-30', 9200000, 180000000),
(79, 8, '2020-07-01', '2025-06-30', 5800000, 80000000),
(80, 8, '2021-07-01', '2025-06-30', 6200000, 95000000),
(81, 8, '2022-07-01', '2026-06-30', 7500000, 110000000),
(82, 8, '2023-07-01', '2026-06-30', 6000000, 90000000),
(83, 8, '2020-07-01', '2025-06-30', 6300000, 95000000),
(84, 8, '2021-07-01', '2025-06-30', 7000000, 120000000),
(85, 8, '2022-07-01', '2026-06-30', 5400000, 80000000),
(86, 9, '2020-07-01', '2025-06-30', 6700000, 105000000),
(87, 9, '2021-07-01', '2024-06-30', 6900000, 107000000),
(88, 9, '2022-07-01', '2025-06-30', 5100000, 85000000),
(89, 9, '2023-07-01', '2026-06-30', 9200000, 180000000),
(90, 9, '2020-07-01', '2025-06-30', 5800000, 80000000),
(91, 9, '2021-07-01', '2025-06-30', 6200000, 95000000),
(92, 9, '2022-07-01', '2026-06-30', 7500000, 110000000),
(93, 9, '2023-07-01', '2026-06-30', 6000000, 90000000),
(94, 9, '2020-07-01', '2025-06-30', 6300000, 95000000),
(95, 9, '2021-07-01', '2025-06-30', 7000000, 120000000),
(96, 9, '2022-07-01', '2026-06-30', 5400000, 80000000),
(97, 10, '2020-07-01', '2025-06-30', 6700000, 105000000),
(98, 10, '2021-07-01', '2024-06-30', 6900000, 107000000),
(99, 10, '2022-07-01', '2025-06-30', 5100000, 85000000),
(100, 10, '2023-07-01', '2026-06-30', 9200000, 180000000),
(101, 10, '2020-07-01', '2025-06-30', 6700000, 105000000),
(102, 10, '2021-07-01', '2025-06-30', 6900000, 107000000),
(103, 10, '2022-07-01', '2026-06-30', 5100000, 85000000),
(104, 10, '2023-07-01', '2026-06-30', 9200000, 180000000),
(105, 10, '2020-07-01', '2025-06-30', 5800000, 80000000),
(106, 10, '2021-07-01', '2025-06-30', 6200000, 95000000),
(107, 10, '2022-07-01', '2026-06-30', 7500000, 110000000),
(108, 10, '2023-07-01', '2026-06-30', 6000000, 90000000),
(109, 10, '2020-07-01', '2025-06-30', 6300000, 95000000),
(110, 10, '2021-07-01', '2025-06-30', 7000000, 120000000),
(111, 11, '2022-07-01', '2026-06-30', 5400000, 80000000),
(112, 11, '2020-07-01', '2025-06-30', 6700000, 105000000),
(113, 11, '2021-07-01', '2024-06-30', 6900000, 107000000),
(114, 11, '2022-07-01', '2025-06-30', 5100000, 85000000),
(115, 11, '2023-07-01', '2026-06-30', 9200000, 180000000),
(116, 11, '2020-07-01', '2025-06-30', 5800000, 80000000),
(117, 11, '2021-07-01', '2025-06-30', 6200000, 95000000),
(118, 11, '2022-07-01', '2026-06-30', 7500000, 110000000),
(119, 11, '2023-07-01', '2026-06-30', 6000000, 90000000),
(120, 11, '2020-07-01', '2025-06-30', 6300000, 95000000),
(121, 11, '2021-07-01', '2025-06-30', 7000000, 120000000),
(122, 12, '2022-07-01', '2026-06-30', 5400000, 80000000),
(123, 12, '2020-07-01', '2025-06-30', 6700000, 105000000),
(124, 12, '2021-07-01', '2024-06-30', 6900000, 107000000),
(125, 12, '2022-07-01', '2025-06-30', 5100000, 85000000),
(126, 12, '2023-07-01', '2026-06-30', 9200000, 180000000),
(127, 12, '2020-07-01', '2025-06-30', 5800000, 80000000),
(128, 12, '2021-07-01', '2025-06-30', 6200000, 95000000),
(129, 12, '2022-07-01', '2026-06-30', 7500000, 110000000),
(130, 12, '2023-07-01', '2026-06-30', 6000000, 90000000),
(131, 12, '2020-07-01', '2025-06-30', 6300000, 95000000),
(132, 12, '2021-07-01', '2025-06-30', 7000000, 120000000),
(133, 13, '2022-07-01', '2025-06-30', 5400000, 80000000),
(134, 13, '2020-07-01', '2025-06-30', 6700000, 105000000),
(135, 13, '2021-07-01', '2025-06-30', 6900000, 107000000),
(136, 13, '2022-07-01', '2026-06-30', 5100000, 85000000),
(137, 13, '2023-07-01', '2026-06-30', 9200000, 180000000),
(138, 13, '2020-07-01', '2025-06-30', 5800000, 80000000),
(139, 13, '2021-07-01', '2025-06-30', 6200000, 95000000),
(140, 13, '2022-07-01', '2026-06-30', 7500000, 110000000),
(141, 13, '2023-07-01', '2026-06-30', 6000000, 90000000),
(142, 13, '2020-07-01', '2025-06-30', 6300000, 95000000),
(143, 13, '2021-07-01', '2025-06-30', 7000000, 120000000),
(144, 14, '2022-07-01', '2026-06-30', 5400000, 80000000),
(145, 14, '2020-07-01', '2025-06-30', 6700000, 105000000),
(146, 14, '2021-07-01', '2024-06-30', 6900000, 107000000),
(147, 14, '2022-07-01', '2025-06-30', 5100000, 85000000),
(148, 14, '2023-07-01', '2026-06-30', 9200000, 180000000),
(149, 14, '2020-07-01', '2025-06-30', 5800000, 80000000),
(150, 14, '2021-07-01', '2025-06-30', 6200000, 95000000),
(151, 14, '2022-07-01', '2026-06-30', 7500000, 110000000),
(152, 14, '2023-07-01', '2026-06-30', 6000000, 90000000),
(153, 14, '2020-07-01', '2025-06-30', 6300000, 95000000),
(154, 14, '2021-07-01', '2025-06-30', 7000000, 120000000),
(155, 15, '2022-07-01', '2026-06-30', 5400000, 80000000),
(156, 15, '2020-07-01', '2025-06-30', 6700000, 105000000),
(157, 15, '2021-07-01', '2025-06-30', 6900000, 107000000),
(158, 15, '2022-07-01', '2025-06-30', 5100000, 85000000),
(159, 15, '2023-07-01', '2026-06-30', 9200000, 180000000),
(160, 15, '2020-07-01', '2025-06-30', 5800000, 80000000),
(161, 15, '2021-07-01', '2025-06-30', 6200000, 95000000),
(162, 15, '2022-07-01', '2026-06-30', 7500000, 110000000),
(163, 15, '2023-07-01', '2026-06-30', 6000000, 90000000),
(164, 15, '2020-07-01', '2025-06-30', 6300000, 95000000),
(165, 15, '2021-07-01', '2025-06-30', 7000000, 120000000),
(166, 16, '2022-07-01', '2026-06-30', 5400000, 80000000),
(167, 16, '2020-07-01', '2025-06-30', 6700000, 105000000),
(168, 16, '2021-07-01', '2024-06-30', 6900000, 107000000),
(169, 16, '2022-07-01', '2025-06-30', 5100000, 85000000),
(170, 16, '2023-07-01', '2026-06-30', 9200000, 180000000),
(171, 16, '2020-07-01', '2025-06-30', 5800000, 80000000),
(172, 16, '2021-07-01', '2025-06-30', 6200000, 95000000),
(173, 16, '2022-07-01', '2026-06-30', 7500000, 110000000),
(174, 16, '2023-07-01', '2026-06-30', 6000000, 90000000),
(175, 16, '2020-07-01', '2025-06-30', 6300000, 95000000),
(176, 16, '2021-07-01', '2025-06-30', 7000000, 120000000),
(177, 17, '2022-07-01', '2026-06-30', 5400000, 80000000),
(178, 17, '2020-07-01', '2025-06-30', 6700000, 105000000),
(179, 17, '2021-07-01', '2025-06-30', 6900000, 107000000),
(180, 17, '2022-07-01', '2025-06-30', 5100000, 85000000),
(181, 17, '2023-07-01', '2026-06-30', 9200000, 180000000),
(182, 17, '2020-07-01', '2025-06-30', 5800000, 80000000),
(183, 17, '2021-07-01', '2025-06-30', 6200000, 95000000),
(184, 17, '2022-07-01', '2026-06-30', 7500000, 110000000),
(185, 17, '2023-07-01', '2026-06-30', 6000000, 90000000),
(186, 17, '2020-07-01', '2025-06-30', 6300000, 95000000),
(187, 17, '2021-07-01', '2025-06-30', 7000000, 120000000),
(188, 18, '2022-07-01', '2026-06-30', 5400000, 80000000),
(189, 18, '2020-07-01', '2025-06-30', 6700000, 105000000),
(190, 18, '2021-07-01', '2025-06-30', 6900000, 107000000),
(191, 18, '2022-07-01', '2025-06-30', 5100000, 85000000),
(192, 18, '2023-07-01', '2026-06-30', 9200000, 180000000),
(193, 18, '2020-07-01', '2025-06-30', 5800000, 80000000),
(194, 18, '2021-07-01', '2025-06-30', 6200000, 95000000),
(195, 18, '2022-07-01', '2026-06-30', 7500000, 110000000),
(196, 18, '2023-07-01', '2026-06-30', 6000000, 90000000),
(197, 18, '2020-07-01', '2025-06-30', 6300000, 95000000),
(198, 18, '2021-07-01', '2025-06-30', 7000000, 120000000),
(199, 19, '2022-07-01', '2026-06-30', 5400000, 80000000),
(200, 19, '2020-07-01', '2025-06-30', 6700000, 105000000),
(201, 19, '2021-07-01', '2025-06-30', 6900000, 107000000),
(202, 19, '2022-07-01', '2025-06-30', 5100000, 85000000),
(203, 19, '2023-07-01', '2026-06-30', 9200000, 180000000),
(204, 19, '2020-07-01', '2025-06-30', 5800000, 80000000),
(205, 19, '2021-07-01', '2025-06-30', 6200000, 95000000),
(206, 19, '2022-07-01', '2026-06-30', 7500000, 110000000),
(207, 19, '2023-07-01', '2026-06-30', 6000000, 90000000),
(208, 19, '2020-07-01', '2025-06-30', 6300000, 95000000),
(209, 19, '2021-07-01', '2025-06-30', 7000000, 120000000),
(210, 20, '2022-07-01', '2026-06-30', 5400000, 80000000),
(211, 20, '2020-07-01', '2025-06-30', 6700000, 105000000),
(212, 20, '2021-07-01', '2025-06-30', 6900000, 107000000),
(213, 20, '2022-07-01', '2025-06-30', 5100000, 85000000),
(214, 20, '2023-07-01', '2026-06-30', 9200000, 180000000),
(215, 20, '2020-07-01', '2025-06-30', 5800000, 80000000),
(216, 20, '2021-07-01', '2025-06-30', 6200000, 95000000),
(217, 20, '2022-07-01', '2026-06-30', 7500000, 110000000),
(218, 20, '2023-07-01', '2026-06-30', 6000000, 90000000),
(219, 20, '2020-07-01', '2025-06-30', 6300000, 95000000),
(220, 20, '2021-07-01', '2025-06-30', 7000000, 120000000);
