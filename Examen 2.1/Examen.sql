CREATE DATABASE Examen;
GO


USE Examen;
GO

CREATE TABLE Usuarios (
    id_usuario VARCHAR(100) PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL
);

GO

CREATE TABLE Partidos (
    id_partido INT PRIMARY KEY,
    nombre_partido VARCHAR(100) UNIQUE NOT NULL,
    lider VARCHAR(100),
    fundacion DATE,
    CONSTRAINT CK_partido_fundacion CHECK (fundacion <= GETDATE())
);
GO


CREATE TABLE Candidatos (
    id_candidato INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    partido_politico VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    CONSTRAINT CK_candidato_fecha_nacimiento CHECK (fecha_nacimiento <= GETDATE()),
    CONSTRAINT UQ_candidato_nombre_partido UNIQUE (nombre, partido_politico),
    CONSTRAINT FK_candidato_partido FOREIGN KEY (partido_politico) REFERENCES Partidos (nombre_partido)
);
GO


CREATE TABLE Resultados (
    id_resultado INT PRIMARY KEY,
    id_candidato INT NOT NULL,
    cantidad_votos INT NOT NULL,
    CONSTRAINT FK_resultado_candidato FOREIGN KEY (id_candidato) REFERENCES Candidatos (id_candidato),
    CONSTRAINT CK_resultado_votos_positivos CHECK (cantidad_votos >= 0)
);
GO

CREATE TABLE Votos (
    id_voto INT PRIMARY KEY,
    id_candidato INT NOT NULL,
    UsuarioId VARCHAR(100) NOT NULL,
	HaVotado BIT NOT NULL DEFAULT 0,
    fecha_voto DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_voto_candidato FOREIGN KEY (id_candidato) REFERENCES Candidatos (id_candidato),
    CONSTRAINT FK_voto_usuario FOREIGN KEY (UsuarioId) REFERENCES Usuarios (id_usuario)
);

GO


INSERT INTO Partidos (id_partido, nombre_partido, fundacion)
VALUES (1, 'PUSC', '2000-01-01'),
       (2, 'PAC', '2004-03-15'),
       (3, 'PLN', '1995-03-15');
GO


INSERT INTO Candidatos (id_candidato, nombre, partido_politico, fecha_nacimiento)
VALUES (1, 'PIZA', 'PUSC', '1980-05-10'),
       (2, 'ALVARADO', 'PAC', '1975-11-20'),
       (3, 'FIGUERES', 'PLN', '1990-08-15');
GO


INSERT INTO Resultados (id_resultado, id_candidato, cantidad_votos)
VALUES (1, 1, 5000),
       (2, 2, 4500),
       (3, 3, 3000);
GO

INSERT INTO Votos (id_voto, id_candidato, UsuarioId, fecha_voto)
VALUES (5, 3, 5, GETDATE());

INSERT INTO Usuarios (id_usuario, email, contraseña, nombre, apellido)
VALUES (1, 'Juan@gmail.com', '123', 'Juan', 'Estrada');

INSERT INTO Usuarios (id_usuario, email, contraseña, nombre, apellido)
VALUES (2, 'Carlos2@Hotmail.com', '456', 'Carlos', 'Jimenez');

INSERT INTO Usuarios (id_usuario, email, contraseña, nombre, apellido)
VALUES (5, 'vane@hotmail.com', '1010', 'vane', 'rost');

SELECT *
FROM Votos;


SELECT c.nombre AS Candidato, c.partido_politico AS Partido
FROM Candidatos c;
GO


SELECT COUNT(*) AS TotalVotos
FROM Votos;
GO


SELECT * FROM Candidatos WHERE nombre = 'PIZA';
SELECT * FROM Candidatos WHERE nombre = 'FIGUERES';
SELECT * FROM Candidatos WHERE nombre = 'ALVARADO';
SELECT * FROM Candidatos;

