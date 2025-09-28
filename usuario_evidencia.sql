USE appdb;

-- Crear usuario evidencia
CREATE USER 'usuario_evidencia'@'%' IDENTIFIED BY '1234';

-- Dar permisos solo de SELECT en todas las tablas de appdb
GRANT SELECT ON appdb.* TO 'usuario_evidencia'@'%';


-- Quitar permisos de modificación
REVOKE INSERT, UPDATE, DELETE ON appdb.* FROM 'usuario_evidencia'@'%';