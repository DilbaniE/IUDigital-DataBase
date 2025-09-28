-- Esto debe funcionar usuario evidencia
SELECT * FROM docente;

-- Esto debe FALLAR
INSERT INTO docente (Documento, Nombre, Direccion, Titulo, AnosExperiencia)
VALUES ('10863637999', 'Dilbani', 'Pasto', 'Estudiante de Ingenieria de Software', 1);

-- UPDATE (debe FALLAR)
UPDATE docente SET Direccion='Pasto' WHERE Documento = '123456789';

-- DELETE (debe FALLAR)
DELETE FROM docente WHERE Documento = '10863637999';