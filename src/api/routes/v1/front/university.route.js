const express = require('express');
// const controller = require('../../../controllers/front/university.controller');
const controller = require('../../../controllers/front/university.controller')
const router = express.Router();
const { uploadSingle } = require('../../../utils/upload')


//

// const multer = require('multer');
// const path = require('path');

// const storage = multer.diskStorage({
//   destination: function(req, file, cb) {
//       cb(null, 'uploads/');
//   },

//   filename: function(req, file, cb) {
//       cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
//   } 
// });

// var upload = multer({ storage: storage })

// router.post("/create");
router.route("/create").post(uploadSingle, controller.createUniversity)
router.route("/listUniversity").get(controller.listUniversity)

// router.findAll();


// router.route('/create').post(cpUpload, controller.create);

module.exports = router;