const Utils = {};

// Verificacion de los tipos de datos
Utils.STRING = (value) => {
    return (typeof value == "string")?value:undefined;
}
Utils.INT = (value) => {
    return (typeof value == "number")?value:undefined;
}

// Verificacion del Email 
Utils.veryMail = mail => {
    const reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w\w+)+$/;
    if (reg.test(mail) == true) {
        return mail;
    }else {
        return false;
    }
}

// Verificacion de datos
Utils.verifyValues = (values) => {
    let very = true;

    for (let value in values) {
        if (values[value] === undefined || values[value] === false || values[value] === 0 || values[value] === "0") {
            very = false;
            break;
        }
    }

    return very;
}


module.exports = Utils;