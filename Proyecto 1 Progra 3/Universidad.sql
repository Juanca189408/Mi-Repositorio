Create database Universidad

Use database Universidad

CREATE TABLE carrera (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE estudiante (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE materia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    profesor VARCHAR(100) NOT NULL,
    costo INT NOT NULL,
    carrera_id INT REFERENCES carrera(id)
);

CREATE TABLE pago (
    id INT IDENTITY(1,1) PRIMARY KEY,
    estudiante_cedula VARCHAR(20) REFERENCES estudiante(cedula),
    materia_id INT REFERENCES materia(id),
    monto INT NOT NULL,
    fecha DATE NOT NULL
);

-- Insertar datos en la tabla carrera
INSERT INTO carrera (nombre) VALUES ('Informática'), ('Biología'), ('Arquitectura'), ('Derecho'), ('Medicina'), ('Economía');

INSERT INTO estudiante (cedula, nombre, apellido, edad, email) VALUES
('123', 'Juan Carlos', 'Estrada', 29, 'Carlos@gmail.com'),
('456', 'Eric', 'Calvo', 33, 'Eric@gmail.com');

-- Insertar datos en la tabla materia
INSERT INTO materia (nombre, profesor, costo, carrera_id) VALUES
('Programación Avanzada', 'Profesor Juan Estrada', 50000, 1),
('Bases de Datos', 'Profesora Vanessa Rostran', 50000, 1),
('Redes de Computadoras', 'Profesor Arturo Jimenez', 60000, 1),
('Inteligencia Artificial', 'Profesor Martín Ramírez', 55000, 1),
('Seguridad Informática', 'Profesora Laura Medina', 58000, 1),
('Biología Celular', 'Profesor Andres Carmona', 50000, 2),
('Genética', 'Profesora Maria Espinoza', 50000, 2),
('Ecología', 'Profesor Bejamin Estrada', 50000, 2),
('Botánica', 'Profesora Laura Salazar', 48000, 2),
('Zoología', 'Profesor Roberto García', 49000, 2),
('Diseño Arquitectónico', 'Profesora Carla Gómez', 55000, 3),
('Historia de la Arquitectura', 'Profesor Manuel Torres', 52000, 3),
('Materiales de Construcción', 'Profesor Luis Martínez', 53000, 3),
('Urbanismo', 'Profesor José Pérez', 54000, 3),
('Paisajismo', 'Profesora Ana Gutiérrez', 51000, 3),
('Derecho Civil', 'Profesor Roberto Sánchez', 60000, 4),
('Derecho Penal', 'Profesora Laura Vargas', 58000, 4),
('Derecho Laboral', 'Profesora Ana Ramírez', 59000, 4),
('Derecho Internacional', 'Profesora Claudia Martínez', 57000, 4),
('Derecho Constitucional', 'Profesor David Gómez', 56000, 4),
('Anatomía Humana', 'Profesora Elena Gómez', 62000, 5),
('Fisiología', 'Profesor Miguel Soto', 61000, 5),
('Patología General', 'Profesora Laura Rodríguez', 63000, 5),
('Farmacología', 'Profesor Luis Herrera', 64000, 5),
('Cirugía General', 'Profesor Daniel Rojas', 65000, 5),
('Microeconomía', 'Profesor Eduardo Cruz', 54000, 6),
('Macroeconomía', 'Profesora Ana Martínez', 55000, 6),
('Economía Internacional', 'Profesor Roberto González', 56000, 6),
('Finanzas Públicas', 'Profesora Laura Gómez', 57000, 6),
('Economía del Desarrollo', 'Profesor Juan Pérez', 58000, 6);

Select * from estudiante


--Presenta los datos de la materia pero con el nombre de la carrera
SELECT materia.id, materia.nombre, materia.profesor, materia.costo, carrera.nombre AS carrera FROM materia JOIN carrera
ON 
    materia.carrera_id = carrera.id;

--Presenta cada materia con su respectiva carrera
Select materia.nombre, carrera.nombre from materia join carrera on materia.carrera_id = carrera.id;