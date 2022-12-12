const usersCtrl = {};

const { createCar } = require("../model/Users");
const Users = require("../model/Users");
const Utils = require("../utils/Utils");

// Obtenemos todos los Usuarios ** En proceso... *
usersCtrl.listUsers = async (req, res) => {
  await Users.listUsers(res);
};
// Obtenemos un solo usuario ** En proceso... *
usersCtrl.getOneUser = async (req, res) => {
  const { id_user } = req.params;
  await Users.getOne(res, id_user);
};

// Obtenemos un solo usuario pero buscado por el email ** En proceso... *
usersCtrl.getOneUserMail = async (req, res) => {
  const { mail } = req.params;
  const { password } = req.body;
  const data = {
    mail: Utils.veryMail(mail.toLowerCase()),
    password: Utils.STRING(password),
  };
  if (Utils.verifyValues(data)) {
    await Users.getOneMail(res, data);
  } else {
    res.json({
      error: true,
      errorMessage: "Error, los datos estan mal.",
    });
  }
};

// Creamos el usuario
usersCtrl.createUser = async (req, res) => {
  // const { mail, password, fullname, rol = 1 } = req.body;

  const {
    mail,
    password,
    id_rol,
    name,
    last_name,
    number_phone,
    identification_id, // Cedula de Ciudadania
    id_city,
  } = req.body;

  const data = {
    mail: Utils.veryMail(mail),
    password: password.length > 7 ? Utils.STRING(password) : false,
    id_rol,
    name: Utils.STRING(name),
    last_name: Utils.STRING(last_name),
    number_phone: Utils.INT(parseInt(number_phone)),
    identification_id: Utils.INT(parseInt(identification_id)),
    id_city: Utils.INT(parseInt(id_city)),
  };

  // console.log(data);

  if (Utils.verifyValues(data)) {
    // Enviamos los datos al servidor
    const user = await Users.saveUser(data);
    // Si el rol es de Conductor, entonces haga lo siguiente
    if (id_rol === 2 /* Rol del Conductor */ && user.error === false) {
      // Pedimos la informacion correspondiente al vehiculo
      const { placa_car, modelo, foto_car, peso_max } = req.body;
      const dataCar = {
        id_usuario: user.id,
        placa_car,
        modelo,
        foto_car,
        peso_max: Utils.INT(peso_max),
        estado: "Activo"
      }
      if (Utils.verifyValues(dataCar)) {
        const creatingCar = await Users.createCar(dataCar);
        res.json(creatingCar);
      } else {
        const deleteUser = await Users.deleteUser({ id_user: user.id });
        res.json({
          error: true,
          status: 422, // Error en los datos
          message: "Error en los datos ingresados del Vehiculo.",
        });
      }
    } else {
      res.json(user);
    }
  } else {
    res.json({
      error: true,
      status: 422, // Error en los datos
      message: "Error en los datos ingresados.",
    });
  }
};

usersCtrl.deleteUser = async (id_user = false) => {
  if (id_user) {
    const queryDelete = await Users.deleteUser({ id_user });
    res.json({
      error: true,
      status: 422, // Error en los datos
      message: "Error en los datos ingresados del Vehiculo.",
    });
  }
}

module.exports = usersCtrl;
