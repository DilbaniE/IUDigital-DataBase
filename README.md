# 📌 Evidencia de Aprendizaje 2 – Administración de SGBD  

## 🎯 Objetivo  
Desarrollar un ejercicio práctico de administración en un Sistema de Gestión de Bases de Datos (SGBD) utilizando **MySQL** con **DBeaver**, aplicando:  
✅ Creación de usuarios  
✅ Asignación de permisos  
✅ Copia de seguridad  
✅ Restauración de la base de datos  

---

## 📂 Contenido del Proyecto  

- 🗄️ **Base de datos trabajada:** `proyectos_informaticos`  
- 🛠️ **Herramienta utilizada:** DBeaver (conexión a MySQL)  
- 📑 **Acciones realizadas:**  
  1. 👤 Creación de usuarios con permisos específicos.  
  2. 🔐 Verificación de permisos (SELECT, INSERT, UPDATE, DELETE).  
  3. 💾 Exportación de la base de datos (backup).  
  4. 📝 Inserción de registros adicionales.  
  5. ♻️ Restauración desde el backup.  
  6. 🔎 Comprobación de la restauración.  

---

## 👥 Usuarios Creados  

### 🔹 `usuario_evidencia`
- 📌 Base por defecto: `proyectos_informaticos`  
- **Permisos:**  
  - ✅ SELECT  
  - ❌ INSERT, UPDATE, DELETE  

### 🔹 `usuario_prueba`
- 📌 Base por defecto: `proyectos_informaticos`  
- **Permisos:**  
  - ✅ SELECT, INSERT, UPDATE  
  - ❌ DELETE  

---
## 🔍 Verificación de Acciones

👤 usuario_evidencia:

✅ Puede hacer SELECT

❌ No puede hacer INSERT, UPDATE, DELETE

👤 usuario_prueba:

✅ Puede hacer SELECT, INSERT y UPDATE

❌ No puede hacer DELETE

---
### 💾 Copia de Seguridad

📤 Se exportó la base desde DBeaver en formato .sql.

📂 Archivo generado: proyectos_informaticos_backup.sql.
---

## ♻️ Restauración del Backup

🆕 Crear una nueva base de datos vacía.

📥 Importar el archivo .sql desde DBeaver.

🔎 Verificar que los datos restaurados correspondan al estado previo al backup.

---

## 📊 Resultados
✅ Los usuarios tienen aplicados sus permisos correctamente.

✅ La copia de seguridad se generó exitosamente.

✅ Tras insertar registros adicionales y restaurar, la base volvió al estado del backup.




