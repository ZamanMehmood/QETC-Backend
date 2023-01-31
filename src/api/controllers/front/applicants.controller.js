const db = require("../../models");
const Applicants = db.Applicants;
const ApplicationDetails = db.ApplicationDetails;

// 
 
 
exports.createApplicant = async (req, res, next) => {

  try {
    console.log("Req.body applicants =====>", req.body);
  console.log("req.files",req.files)

    let applicants = {
      fullName: req.body.fullName,
      email: req.body.email,
      phoneNumber: req.body.phoneNumber,
      address1: req.body.address1,
      address2: req.body.address2,
      country: req.body.country,
      image: req.files.image[0].filename,
      passportNo: req.body.passportNo,
      fileUpload: req.files.fileUpload[0].filename,
    };

    //save the lead in db
    applicants = await Applicants.create(applicants);

//  
    let applicantDetails = {
      applicationLevel: req.body.applicationLevel,
      interestedProgramme: req.body.interestedProgramme,
      schoolName: req.body.schoolName,
      qualificationType: req.body.qualificationType,
      selectUniversity: req.body.selectUniversity,
      completionLetter: req.body.completionLetter,
      programmeLevel: req.body.programmeLevel,
      healthForm: req.body.healthForm,
      paymentReceipt: req.body.paymentReceipt,
      researchProposal: req.body.researchProposal,
      refreeForm: req.body.refreeForm,
      medium: req.body.medium,
      scholorshipForm: req.body.scholorshipForm,
      otherDocuments: req.body.otherDocuments,
      attestationLetter: req.body.attestationLetter,
      releaseLetter: req.body.releaseLetter,
      status: req.body.status,
      ApplicantsId: applicants.dataValues.id,
      //  UniversityId: university.dataValues.id
    };
    applicantDetails = await ApplicationDetails.create(applicantDetails);
    return res.json({
      success: true,
      data: applicants,
      msg: "applicants created successfully",
    });
  } catch (err) {
    res.status(500).send({
      message:
        err.message || "Some error occurred while creating the applicants.",
    });
    //   console.log("Error handling =>", err);
    next();
  }
};

// list programme
exports.listApplicants = async (req, res, next) => {
  try {
    const uni = await Applicants.findAndCountAll();
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

      //  console.log("filter",filter)
    const faqs = await Applicants.findAll(
      { $WHERE: filter },
      { "$ORDER BY": { createdAt: -1 } },
      { $offest: limit * (page - 1) },
      { $LIMIT: limit }
    );
    // console.log("faqs", faqs);
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
};
