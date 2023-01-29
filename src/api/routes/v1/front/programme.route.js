const express = require('express');
//  const controller = require('../../../controllers/front/university.controller')
const controller = require('../../../controllers/front/programme.controller');
const router = express.Router();

router.route("/createProgramme").post(controller.createProgramme);
router.route("/listProgrammes").get(controller.listProgrammes)

module.exports = router;