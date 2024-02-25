-- RETO 9: Aplicación de Citas en Línea:
-- Estás desarrollando una aplicación de citas en línea. Los usuarios pueden buscar otros usuarios, enviar mensajes, programar citas y dejar comentarios sobre sus experiencias. ¿Cuáles serían las entidades fundamentales?

CREATE DATABASE reto_9;

USE reto_9;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    birthday DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE messages(
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(500) NOT NULL,
    date TIMESTAMP,
    sender_from INT NOT NULL,
    receiver_to INT NOT NULL,

    FOREIGN KEY (sender_from) REFERENCES users(id),
    FOREIGN KEY (receiver_to) REFERENCES users(id)
);

CREATE TABLE appointments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    date TIMESTAMP,
    status ENUM('pennding', 'in progress', 'success'),
        sender_from INT NOT NULL,
    receiver_to INT NOT NULL,

    FOREIGN KEY (sender_from) REFERENCES users(id),
    FOREIGN KEY (receiver_to) REFERENCES users(id)
);

