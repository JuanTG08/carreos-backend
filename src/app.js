const express = require('express');
const cors = require('cors');
const morgan = require('morgan');

const app = express();

// Importamos las Rutas
const users = require('./router/users');
const { error404 } = require('./controllers/error.controller'); // Controlador de Errores
const test = require('./router/test');

// Configuraciones
const PORT = process.env.PORT || 1000;
app.set('port', PORT);

// Middlewars
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// Rutas
app.use('/api/users', users);
app.use('/test', (req, res) => {
    res.json({
        asd: true
    })
})
app.use('*', error404); // Si no da la ruta, de el error 404

module.exports = app;