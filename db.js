import mysql from 'mysql2';

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'cinedb',
    port: 3306
}).promise(); 


export default pool;


