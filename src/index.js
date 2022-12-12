require('dotenv').config();

const app = require('./app');

const init = async () => {
    await app.listen(app.get('port'));
    console.log('Server on Port', app.get('port'));
}

init();