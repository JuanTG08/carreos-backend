const driversCtrl = {};
const conn = require('../databases/db');

driversCtrl.saveDrive = async (data) => {
    return new Promise((resolve) => {
        conn.query("INSERT INTO conductores SET ?", [data], (err, row) => {
            if (!err) {
                resolve({
                    error: false,
                    rows: row
                });
            }else {
                resolve({
                    error: true,
                    message: "Error al crear el conductor",
                    errorBody: err
                });
            }
        });
    });
}

module.exports = driversCtrl;