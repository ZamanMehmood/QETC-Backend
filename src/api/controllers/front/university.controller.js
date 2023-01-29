// const Cms = require('../../models/cms.model');
// const UniversityModel = require("../../models/university");

const db = require("../../models");
const University = db.University;
const Campus = db.Campus;
// const Op = db.Sequelize.Op;

// create university
exports.createUniversity = async (req, res, next) => {
  try {
    console.log("REq.body", req.body);
    console.log("req file", req.file);
    //create new record in db
    let university = {
      logo: req.file.filename,
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
    };
    // return res.send(university)
    //save the product in db
    university = await University.create(university);
    console.log("universityId",university)
    // parse arr
    // loop arr (University )

    //  const camp = req.body.campuses;
    console.log("campuss", req.body.campuses);


    // console.log("With    JSON.parse, Is Array -> ", Array.isArray(JSON.parse(tattooGroups)));
    
    const newArr = JSON.parse(req.body.campuses);
    console.log("newArrr",newArr.length)
    const mappedArr = newArr.map(async (ele, ind) => {
      let campus = {
        name: ele.name, 
        address1: ele.address1,
        address2: ele.address2,
        phone: ele.phone,
        email: ele.email,
        isMain: ele.isMain,
        UniversityId: university.dataValues.id
      };
      campus = await Campus.create(campus);
    });
    console.log("mapped arrrr ==>", mappedArr);
    return res.send({
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
exports.listUniversity = async (req, res, next) => {
  try {
    const uni = await University.findAll();
    res.json(uni);
  } catch (err) {
    res.send("University Error " + err);
  }
};

// const arr = [
//   {
//     name: "zaman",
//     address1: "as",
//     address2: "ss",
//     phone: "222",
//     email: "email@gmail.com",
//     isMain: "true"
//   },
//   {
//     name: "zaman",
//     address1: "as",
//     address2: "ss",
//     phone: "222",
//     email: "email@gmail.com",
//     isMain: "true"
//   },
//   {
//     name: "zaman",
//     address1: "as",
//     address2: "ss",
//     phone: "222",
//     email: "email@gmail.com",
//     isMain: "true"
//   }
// ];
// JSON.stringify(arr);
