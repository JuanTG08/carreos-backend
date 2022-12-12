const { Router } = require('express');
const router = Router();

const { listUsers, getOneUser, getOneUserMail, createUser } = require('../controllers/users.controller');
const { error404 } = require('../controllers/error.controller');

router.route('/')
    .get((req, res) => {
        return res.json({asd: "asda"})
    })
    .post(createUser)

/*
/* En proceso Mientras tanto
router.route('/:id/:password')
    .get(listUsers)
*/

/*
/* En proceso Mientras tanto
router.route('/id/:id_user')
    .get(getOneUser)
*/

router.route('/mail/:mail')
    .post(getOneUserMail)

router.route('*')
    .get(error404);

module.exports = router;