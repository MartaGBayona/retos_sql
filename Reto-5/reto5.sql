-- RETO 5: Aplicación de Seguimiento de Ejercicio:
-- Diseña una aplicación que permite a los usuarios realizar un seguimiento de sus actividades físicas. Pueden registrar entrenamientos, establecer metas, ver su progreso a lo largo del tiempo y recibir recomendaciones personalizadas. ¿Cuáles serían las entidades principales?

CREATE DATABASE reto_5;

USE reto_5;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE plannings(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    activities ENUM('run', 'walk', 'swim', 'bike', 'yoga'),
    description VARCHAR(500),
    timeActivitie TIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id INT,

    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE goals(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    evaluate INT NOT NULL,
    description VARCHAR(500),
    date TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id INT,

    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE recomendations(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    description VARCHAR(500),
    date TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id INT,
    planning_id INT,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(planninG_id) REFERENCES plannings(id)
);