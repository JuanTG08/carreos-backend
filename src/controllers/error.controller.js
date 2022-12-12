const errorCtrl = {};

const myErrors = [
    server = [
        {
            error: 550,
            description: "Respuesta Vacia / No existe registro en la base de datos"
        },
    ]
]

errorCtrl.error404 = (req, res) => {
    res.json({
        error: true,
        errorCode: 404,
        errorMessage: "Error 404, pagina no encontrada."
    });
}

module.exports = errorCtrl;