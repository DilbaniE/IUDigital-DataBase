CREATE DATABASE IF NOT EXISTS appdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE appdb;

CREATE TABLE docente (
    Codigo INT NOT NULL AUTO_INCREMENT,
    Documento VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Titulo VARCHAR(100),
    AnosExperiencia INT,
    PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE informatico (
    Codigo INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Tipo ENUM('Frontend', 'Backend', 'Fullstack', 'DevOps', 'Tester') NOT NULL,
    Coste DECIMAL(10,2) NOT NULL,
    Lenguajes VARCHAR(255),
    PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE proyecto (
    Codigo INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Aliado VARCHAR(100),
    Descripcion TEXT,
    Presupuesto DECIMAL(10,2),
    HorasEstimadas INT,
    FechaInicio DATE,
    FechaFin DATE,
    DocenteJefe INT,
    PRIMARY KEY (Codigo),
    CONSTRAINT fk_proyecto_docente FOREIGN KEY (DocenteJefe)
        REFERENCES docente(Codigo) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE gasto (
    Codigo INT NOT NULL AUTO_INCREMENT,
    Descripcion TEXT,
    Fecha DATE NOT NULL,
    Importe DECIMAL(10,2) NOT NULL,
    TipoGasto VARCHAR(100),
    ProyectoCodigo INT NOT NULL,
    PRIMARY KEY (Codigo),
    CONSTRAINT fk_gasto_proyecto FOREIGN KEY (ProyectoCodigo)
        REFERENCES proyecto(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE fase (
    NumeroFase INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    FechaComienzo DATE,
    FechaFin DATE,
    Estado ENUM('Planificada', 'En Progreso', 'Completada', 'Cancelada') NOT NULL,
    ProyectoCodigo INT NOT NULL,
    PRIMARY KEY (NumeroFase),
    CONSTRAINT fk_fase_proyecto FOREIGN KEY (ProyectoCodigo)
        REFERENCES proyecto(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE recurso (
    Codigo INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Tipo ENUM('Humano', 'Material', 'Software', 'Hardware') NOT NULL,
    PeriodoUtilizado VARCHAR(100),
    FaseNumero INT NOT NULL,
    PRIMARY KEY (Codigo),
    CONSTRAINT fk_recurso_fase FOREIGN KEY (FaseNumero)
        REFERENCES fase(NumeroFase) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE producto (
    Codigo INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Finalizado TINYINT(1) DEFAULT 0,
    FaseNumero INT NOT NULL,
    Responsable INT,
    PRIMARY KEY (Codigo),
    CONSTRAINT fk_producto_fase FOREIGN KEY (FaseNumero)
        REFERENCES fase(NumeroFase) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_producto_informatico FOREIGN KEY (Responsable)
        REFERENCES informatico(Codigo) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE informatico_proyecto (
    InformaticoCodigo INT NOT NULL,
    ProyectoCodigo INT NOT NULL,
    HorasAsignadas INT,
    PRIMARY KEY (InformaticoCodigo, ProyectoCodigo),
    CONSTRAINT fk_infoproj_informatico FOREIGN KEY (InformaticoCodigo)
        REFERENCES informatico(Codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_infoproj_proyecto FOREIGN KEY (ProyectoCodigo)
        REFERENCES proyecto(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE informatico_fase (
    InformaticoCodigo INT NOT NULL,
    FaseNumero INT NOT NULL,
    PRIMARY KEY (InformaticoCodigo, FaseNumero),
    CONSTRAINT fk_infofase_informatico FOREIGN KEY (InformaticoCodigo)
        REFERENCES informatico(Codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_infofase_fase FOREIGN KEY (FaseNumero)
        REFERENCES fase(NumeroFase) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM docente;

INSERT INTO docente (Documento, Nombre, Direccion, Titulo, AnosExperiencia) VALUES
('123456789', 'Maria Lopez', 'Calle Falsa 123', 'PhD en Ingenieria de Software', 15),
('987654321', 'Juan Perez', 'Avenida Siempreviva 742', 'Maestro en Gerencia de Proyectos', 10),
('112233445', 'Ana Gomez', 'Carrera 5 #10-20', 'Licenciada en Informatica', 8),
('556677889', 'Carlos Rodriguez', 'Calle 70 #5-15', 'Ingeniero de Sistemas', 20),
('998877665', 'Laura Fernandez', 'Diagonal 45 #8-30', 'Especialista en Bases de Datos', 12),
('223344556', 'David Martinez', 'Avenida 20 #12-50', 'PhD en Ciencias de la Computacion', 18),
('334455667', 'Sofía Ramirez', 'Transversal 15 #30-45', 'Ingeniera de Telecomunicaciones', 9),
('445566778', 'Pablo Sanchez', 'Calle 80 #25-10', 'Magister en Ciberseguridad', 11),
('667788990', 'Valeria Torres', 'Avenida 1 #2-3', 'Ingeniera Industrial', 7),
('778899001', 'Felipe Castro', 'Carrera 10 #20-30', 'Licenciado en Administracion', 5);

INSERT INTO informatico (Nombre, Tipo, Coste, Lenguajes) VALUES
('Pedro Gomez', 'Backend', 50000.00, 'Python, Java'),
('Luisa Hernandez', 'Frontend', 45000.00, 'JavaScript, React'),
('Andres Vargas', 'Fullstack', 60000.00, 'Node.js, SQL, Vue.js'),
('Gabriela Diaz', 'DevOps', 55000.00, 'Docker, Kubernetes, AWS'),
('Ricardo Medina', 'Tester', 40000.00, 'Selenium, Jira'),
('Camila Ortiz', 'Backend', 52000.00, 'C#, .NET'),
('Miguel Romero', 'Frontend', 48000.00, 'Angular, TypeScript'),
('Daniela Morales', 'Fullstack', 62000.00, 'PHP, Laravel'),
('Esteban Ruiz', 'DevOps', 58000.00, 'Azure, Jenkins'),
('Paula Jimenez', 'Tester', 42000.00, 'Cypress, Jest');

INSERT INTO proyecto (Nombre, Aliado, Descripcion, Presupuesto, HorasEstimadas, FechaInicio, FechaFin, DocenteJefe) VALUES
('Sistema de Gestion Academica', 'Universidad XYZ', 'Desarrollo de un sistema para la gestion de notas y cursos.', 250000.00, 1500, '2025-01-10', '2025-12-20', 1),
('App Movil de Salud', 'Clínica ABC', 'Aplicación para el monitoreo de signos vitales en pacientes.', 180000.00, 1200, '2025-03-05', '2025-11-30', 2),
('Plataforma de E-commerce', 'Tienda Virtual S.A.', 'Creación de una plataforma de comercio electronico para una PYME.', 300000.00, 2000, '2025-02-01', '2025-10-15', 3),
('Software de Finanzas Personales', 'Banca Online', 'Herramienta para el seguimiento de gastos y presupuestos personales.', 100000.00, 800, '2025-04-20', '2025-09-30', 4),
('Sistema de Reservas Hoteleras', 'Hoteles Del Sol', 'Software para la gestion de reservas y check-in en hoteles.', 220000.00, 1600, '2025-05-15', '2026-01-31', 5),
('Portal de Noticias Interactivo', 'El Informador', 'Rediseño y desarrollo de un portal de noticias con funciones interactivas.', 150000.00, 1100, '2025-06-01', '2025-12-15', 6),
('Herramienta de Analisis de Datos', 'Empresa BigData', 'Software para el analisis y visualizacion de grandes conjuntos de datos.', 400000.00, 2500, '2025-07-10', '2026-03-20', 7),
('Aplicacion de Gestion de Proyectos', 'Agencia Consultora', 'Aplicacion web para la gestion interna de proyectos y tareas.', 190000.00, 1300, '2025-08-01', '2026-02-28', 8),
('Juego Educativo para Ninos', 'Editorial Educativa', 'Juego movil para ensenar matematicas de forma ludica.', 90000.00, 750, '2025-09-05', '2026-04-10', 9),
('Sistema de Logistica', 'Transportes Rapidos', 'Software para optimizar las rutas de entrega y la gestion de inventario.', 280000.00, 1800, '2025-10-20', '2026-05-31', 10);
