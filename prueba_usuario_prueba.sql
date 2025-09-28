-- Insertando usuario con la cuenta usuario_prueba
INSERT INTO docente (Documento, Nombre, Direccion, Titulo, AnosExperiencia)
VALUES ('1086363799', 'Rosa', 'Pasto', 'Estudiante de Ingenieria de Software', 1);

-- Verificar INSERT
SELECT * FROM docente WHERE Documento='1086363799';

-- Esto debe funcionar
UPDATE docente SET Titulo = 'Graduada de Ingenieria de Software' WHERE Documento = '1086363799';

-- UPDATE (debe funcionar actualizar direccion)
UPDATE docente SET Direccion='Direccion modificada' WHERE Documento='1086363799';

-- Verificar si se actualizo la direccion 
SELECT Direccion FROM docente WHERE Documento='1086363799';

-- Esto debe Fallar al eliminar usuarios
DELETE FROM docente WHERE Documento = '10863637999';