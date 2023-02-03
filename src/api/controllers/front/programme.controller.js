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
        // res.status(500).send({
        //     message:
        //       err.message || "Some error occurred while creating the Tutorial."
        //   });
      // console.log("Error handling =>", err);
      console.log("catch block")
      next();
    }
  };




// list programme
// exports.listProgrammes = async (req, res,next) => {
//   try {
//     const uni = await Programme.findAll();
//     console.log("ppp",uni[0].dataValues.name)
//     res.json(uni);
//   } catch (err) {
//     res.send("programme Error " + err);
//   }
//   // next();
// };

exports.listProgrammes = async (req, res,next) => {
  try {
    const uni = await Programme.findAndCountAll();
   
    let { page, limit, name } = req.query;

    console.log("unitt", uni.count);
    console.log("req.queryy", req.query); //name
    const filter = {};

    page = page !== undefined && page !== "" ? parseInt(page) : 1;
    limit = limit !== undefined && limit !== "" ? parseInt(limit) : 10;

    if (name) {
      filter.name = { $LIKE: name, $options: "gi" };
    };

    const total = uni.count;

    if (page > Math.ceil(total / limit) && total > 0)
      page = Math.ceil(total / limit);

       console.log("filter",filter)
    const faqs = await Programme.findAll(
      { $WHERE: filter },
      { "$ORDER BY": { createdAt: -1 } },
      { $offest: limit * (page - 1) },
      { $LIMIT: limit }
    );
    console.log("faqs", faqs);
    // res.send(uni);
    return res.send({
      success: true,
      message: "FAQs fetched successfully",
      data: {
        faqs,
        pagination: {
          page,
          limit,
          total,
          pages: Math.ceil(total / limit) <= 0 ? 1 : Math.ceil(total / limit),
        },
      },
    });
  } catch (err) {
    res.send("programme Error " + err);
  }
  // next();
};