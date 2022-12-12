const Users = {};

const conn = require('../databases/db');

Users.listUsers = async (res) => {
    await conn.query("SELECT * FROM usuarios", (err, rows) => {
        if (!err) {
            res.json({
                error: false,
                rows: ((rows.length > 0)?rows:null)
            });
        }else {
            res.json({
                error: true,
                errorBody: err
            });
        }
    });
}

Users.getOne = async (res, id_user) => {
    await conn.query("SELECT * FROM usuarios WHERE id_user=?",[id_user], (err, row) => {
        if (!err) {
            res.json({
                error: false,
                rows: ((row.length > 0)?row:null)
            });
        }else {
            res.json({
                error: true,
                errorBody: err
            })
        }
    });
}

Users.getOneMail = async (res, data) => {
    await conn.query("SELECT * FROM usuarios WHERE mail=? AND password=?", [data.mail, data.password], (err, rows) => {
        if (!err) {
            if (rows.length > 0) {
                res.json({
                    error: false,
                    rows
                });
            }else {
                res.json({
                    error : true,
                    status: 550,
                    errorBody: "No existe ese usuario, por favor verificar los datos."
                });
            }
        }else {
            res.json({
                error : true,
                status: 422, // Error en los datos
                errorBody: err
            });
        }
    });
}

Users.saveUser = (datos) => {
    return new Promise((resolve) => {
        conn.query("INSERT INTO usuarios SET ?", [datos], (err, row) => {
            console.log(err);
            if (!err) {
                resolve({
                    error: false,
                    status: 201,
                    id: row.insertId,
                    message: "ok"
                });
            }else {
                resolve({
                    error: true,
                    status: 1062, // Este error es dado ya que el Correo ya existe o la Cuenta en General
                    message: "Error al crear el usuario.",
                    errorBody: err
                });
            }
        });
    })
}

Users.createCar = (data) => {
    console.log(data);
    return new Promise((resolve) => {
        conn.query("INSERT INTO conductores SET ?", [data], (err, row) => {
            console.log(err);
            if (!err) {
                resolve({
                    error: false,
                    status: 201,
                    id: data.id_usuario,
                    message: "ok"
                });
            }else {
                resolve({
                    error: true,
                    status: 1062, // Este error es dado ya que el Correo ya existe o la Cuenta en General
                    message: "Error al crear el usuario.",
                    errorBody: err,
                });
            }
        });
    });
}

// Se elimina el Usuario de la DB
Users.deleteUser = (id) => {
    return new Promise(resolve => {
        conn.query("DELETE FROM usuarios WHERE ?", [id], (err, row) => {
            if (!err) {
                resolve({
                    error: false,
                    status: 201,
                    message: "ok"
                });
            }else {
                resolve({
                    error: true,
                    status: 500, // El Servidor No sabe como Manejar esto
                    message: "Error al crear el usuario.",
                    errorBody: err,
                });
            }
        });
    });
}

module.exports = Users;