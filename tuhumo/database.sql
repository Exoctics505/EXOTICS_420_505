CREATE DATABASE IF NOT EXISTS tuhumo_db;
USE tuhumo_db;

-- Categorías
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    imagen_url VARCHAR(500),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL
);

-- Datos de prueba
INSERT INTO categorias (id, nombre) VALUES 
(1, 'Hookahs'),
(2, 'Shisha / Sabores'),
(3, 'Vapes');

INSERT INTO productos (categoria_id, nombre, descripcion, precio, imagen_url) VALUES
(1, 'Hookah Aladin MVP 360', 'Hookah de acero inoxidable premium.', 89.99, 'https://images.unsplash.com/photo-1542332213-9b5a5a3fad35?w=500'),
(2, 'Esencia Menta Fresca 50g', 'Sabor intenso para shisha.', 12.50, 'https://images.unsplash.com/photo-1527016021513-b09758b7773e?w=500'),
(3, 'Pod Desechable 5000 Puffs', 'Vapeador con sabor frutal.', 18.00, 'https://images.unsplash.com/photo-1539185441755-769473a23570?w=500');