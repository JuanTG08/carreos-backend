const { Router } = require('express-router');
const error404 = require('../controllers/error404.controller');

const router = Router();

router.route('/')
    .all(error404)

module.exports = router;