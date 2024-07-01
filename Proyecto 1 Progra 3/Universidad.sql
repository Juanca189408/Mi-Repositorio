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
INSERT INTO carrera (nombre) VALUES ('Inform�tica'), ('Biolog�a'), ('Arquitectura'), ('Derecho'), ('Medicina'), ('Econom�a');

INSERT INTO estudiante (cedula, nombre, apellido, edad, email) VALUES
('123', 'Juan Carlos', 'Estrada', 29, 'Carlos@gmail.com'),
('456', 'Eric', 'Calvo', 33, 'Eric@gmail.com');

-- Insertar datos en la tabla materia
INSERT INTO materia (nombre, profesor, costo, carrera_id) VALUES
('Programaci�n Avanzada', 'Profesor Juan Estrada', 50000, 1),
('Bases de Datos', 'Profesora Vanessa Rostran', 50000, 1),
('Redes de Computadoras', 'Profesor Arturo Jimenez', 60000, 1),
('Inteligencia Artificial', 'Profesor Mart�n Ram�rez', 55000, 1),
('Seguridad Inform�tica', 'Profesora Laura Medina', 58000, 1),
('Biolog�a Celular', 'Profesor Andres Carmona', 50000, 2),
('Gen�tica', 'Profesora Maria Espinoza', 50000, 2),
('Ecolog�a', 'Profesor Bejamin Estrada', 50000, 2),
('Bot�nica', 'Profesora Laura Salazar', 48000, 2),
('Zoolog�a', 'Profesor Roberto Garc�a', 49000, 2),
('Dise�o Arquitect�nico', 'Profesora Carla G�mez', 55000, 3),
('Historia de la Arquitectura', 'Profesor Manuel Torres', 52000, 3),
('Materiales de Construcci�n', 'Profesor Luis Mart�nez', 53000, 3),
('Urbanismo', 'Profesor Jos� P�rez', 54000, 3),
('Paisajismo', 'Profesora Ana Guti�rrez', 51000, 3),
('Derecho Civil', 'Profesor Roberto S�nchez', 60000, 4),
('Derecho Penal', 'Profesora Laura Vargas', 58000, 4),
('Derecho Laboral', 'Profesora Ana Ram�rez', 59000, 4),
('Derecho Internacional', 'Profesora Claudia Mart�nez', 57000, 4),
('Derecho Constitucional', 'Profesor David G�mez', 56000, 4),
('Anatom�a Humana', 'Profesora Elena G�mez', 62000, 5),
('Fisiolog�a', 'Profesor Miguel Soto', 61000, 5),
('Patolog�a General', 'Profesora Laura Rodr�guez', 63000, 5),
('Farmacolog�a', 'Profesor Luis Herrera', 64000, 5),
('Cirug�a General', 'Profesor Daniel Rojas', 65000, 5),
('Microeconom�a', 'Profesor Eduardo Cruz', 54000, 6),
('Macroeconom�a', 'Profesora Ana Mart�nez', 55000, 6),
('Econom�a Internacional', 'Profesor Roberto Gonz�lez', 56000, 6),
('Finanzas P�blicas', 'Profesora Laura G�mez', 57000, 6),
('Econom�a del Desarrollo', 'Profesor Juan P�rez', 58000, 6);

Select * from estudiante


--Presenta los datos de la materia pero con el nombre de la carrera
SELECT materia.id, materia.nombre, materia.profesor, materia.costo, carrera.nombre AS carrera FROM materia JOIN carrera
ON 
    materia.carrera_id = carrera.id;

--Presenta cada materia con su respectiva carrera
Select materia.nombre, carrera.nombre from materia join carrera on materia.carrera_id = carrera.id;