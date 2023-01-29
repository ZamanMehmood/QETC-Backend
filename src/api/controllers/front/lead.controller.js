// const db = require("../../models");
// const Lead = db.Lead;

//   exports.createLead = async (req, res, next) => {
//     try {
//       console.log("Req.body Lead =====>", req.body);
//     //

//       let lead = {
//         image: req.file.filename,
//         name: req.body.name,
//         passportNo: req.body.passportNo,
//         leadGroup: req.body.leadGroup,
//         country: req.body.country,
//         phoneNo: req.body.phoneNo,
//         email: req.body.email,
//         refferalName: req.body.refferalName,
//         refferalEmail: req.body.refferalEmail,
//       };

//       //save the lead in db
//       lead = await Lead.create(lead);
//       return res.json({
//         success: true,
//         data: lead,
//         msg: "lead created successfully",
//       });
//     } catch (err) {
//         res.status(500).send({
//             message:
//               err.message || "Some error occurred while creating the Tutorial."
//           });
//     //   console.log("Error handling =>", err);
//       next();
//     }
//   };

// // list programme
// exports.listLead = async (req, res,next) => {
//   try {
//     const uni = await Lead.findAll();
//     res.json(uni);
//   } catch (err) {
//     res.send("programme Error " + err);
//   }
// };

const db = require("../../models");
const Lead = db.Lead;
const ProgrammeDetails = db.ProgrameDetails;

exports.createLead = async (req, res, next) => {
  try {
    console.log("Req.body Lead =====>", req.body);
    //

    let lead = {
      image: req.file.filename,
      name: req.body.name,
      passportNo: req.body.passportNo,
      leadGroup: req.body.leadGroup,
      country: req.body.country,
      phoneNo: req.body.phoneNo,
      email: req.body.email,
      refferalName: req.body.refferalName,
      refferalEmail: req.body.refferalEmail,
    };

    //save the lead in db
    lead = await Lead.create(lead);

    // console.log("newArrr",newArr.length)
    let programmeDetails = {
      schoolName: req.body.schoolName,
      qualificationType: req.body.qualificationType,
      selectUniversity: req.body.selectUniversity,
      interestedProgramme: req.body.interestedProgramme,
      status: req.body.status,
      cert: req.body.cert,
      comments: req.body.comments,

      //  UniversityId: university.dataValues.id
    };
    programmeDetails = await ProgrammeDetails.create(programmeDetails);

    return res.json({
      success: true,
      data: lead,
      msg: "lead created successfully",
    });
  } catch (err) {
    res.status(500).send({
      message:
        err.message || "Some error occurred while creating the Tutorial.",
    });
    //   console.log("Error handling =>", err);
    next();
  }
};

// list programme
exports.listLead = async (req, res, next) => {
  try {
    const uni = await Lead.findAll();
    res.json(uni);
  } catch (err) {
    res.send("programme Error " + err);
  }
};
