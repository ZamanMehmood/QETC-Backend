const db = require("../../models");
const Lead = db.Lead;
const ProgrammeDetails = db.ProgrameDetails;

// create lead
exports.createLead = async (req, res, next) => {
  try {
    console.log("Req.body Lead =====>", req.body);
    console.log("Req.body Lead =====>", req.file);

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
      leadId: lead.dataValues.id,
      //  UniversityId: university.dataValues.id
    };
    programmeDetails = await ProgrammeDetails.create(programmeDetails);

    return res.json({
      success: true,
      data: lead,
      message: "Lead created successfully",
    });
  } catch (err) {
    console.log("Error handling =>", err);
    next();
  }
};

// list lead
exports.listLead = async (req, res, next) => {
  try {
    const uni = await Lead.findAndCountAll();
    let { page, limit, name } = req.query;

    console.log("unitt", uni.count);
    console.log("req.queryy", req.query); //name
    const filter = {};

    page = page !== undefined && page !== "" ? parseInt(page) : 1;
    limit = limit !== undefined && limit !== "" ? parseInt(limit) : 10;

    if (name) {
      filter.name = { $LIKE: name, $options: "gi" };
    }

    const total = uni.count;

    if (page > Math.ceil(total / limit) && total > 0)
      page = Math.ceil(total / limit);

    //  console.log("filter",filter)
    const faqs = await Lead.findAll(
      { $WHERE: filter },
      { "$ORDER BY": { createdAt: -1 } },
      { $offest: limit * (page - 1) },
      { $LIMIT: limit }
    );
    // console.log("faqs", faqs);
    // res.send(uni);
    return res.send({
      success: true,
      message: "Leads fetched successfully",
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

//  edit lead 
exports.edit = async (req, res, next) => {
  try {
    let payload = req.body;
    const lead = await Lead.update(
      // Values to update
      payload,
      {
        // Clause
        where: {
          id: payload.id,
        },
      }
    );

    let programme = {
      schoolName: req.body.schoolName,
      qualificationType: req.body.qualificationType,
      selectUniversity: req.body.selectUniversity,
      interestedProgramme: req.body.interestedProgramme,
      status: req.body.status,
      cert: req.body.cert,
      comments: req.body.comments,
      leadId: payload.id,
    };
    console.log("programmassss=>", programme);
    programme = ProgrammeDetails.update(programme, {
      where: {
        id: programme.leadId,
      },
    });

    return res.send({
      success: true,
      message: "lead updated successfully",
      lead,
    });
  } catch (error) {
    return next(error);
  }
};

// API to delete lead
exports.delete = async (req, res, next) => {
  try {
    const { id } = req.params;
    if (id) {
      await ProgrammeDetails.destroy({
        where: { leadId: id },
      });
      const lead = await Lead.destroy({ where: { id: id } });

      if (lead)
        return res.send({
          success: true,
          message: "lead Page deleted successfully",
          id,
        });
      else
        return res.status(400).send({
          success: false,
          message: "lead Page not found for given Id",
        });
    } else
      return res
        .status(400)
        .send({ success: false, message: "lead Id is required" });
  } catch (error) {
    return next(error);
  }
};

// API to get a lead
exports.get = async (req, res, next) => {
  try {
    const { id } = req.params;
    if (id) {
      const lead = await Lead.findByPk(id);
      lead.dataValues.programmeDetails = await ProgrammeDetails.findOne({
        where: {
          leadId: 1,
        },
      });

      if (lead)
        return res.json({
          success: true,
          message: "lead retrieved successfully",
          lead,
        });
      else
        return res.status(400).send({
          success: false,
          message: "lead not found for given Id",
        });
    } else
      return res
        .status(400)
        .send({ success: false, message: "lead Id is required" });
  } catch (error) {
    return next(error);
  }
};
