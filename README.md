# API Cine - Examen Ingreso Backend

## Requisitos

- Node.js instalado
- MySQL instalado

## Instalación

_1._ Clonar el repositorio
_2._ Ejecutar el script _'cinedb_ScriptCrearDB.sql'_ para crear la DB
_3._ Ejecutar el script _'cinedb_LlenarCrearDB'_ para poblar la DB
_4._ Instalar dependencias:
`npm install`
_5._ Crear un archivo con el nombre _'.env'_ y cargar los valores de las variables de entorno como muestra el ejemplo.

- Ejemplo:

```
PORT=8080
DB_PORT=3306
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=root
DB_NAME=cinedb
```

_6._ Ejecutar la API:
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
