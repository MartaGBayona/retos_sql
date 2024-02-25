-- RETO 7: Aplicación de Compra y Venta de Artículos Usados:
-- Diseña una aplicación donde los usuarios pueden vender y comprar artículos usados. Pueden crear perfiles, listar artículos para la venta, realizar transacciones, y dejar reseñas sobre los vendedores. ¿Cuáles serían las entidades clave?

CREATE DATABASE reto_7;

USE reto_7;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name ENUM('client', 'seller') NOT NULL,
    user_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE items(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id INT,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE reviews(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(500) NOT NULL,
    puntuation INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
);
