USE appdb;

-- Crear usuario de prueba
CREATE USER 'usuario_prueba'@'%' IDENTIFIED BY '1234';


-- Dar permisos de SELECT, INSERT y UPDATE en todas las tablas
GRANT SELECT, INSERT, UPDATE ON appdb.* TO 'usuario_prueba'@'%';


-- Quitar permiso de DELETE
REVOKE DELETE ON appdb.* FROM 'usuario_prueba'@'%';

FLUSH PRIVILEGES;
