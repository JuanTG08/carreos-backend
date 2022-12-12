'use strict';
const mysql = require('mysql');

const dbConn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'carreos'
});

dbConn.connect(err => {
    if (err) throw err;
    console.log("Database Connect");
}, 'single');

module.exports = dbConn;