import swaggerJSDoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express';

const swaggerDefinition = {
  openapi: '3.0.0', 
  info: {
    title: 'API Salas de Cine',
    version: '1.0.0',
    description: 'Examen de Ingreso Backend. API para consultas de peliculas y funciones, y reservas de las mismas.',
    contact: {
        name: 'Llobeta, Bautista J.  -  llobetabautista@gmail.com',
        email: 'llobetabautista@gmail.com'
    },
  },
    servers: [
        {
        url: 'http://localhost:8080', 
        description: 'Servidor local'
        }        
    ],
};

const options = {
    swaggerDefinition,
    // Ruta donde buscar la especificacion de la API
    apis: ['./routes/*.js'],
};

//Función que toma la configuración y genera un objeto JSON con la documentación de la API
const swaggerSpec = swaggerJSDoc(options);

// Se crea la ruta /api-docs para ver la documentacion generada
export default (app) => {
    app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};
