-- RETO 6: Sistema de Reservas de Vuelos:
-- Estás creando un sistema para gestionar reservas de vuelos. Los usuarios pueden buscar vuelos, seleccionar asientos, realizar reservas, y recibir notificaciones sobre cambios en los horarios de vuelo. ¿Cuáles serían las entidades principales?

CREATE DATABASE reto_6;

USE reto_6;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE flyings(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id INT,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE reserves(
    id INT AUTO_INCREMENT PRIMARY KEY,
    reserves_date TIMESTAMP NOT NULL,
    due_date TIMESTAMP NOT NULL,
    return_date TIMESTAMP,
    user_id INT NOT NULL,
    fly_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (fly_id) REFERENCES flyings(id)
);

CREATE TABLE notifications(
    id INT AUTO_INCREMENT PRIMARY KEY,
    notice VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    fly_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);
