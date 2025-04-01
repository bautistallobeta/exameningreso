# API Cine - Examen Ingreso Backend

## Requisitos

- Node.js instalado
- MySQL instalado

## Instalación

1. Clonar el repositorio
2. Ejecutar el script _'cinedb_ScriptCrearDB.sql'_ para crear la DB
3. Ejecutar el script _'cinedb_LlenarCrearDB'_ para poblar la DB
4. Instalar dependencias:
   `npm install`
5. Crear un archivo con el nombre _'.env'_ y cargar los valores de las variables de entorno como muestra el ejemplo.
   - Ejemplo:
   ```
   PORT=8080
   DB_PORT=3306
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=root
   DB_NAME=cinedb
   ```
6. Ejecutar la API:
   `npm start`

## Documentacion

- Se encuentra en la ruta **http://localhost:{PORT}/api-docs**

## Estructura del proyecto:

│── /controllers # Lógica de llamada a stored procedures  
│── /routes # Definición de rutas  
│── app.js # Configuración principal del servidor  
│── db.js # Conexión con la base de datos  
│── package.json # Dependencias y scripts  
│── .env # Variables de entorno  
│── README.md # Documentación

## Consideraciones adicionales
