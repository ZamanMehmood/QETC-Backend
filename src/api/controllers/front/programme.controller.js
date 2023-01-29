// const Cms = require('../../models/cms.model');
// const ProgrammeController = require("../../models/university");
// const Programme = require("../../models/programme");



const db = require("../../models");
const Programme = db.Programme;



  exports.createProgramme = async (req, res, next) => {
    try {
      console.log("Req.body programme controller =====>", req.body);
    //   
    
      let programme = {
        name: req.body.name,
        selectUniversity: req.body.selectUniversity,
        programmeLevel: req.body.programmeLevel,
        programmeIntake: req.body.programmeIntake,
        programmeDuration: req.body.programmeDuration,
        programmeCategory: req.body.programmeCategory,
        tutionFee: req.body.tutionFee,
        otherFee: req.body.otherFee,
        engRequirement: req.body.engRequirement,
        entryRequirement: req.body.entryRequirement,
      };

  
      //save the programme in db
      programme = await Programme.create(programme);
      return res.json({
        success: true,
        data: programme,
        msg: "programme created successfully",
      });
    } catch (err) {
        res.status(500).send({
            message:
              err.message || "Some error occurred while creating the Tutorial."
          });
    //   console.log("Error handling =>", err);
      next();
    }
  };

// list programme
exports.listProgrammes = async (req, res,next) => {
  try {
    const uni = await Programme.findAll();
    res.json(uni);
  } catch (err) {
    res.send("programme Error " + err);
  }
};
