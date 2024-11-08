-- Crear base de datos
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

-- Crear tabla de autores
CREATE TABLE IF NOT EXISTS Autores (
    ID_Autor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    Fecha_Nacimiento DATE
);

-- Crear tabla de categorías
CREATE TABLE IF NOT EXISTS Categorias (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Categoria VARCHAR(50) NOT NULL
);

-- Crear tabla de libros con relaciones
CREATE TABLE IF NOT EXISTS Libros (
    ID_Libro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    ID_Autor INT,
    ID_Categoria INT,
    Año_Publicacion YEAR,
    Disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Telefono VARCHAR(20)
);

-- Crear tabla de préstamos con relaciones
CREATE TABLE IF NOT EXISTS Prestamos (
    ID_Prestamo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Libro INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

-- Insertar datos en la tabla Autores
INSERT INTO Autores (Nombre, Nacionalidad, Fecha_Nacimiento) VALUES
    ('Gabriel García Márquez', 'Colombiano', '1927-03-06'),
    ('J.K. Rowling', 'Británica', '1965-07-31'),
    ('George Orwell', 'Británica', '1903-06-25');

-- Insertar datos en la tabla Categorias
INSERT INTO Categorias (Nombre_Categoria) VALUES
    ('Novela'),
    ('Ciencia Ficción'),
    ('Fantasía'),
    ('Ensayo');

-- Insertar datos en la tabla Libros
INSERT INTO Libros (Titulo, ID_Autor, ID_Categoria, Año_Publicacion, Disponible) VALUES
    ('Cien Años de Soledad', 1, 1, 1967, TRUE),
    ('Harry Potter y la Piedra Filosofal', 2, 3, 1997, TRUE),
    ('La era de 1984', 3, 2, 1949, TRUE);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Direccion, Telefono) VALUES
    ('Carlos Martínez', 'Calle Luna, 123', '123456789'),
    ('Lucía Fernández', 'Avenida Sol, 456', '987654321');

-- Insertar datos en la tabla Prestamos
INSERT INTO Prestamos (ID_Usuario, ID_Libro, Fecha_Prestamo, Fecha_Devolucion) VALUES
    (1, 1, '2024-08-01', '2024-08-15'),
    (2, 2, '2024-08-02', '2024-08-16');

-- Consultar los rgistros

SELECT * FROM Autores;
SELECT * FROM Categorias;
SELECT * FROM Libros;
SELECT * FROM Usuarios;
SELECT * FROM Prestamos;
