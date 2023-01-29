// const Cms = require('../../models/cms.model');
const UniversityController = require("../../models/university");

  // create university
  exports.create = async (req, res, next) => {
    try {
      console.log("REq.body", req.body, req.file);
      //create new record in db
      const university = new UniversityController({
        // logo: req.file.filename,
        // image: req.file.filename,
        name: req.body.name,
        type: req.body.type,
        counserllerName: req.body.counserllerName,
        phone: req.body.phone,
        email: req.body.email,
        visaAppFee: req.body.visaAppFee,
        addmissionFee: req.body.addmissionFee,
        qetcFee: req.body.qetcFee,
        commisionDuration: req.body.commisionDuration,
      });
  
      //save the product in db
      university = await university.save();
      return res.json({
        success: true,
        data: university,
        msg: "university created successfully",
      });
    } catch (err) {
      console.log("Error handling =>", err);
      next();
    }
  };


// list university
exports.listUniversity = async (req, res,next) => {
  try {
    const uni = await UniversityController.find();
    res.json(uni);
  } catch (err) {
    res.send("Product Error " + err);
  }
};


 
  