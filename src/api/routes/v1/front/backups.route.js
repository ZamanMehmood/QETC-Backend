const express = require("express");
// const controller = require('../../../controllers/front/university.controller');
const controller = require("../../../controllers/front/backup.controller");
const router = express.Router();
const { uploadSingle, cpUpload } = require("../../../utils/upload");

router.route("/create").post( controller.create);
router.route("/list").get(controller.list);
router.route("/restore/:fileName").put(uploadSingle, controller.restore);
router.route("/delete/:fileName").delete(controller.delete);
router.route("/download").delete(controller.download);

 
  

module.exports = router;
