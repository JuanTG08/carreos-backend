const { Router } = require('express');
const router = new Router;

const { Test } = require('../controllers/test.controller');

router.route('/')
    .get(Test)

module.exports = router;