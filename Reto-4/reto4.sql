-- Sistema de Gestión de Inventarios:
-- Diseña un sistema para gestionar inventarios en un almacén. Debes rastrear productos, gestionar niveles de existencias, realizar pedidos de reposición y registrar movimientos de productos. ¿Cuáles serían las entidades clave?

CREATE DATABASE reto_4;

USE reto_4;

CREATE TABLE products(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(300),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE stock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM ('pending', 'in process', 'on stock'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    product_id INT,

    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE sales(
    id INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM ('pending', 'in process', 'at destination'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    product_id INT,
    buyer_id INT,

    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (buyer_id) REFERENCES buyers(id)
);

CREATE TABLE buyers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);