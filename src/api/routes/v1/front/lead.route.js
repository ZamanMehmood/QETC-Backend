const express = require("express");
// const controller = require('../../../controllers/front/university.controller');
const controller = require("../../../controllers/front/lead.controller");
const router = express.Router();
const { uploadSingle } = require("../../../utils/upload");

router.route("/createLead").post(uploadSingle, controller.createLead);
router.route("/listLead").get(controller.listLead);
router.route("/edit").put(uploadSingle, controller.edit);
router.route("/delete/:id").delete(controller.delete);
router.route("/get/:id").get(controller.get);
// router.findAll();

// router.route('/create').post(cpUpload, controller.create);

module.exports = router;
