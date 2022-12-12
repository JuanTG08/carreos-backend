const Wallet = {};
const conn = require('../databases/db');

Wallet.createWallet = () => {
    return new Promise ((resolve, reject) => {
        conn.query("INSERT INTO cartera (`id_cartera`, `dinero`) VALUES (NULL, NULL)", (err, row) => {
            if (!err) {
                resolve(row);
            }else {
                resolve(err);
            }
        });
    });
}

module.exports = Wallet;