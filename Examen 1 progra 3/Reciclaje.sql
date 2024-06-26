
CREATE DATABASE Reciclaje;


USE Reciclaje;

CREATE TABLE TiposReciclaje (
    id_tipo INT  PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);


INSERT INTO TiposReciclaje (tipo) VALUES
    ('lata'),
    ('plastico'),
    ('papel'),
    ('vidrio');


CREATE TABLE ObjetosReciclables (
    id_objeto INT PRIMARY KEY,
    id_tipo INT,
    objeto VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES TiposReciclaje(id_tipo)
);


INSERT INTO ObjetosReciclables (id_tipo, objeto) VALUES
    (1, 'Latas de aluminio'),
    (1, 'Latas de acero'),
    (1, 'Latas de aerosol');


INSERT INTO ObjetosReciclables (id_tipo, objeto) VALUES
    (2, 'PET'),
    (2, 'HDP'),
    (2, 'PVC o Vinil');


INSERT INTO ObjetosReciclables (id_tipo, objeto) VALUES
    (3, 'Periódicos y revistas'),
    (3, 'Cajas y cartones'),
    (3, 'Papel escrito y fotocopias');


INSERT INTO ObjetosReciclables (id_tipo, objeto) VALUES
    (4, 'Botellas de vidrio'),
    (4, 'Frascos de vidrio'),
    (4, 'Tarros de alimentos');
