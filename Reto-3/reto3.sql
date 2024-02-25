-- RETO 3: Plataforma de Aprendizaje en Línea:
-- Piensa en una plataforma en línea donde los estudiantes pueden inscribirse en cursos, ver lecciones, completar tareas y realizar exámenes. ¿Cuáles serían las entidades centrales para una base de datos?

CREATE DATABASE reto_3;

USE reto_3;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    evalUser DOUBLE,
    dateCourse TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    student_id INT,

    FOREIGN KEY (student_id) REFERENCES students(id)
);


CREATE TABLE lessons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    dateCourse TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    course_id INT,

    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    evalUser DOUBLE,
    dateCourse TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lesson_id INT,

    FOREIGN KEY (lesson_id) REFERENCES lessons(id)
);

CREATE TABLE exams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(50),
    evalUser DOUBLE,
    dateExam TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    course_id INT,

    FOREIGN KEY (course_id) REFERENCES courses(id)
);
