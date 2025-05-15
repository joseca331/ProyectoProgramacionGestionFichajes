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
    posicion enum('Portero', 'Defensa', 'Centrocampista', 'Delantero') not null,
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
    clausula_rescision DECIMAL(12,2),
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


