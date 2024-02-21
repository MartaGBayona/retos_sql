-- Imagina que estás construyendo una aplicación para gestionar tareas. Los usuarios pueden crear listas de tareas, agregar tareas a esas listas, establecer fechas límite y marcar las tareas como completadas. ¿Cuáles serían las entidades principales?

CREATE DATABASE geeks_hubs;

USE geeks_hubs;
-- crear una tabla users
CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- fecha de creación de registro (TIMESTAMP es un formato de fecha)
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- actualización del registro
);

ALTER TABLE users
	ADD COLUMN is_active BOOLEAN DEFAULT TRUE; -- añadir una columna nueva

ALTER TABLE users
DROP COLUMN is_active;

ALTER TABLE users
	ADD COLUMN is_active BOOLEAN DEFAULT TRUE AFTER password;

CREATE TABLE tasks (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(40) NOT NULL,
    description VARCHAR(200),
    user_id INT,
    status ENUM('pending', 'in-process', 'done'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY(user_id) REFERENCES users(id)
);