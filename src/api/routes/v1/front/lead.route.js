const express = require('express');
// const controller = require('../../../controllers/front/university.controller');
const controller = require('../../../controllers/front/lead.controller')
const router = express.Router();
const { uploadSingle } = require('../../../utils/upload')

router.route("/createLead").post(uploadSingle, controller.createLead)
router.route("/listLead").get(controller.listLead)

// router.findAll();


// router.route('/create').post(cpUpload, controller.create);

module.exports = router;