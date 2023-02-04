const express = require('express');
//  const controller = require('../../../controllers/front/university.controller')
const controller = require('../../../controllers/front/users.controller');
const router = express.Router();

router.route("/createUser").post(controller.createUser);
router.route("/listUsers").get(controller.listUsers)

module.exports = router;